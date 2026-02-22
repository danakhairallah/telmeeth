import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_exam_controller.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_model.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_exam_request.dart';
// لو عندك ResponsiveValues استوردهم

class EditExamTeacherPage extends StatefulWidget {
  final ExamDataT exam;
  const EditExamTeacherPage({super.key, required this.exam});

  @override
  State<EditExamTeacherPage> createState() => _EditExamTeacherPageState();
}

class _EditExamTeacherPageState extends State<EditExamTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _markCtrl;
  late TextEditingController _durationCtrl;
  late TextEditingController _dateTimeCtrl;
  late String _type;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.exam.title ?? "");
    _descCtrl = TextEditingController(text: widget.exam.description ?? "");
    _markCtrl = TextEditingController(text: widget.exam.mark?.toString() ?? "");
    _durationCtrl = TextEditingController(text: widget.exam.duration?.toString() ?? "");
    _dateTimeCtrl = TextEditingController(text: widget.exam.dateTime ?? "");
    _type = widget.exam.type ?? "Exam";
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _markCtrl.dispose();
    _durationCtrl.dispose();
    _dateTimeCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_formKey.currentState?.validate() != true) return;

    final request = TeacherExamRequest(
      classTeacherId: widget.exam.classTeacherId,
      title: _titleCtrl.text.trim(),
      description: _descCtrl.text.trim(),
      mark: int.tryParse(_markCtrl.text.trim()) ?? 0,
      duration: int.tryParse(_durationCtrl.text.trim()) ?? 0,
      dateTime: _dateTimeCtrl.text.trim(),
      type: _type,
    );
    final ctrl = context.read<TeacherExamController>();
    await ctrl.editTeacherExam(widget.exam.id!, request);
    Navigator.pop(context); // بعد التعديل ارجع للوراء
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الامتحان'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // غيّرها إذا عندك ResponsiveValues
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // العنوان
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(labelText: 'العنوان'),
                validator: (v) => v!.isEmpty ? 'ادخل عنوان الامتحان' : null,
              ),
              SizedBox(height: 12),

              // الوصف
              TextFormField(
                controller: _descCtrl,
                decoration: InputDecoration(labelText: 'الوصف'),
                minLines: 2,
                maxLines: 4,
              ),
              SizedBox(height: 12),

              // العلامة
              TextFormField(
                controller: _markCtrl,
                decoration: InputDecoration(labelText: 'العلامة الكاملة'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'ادخل العلامة' : null,
              ),
              SizedBox(height: 12),

              // المدة بالدقائق
              TextFormField(
                controller: _durationCtrl,
                decoration: InputDecoration(labelText: 'المدة (دقائق)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'ادخل المدة' : null,
              ),
              SizedBox(height: 12),

              // التاريخ/الوقت (يمكنك تغييره لـ DatePicker)
              TextFormField(
                controller: _dateTimeCtrl,
                decoration: InputDecoration(labelText: 'التاريخ والوقت (YYYY-MM-DD HH:MM)'),
                validator: (v) => v!.isEmpty ? 'ادخل التاريخ والوقت' : null,
                onTap: () async {
                  // إذا بدك تفتح DatePicker اكتب الكود هنا
                },
              ),
              SizedBox(height: 12),

              // نوع الامتحان
              DropdownButtonFormField<String>(
                value: _type,
                decoration: InputDecoration(labelText: "نوع الامتحان"),
                items: ['Exam', 'Quiz', 'Midterm', 'Final'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (val) => setState(() => _type = val ?? 'Exam'),
              ),
              SizedBox(height: 20),

              // زر الحفظ
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  child: Text('حفظ التعديلات'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
