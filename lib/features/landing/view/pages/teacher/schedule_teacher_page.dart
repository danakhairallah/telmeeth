import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/schedule_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/add_schedule_teacher_page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/edit_schedule_teacher_page.dart';

class ScheduleTeacherPage extends StatefulWidget {
  final int teacherId;
  const ScheduleTeacherPage({super.key, required this.teacherId});

  @override
  State<ScheduleTeacherPage> createState() => _ScheduleTeacherPageState();
}

class _ScheduleTeacherPageState extends State<ScheduleTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ScheduleTeacherController>().fetchSchedules();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedule'),
        backgroundColor: Colors.orange.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<ScheduleTeacherController>(
        builder: (context, ctrl, _) {
          if (ctrl.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<ScheduleData> schedules =
          (ctrl.schedulesModel?.scheduleData ?? [])
              .where((s) => s.teacherId == widget.teacherId)
              .toList();

          if (schedules.isEmpty) {
            return const Center(child: Text('No schedule found.'));
          }

          return ListView.separated(
            padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
            separatorBuilder: (_, __) => SizedBox(height: ResponsiveValues.h(context, 2)),
            itemCount: schedules.length,
            itemBuilder: (context, i) {
              final s = schedules[i];
              return Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 12)),
                ),
                child: ListTile(
                  title: Text(
                    s.title ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveValues.font(context, 17),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${s.dateTime ?? "-"}'),
                      if (s.description != null && s.description!.trim().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text('Details: ${s.description}'),
                        ),
                      Text('Status: ${s.status ?? "-"}'),
                    ],
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditScheduleTeacherPage(schedule: s),
                            ),
                          );
                        },
                      ),

                      // 🗑️ حذف
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _confirmDelete(context, s.id!);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade700,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddScheduleTeacherPage(teacherId: widget.teacherId),
            ),
          );
        },
      ),
    );
  }
}
void _confirmDelete(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Delete Schedule"),
      content: Text("Are you sure you want to delete this schedule?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            await context
                .read<ScheduleTeacherController>()
                .deleteSchedule(id);

            Navigator.pop(context);

            context.read<ScheduleTeacherController>().fetchSchedules();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Delete"),
        ),
      ],
    ),
  );
}
