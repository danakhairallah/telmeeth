import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/schedule_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/schedule_teacher_request.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class AddScheduleTeacherPage extends StatefulWidget {
  final int teacherId;
  const AddScheduleTeacherPage({super.key, required this.teacherId});

  @override
  State<AddScheduleTeacherPage> createState() => _AddScheduleTeacherPageState();
}

class _AddScheduleTeacherPageState extends State<AddScheduleTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _statusCtrl = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _dateCtrl.dispose();
    _statusCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Schedule'),
        backgroundColor: Colors.orange.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.w(context, 6)),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (v) => (v == null || v.isEmpty) ? 'Enter title' : null,
              ),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              TextFormField(
                controller: _descCtrl,
                decoration: InputDecoration(labelText: 'Description'),
                minLines: 1,
                maxLines: 3,
              ),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              TextFormField(
                controller: _dateCtrl,
                decoration: InputDecoration(labelText: 'Date/Time'),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    _dateCtrl.text = picked.toIso8601String();
                  }
                },
                validator: (v) => (v == null || v.isEmpty) ? 'Enter date/time' : null,
              ),
              SizedBox(height: ResponsiveValues.h(context, 2)),
              TextFormField(
                controller: _statusCtrl,
                decoration: InputDecoration(labelText: 'Status'),
              ),
              SizedBox(height: ResponsiveValues.h(context, 4)),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                  if (!_formKey.currentState!.validate()) return;

                  setState(() => isLoading = true);
                  final req = ScheduleTeacherRequest(
                    title: _titleCtrl.text,
                    description: _descCtrl.text,
                    dateTime: _dateCtrl.text,
                    status: _statusCtrl.text,
                  );

                  final result = await context
                      .read<ScheduleTeacherController>()
                      .addSchedule(req);

                  setState(() => isLoading = false);

                  if (result != null && result.success == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Schedule Added!')),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error adding schedule')),
                    );
                  }
                },
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
