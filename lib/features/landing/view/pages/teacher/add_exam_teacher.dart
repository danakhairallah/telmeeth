// المسار المقترح: features/landing/view/pages/teacher/add_exam_teacher.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_exam_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_exam_request.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class AddExamTeacherPage extends StatefulWidget {
  final int classTeacherId;
  const AddExamTeacherPage({super.key, required this.classTeacherId});

  @override
  State<AddExamTeacherPage> createState() => _AddExamTeacherPageState();
}

class _AddExamTeacherPageState extends State<AddExamTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _markCtrl = TextEditingController();
  final _durationCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  String? _type; // مثلاً: "midterm", "final" إلخ

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _markCtrl.dispose();
    _durationCtrl.dispose();
    _dateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة امتحان"),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_titleCtrl, "عنوان الامتحان", "أدخل عنوان الامتحان", validator: (v) => v!.isEmpty ? "العنوان مطلوب" : null),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              _buildTextField(_descCtrl, "الوصف", "أدخل وصف الامتحان"),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              _buildTextField(_markCtrl, "العلامة", "مثال: 100", keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? "العلامة مطلوبة" : null),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              _buildTextField(_durationCtrl, "المدة بالدقائق", "مثال: 60", keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? "المدة مطلوبة" : null),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              _buildTextField(_dateCtrl, "تاريخ ووقت الامتحان", "مثال: 2026-02-10 10:00", keyboardType: TextInputType.datetime, validator: (v) => v!.isEmpty ? "التاريخ مطلوب" : null),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              DropdownButtonFormField<String>(
                value: _type,
                items: [
                  DropdownMenuItem(value: "midterm", child: Text("منتصف الفصل")),
                  DropdownMenuItem(value: "final", child: Text("نهائي")),
                  DropdownMenuItem(value: "quiz", child: Text("Quiz")),
                ],
                decoration: InputDecoration(
                  labelText: "نوع الامتحان",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 8)),
                  ),
                ),
                validator: (v) => v == null ? "النوع مطلوب" : null,
                onChanged: (v) => setState(() => _type = v),
              ),
              SizedBox(height: ResponsiveValues.h(context, 3)),
              Consumer<TeacherExamController>(
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
                        final req = TeacherExamRequest(
                          classTeacherId: widget.classTeacherId,
                          title: _titleCtrl.text,
                          description: _descCtrl.text,
                          mark: int.tryParse(_markCtrl.text),
                          duration: int.tryParse(_durationCtrl.text),
                          dateTime: _dateCtrl.text,
                          type: _type,
                        );
                        await ctrl.addTeacherExam(req);
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
                        : Text("إضافة"),
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
