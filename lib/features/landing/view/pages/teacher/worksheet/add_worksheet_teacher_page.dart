import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_teacher_request.dart';

class AddWorksheetTeacherPage extends StatefulWidget {
  final int classId;
  const AddWorksheetTeacherPage({Key? key, required this.classId}) : super(key: key);

  @override
  State<AddWorksheetTeacherPage> createState() => _AddWorksheetTeacherPageState();
}

class _AddWorksheetTeacherPageState extends State<AddWorksheetTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  String? typeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Worksheet')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Worksheet Title'),
                validator: (v) => v == null || v.isEmpty ? 'Enter title' : null,
              ),
              DropdownButtonFormField<String>(
                value: typeValue,
                decoration: InputDecoration(labelText: 'Type'),
                items: ['multi', 'essay']
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                onChanged: (v) => setState(() => typeValue = v),
                validator: (v) => v == null ? 'Select type' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final req = WorksheetTeacherRequest(
                    title: titleController.text,
                    type: typeValue,
                    unitId: null, // ضع القيم حسب الحاجة
                    lessonId: null,
                  );
                  await context.read<WorksheetTeacherController>().addWorksheet(req);
                  Navigator.pop(context); // عد للقائمة
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
