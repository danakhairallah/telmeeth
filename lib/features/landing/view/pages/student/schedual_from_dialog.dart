import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/schedual_controller.dart';
import 'package:telmeeth/core/api/model/request/schrdual_request.dart';
import 'package:telmeeth/core/api/model/response/schedual_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/app_primary_button.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/custom_textfiled.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student/label_text.dart';
import 'package:telmeeth/core/widgets/student/navigation.dart';
import 'package:telmeeth/core/widgets/student/student_app_bar.dart';

class ScheduleFormDialog extends StatefulWidget {
  final ScheduleModel? schedule;

  const ScheduleFormDialog({super.key, this.schedule});

  @override
  State<ScheduleFormDialog> createState() => _ScheduleFormDialogState();
}

class _ScheduleFormDialogState extends State<ScheduleFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController taskController;
  late TextEditingController descriptionController;
  late TextEditingController dayController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  String status = "pending";

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController(text: widget.schedule?.task ?? "");
    descriptionController =
        TextEditingController(text: widget.schedule?.description ?? "");
    dayController = TextEditingController(text: widget.schedule?.day ?? "");
    startTimeController =
        TextEditingController(text: widget.schedule?.startTime ?? "");
    endTimeController =
        TextEditingController(text: widget.schedule?.endTime ?? "");
    status = widget.schedule?.status ?? "pending";
  }

  @override
  void dispose() {
    taskController.dispose();
    descriptionController.dispose();
    dayController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400, // الحد الأقصى للعرض
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.schedule == null ? "Add Schedule" : "Edit Schedule",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: taskController,
                    decoration: const InputDecoration(labelText: "Task"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: "Description"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: dayController,
                    decoration: const InputDecoration(labelText: "Day"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: startTimeController,
                    decoration: const InputDecoration(labelText: "Start Time"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: endTimeController,
                    decoration: const InputDecoration(labelText: "End Time"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: status,
                    items: ["pending", "in_progress", "completed"]
                        .map((s) => DropdownMenuItem(
                      value: s,
                      child: Text(s),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) setState(() => status = value);
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final newSchedule = ScheduleModel(
                              id: widget.schedule?.id ?? 0,
                              studentId: widget.schedule?.studentId ?? 0,
                              task: taskController.text,
                              description: descriptionController.text,
                              day: dayController.text,
                              startTime: startTimeController.text,
                              endTime: endTimeController.text,
                              status: status,
                              createdAt:
                              widget.schedule?.createdAt ?? DateTime.now(),
                              updatedAt: DateTime.now(),
                            );
                            Navigator.pop(context, newSchedule);
                          }
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
