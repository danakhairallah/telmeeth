import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/task_teacher_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class TasksOfClassTeacherPage extends StatefulWidget {
  final int classId; // لازم تمرر classId عند فتح الصفحة
  const TasksOfClassTeacherPage({super.key, required this.classId});

  @override
  State<TasksOfClassTeacherPage> createState() => _TasksOfClassTeacherPageState();
}

class _TasksOfClassTeacherPageState extends State<TasksOfClassTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TaskTeacherController>().fetchTasks()
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<TaskTeacherController>();
    final allTasks = ctrl.taskModel?.taskDataT ?? [];
    // فلترة المهام الخاصة بالصف الحالي فقط
    final tasks = allTasks.where((t) => t.classTeacher?.classId == widget.classId).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tasks",
          style: TextStyle(
            fontSize: ResponsiveValues.font(context, 20),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
      ),
      body: ctrl.isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
          ? Center(
        child: Text(
          "No tasks found",
          style: TextStyle(fontSize: ResponsiveValues.font(context, 15)),
        ),
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          final task = tasks[i];
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: ResponsiveValues.w(context, 4),
              vertical: ResponsiveValues.h(context, 1),
            ),
            child: ListTile(
              leading: const Icon(Icons.assignment, color: Colors.orange),
              title: Text(
                task.title ?? "No title",
                style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type: ${task.type ?? '-'}",
                    style: TextStyle(fontSize: ResponsiveValues.font(context, 13)),
                  ),
                  Text(
                    "Deadline: ${task.deadline ?? '-'}",
                    style: TextStyle(fontSize: ResponsiveValues.font(context, 13)),
                  ),
                  if (task.mark != null)
                    Text(
                      "Mark: ${task.mark}",
                      style: TextStyle(fontSize: ResponsiveValues.font(context, 13)),
                    ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // افتح صفحة تفاصيل المهمة
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TaskDetailsTeacherPage(taskId: task.id!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// صفحة تفاصيل مهمة (placeholder)
class TaskDetailsTeacherPage extends StatelessWidget {
  final int taskId;
  const TaskDetailsTeacherPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    // هنا ممكن تجيب التفاصيل من الكنترولر، أو تمرر بيانات إضافية
    return Scaffold(
      appBar: AppBar(title: Text("Task Details")),
      body: Center(child: Text("تفاصيل المهمة: $taskId")),
    );
  }
}
