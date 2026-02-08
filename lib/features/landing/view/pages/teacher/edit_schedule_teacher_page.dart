import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/schedule_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/schedule_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_model.dart';

class EditScheduleTeacherPage extends StatefulWidget {
  final ScheduleData schedule;

  const EditScheduleTeacherPage({super.key, required this.schedule});

  @override
  State<EditScheduleTeacherPage> createState() =>
      _EditScheduleTeacherPageState();
}

class _EditScheduleTeacherPageState extends State<EditScheduleTeacherPage> {
  late TextEditingController titleCtrl;
  late TextEditingController descCtrl;
  late TextEditingController dateCtrl;
  late TextEditingController statusCtrl;

  @override
  void initState() {
    super.initState();

    titleCtrl = TextEditingController(text: widget.schedule.title);
    descCtrl = TextEditingController(text: widget.schedule.description);
    dateCtrl = TextEditingController(text: widget.schedule.dateTime);
    statusCtrl = TextEditingController(text: widget.schedule.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Schedule")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleCtrl, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: descCtrl, decoration: InputDecoration(labelText: "Description")),
            TextField(controller: dateCtrl, decoration: InputDecoration(labelText: "Date Time")),
            TextField(controller: statusCtrl, decoration: InputDecoration(labelText: "Status")),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final request = ScheduleTeacherRequest(
                  title: titleCtrl.text,
                  description: descCtrl.text,
                  dateTime: dateCtrl.text,
                  status: statusCtrl.text,
                );

                await context
                    .read<ScheduleTeacherController>()
                    .updateSchedule(widget.schedule.id!, request);

                // تحديث القائمة
                context.read<ScheduleTeacherController>().fetchSchedules();

                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
