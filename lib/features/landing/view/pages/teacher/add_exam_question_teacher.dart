// المسار المقترح: features/landing/view/pages/teacher/add_exam_question_teacher.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/exam_question_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/exam_question_teacher_request.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class AddExamQuestionTeacherPage extends StatefulWidget {
  final int examId;
  const AddExamQuestionTeacherPage({super.key, required this.examId});

  @override
  State<AddExamQuestionTeacherPage> createState() => _AddExamQuestionTeacherPageState();
}

class _AddExamQuestionTeacherPageState extends State<AddExamQuestionTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final _questionCtrl = TextEditingController();
  final _hintCtrl = TextEditingController();
  final _markCtrl = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _imageFile = File(picked.path));
  }

  @override
  void dispose() {
    _questionCtrl.dispose();
    _hintCtrl.dispose();
    _markCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة سؤال مقالي"),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_questionCtrl, "نص السؤال", "أدخل السؤال", validator: (v) => v!.isEmpty ? "السؤال مطلوب" : null),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              _buildTextField(_hintCtrl, "تلميحة (اختياري)", "أدخل تلميحة"),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              _buildTextField(_markCtrl, "العلامة", "مثال: 10", keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? "العلامة مطلوبة" : null),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              Row(
                children: [
                  _imageFile != null
                      ? Image.file(_imageFile!, width: 80, height: 80, fit: BoxFit.cover)
                      : Container(width: 80, height: 80, color: Colors.grey.shade200, child: Icon(Icons.image, color: Colors.grey)),
                  SizedBox(width: ResponsiveValues.w(context, 2)),
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.upload_file),
                    label: Text("إرفاق صورة"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveValues.h(context, 3)),
              Consumer<ExamQuestionTeacherController>(
                builder: (context, ctrl, _) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: ResponsiveValues.h(context, 2),
                      ),
                      textStyle: TextStyle(fontSize: ResponsiveValues.font(context, 17)),
                    ),
                    onPressed: ctrl.isLoading ? null : () async {
                      if (_formKey.currentState!.validate()) {
                        final req = QuestionRequest(
                          question: _questionCtrl.text,
                          hint: _hintCtrl.text,
                          mark: int.tryParse(_markCtrl.text),
                          image: _imageFile,
                        );
                        await ctrl.addExamQuestion(widget.examId, req);
                        if (ctrl.postResult?.success == true) {
                          Navigator.pop(context, true);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(ctrl.postResult?.message ?? "فشل الإضافة")),
                          );
                        }
                      }
                    },
                    child: ctrl.isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("إضافة السؤال"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      String hint, {
        TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 8)),
        ),
      ),
    );
  }
}
