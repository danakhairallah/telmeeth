import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_multi_question_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_multi_question_request.dart';

class AddMultiQuestionTeacherPage extends StatefulWidget {
  final int worksheetId;
  const AddMultiQuestionTeacherPage({Key? key, required this.worksheetId}) : super(key: key);

  @override
  State<AddMultiQuestionTeacherPage> createState() => _AddMultiQuestionTeacherPageState();
}

class _AddMultiQuestionTeacherPageState extends State<AddMultiQuestionTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final questionController = TextEditingController();
  final option1Controller = TextEditingController();
  final option2Controller = TextEditingController();
  final option3Controller = TextEditingController();
  final option4Controller = TextEditingController();
  String? correctAnswer; // نضع هنا نص الجواب الصحيح

  @override
  Widget build(BuildContext context) {
    // قائمة الخيارات حسب تعبئة المستخدم
    List<String> getOptions() {
      final opts = [
        option1Controller.text,
        option2Controller.text,
        option3Controller.text,
        option4Controller.text,
      ].where((x) => x.trim().isNotEmpty).toList();
      return opts;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Multi Question'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: questionController,
                decoration: const InputDecoration(labelText: 'Question'),
                validator: (v) => v == null || v.isEmpty ? 'Enter question' : null,
              ),
              TextFormField(
                controller: option1Controller,
                decoration: const InputDecoration(labelText: 'Option 1'),
                validator: (v) => v == null || v.isEmpty ? 'Enter option 1' : null,
                onChanged: (_) => setState(() {}),
              ),
              TextFormField(
                controller: option2Controller,
                decoration: const InputDecoration(labelText: 'Option 2'),
                validator: (v) => v == null || v.isEmpty ? 'Enter option 2' : null,
                onChanged: (_) => setState(() {}),
              ),
              TextFormField(
                controller: option3Controller,
                decoration: const InputDecoration(labelText: 'Option 3 (Optional)'),
                onChanged: (_) => setState(() {}),
              ),
              TextFormField(
                controller: option4Controller,
                decoration: const InputDecoration(labelText: 'Option 4 (Optional)'),
                onChanged: (_) => setState(() {}),
              ),
              // قائمة ديناميكية لاختيار نص الجواب الصحيح فقط من المدخلات الموجودة
              DropdownButtonFormField<String>(
                value: correctAnswer,
                decoration: const InputDecoration(labelText: 'Correct Answer'),
                items: getOptions().map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
                onChanged: (v) => setState(() => correctAnswer = v),
                validator: (v) => v == null || v.isEmpty ? 'Select correct answer' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                child: const Text('Save'),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final options = getOptions();
                  final req = WorksheetMultiQuestionRequest(
                    question: questionController.text,
                    options: options,
                    correctAnswer: correctAnswer!,
                    // images: [], // تقدر تضيفها لاحقا إذا بدك صور
                  );
                  await context.read<WorksheetMultiQuestionController>().addMultiQuestion(widget.worksheetId, req);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
