import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_essay_question_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_essay_question_request.dart';

class AddEssayQuestionTeacherPage extends StatefulWidget {
  final int worksheetId;
  const AddEssayQuestionTeacherPage({Key? key, required this.worksheetId}) : super(key: key);

  @override
  State<AddEssayQuestionTeacherPage> createState() => _AddEssayQuestionTeacherPageState();
}

class _AddEssayQuestionTeacherPageState extends State<AddEssayQuestionTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final questionController = TextEditingController();
  final hintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Essay Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: questionController,
                decoration: const InputDecoration(labelText: 'Essay Question'),
                validator: (v) => v == null || v.isEmpty ? 'Enter question' : null,
              ),
              TextFormField(
                controller: hintController,
                decoration: const InputDecoration(labelText: 'Hint (اختياري)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Save'),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final req = WorksheetEssayQuestionRequest(
                    question: questionController.text,
                    hint: hintController.text,
                  );
                  await context.read<WorksheetEssayQuestionController>().addEssayQuestion(widget.worksheetId, req);
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
