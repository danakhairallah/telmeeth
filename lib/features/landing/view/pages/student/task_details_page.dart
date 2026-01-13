import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/task_controller.dart';
import 'package:telmeeth/core/api/model/request/task_request.dart';
import 'package:telmeeth/core/api/model/response/task.dart';
import 'package:telmeeth/core/api/model/response/task_detile_response.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class TaskDetailsPage extends StatefulWidget {
  final int taskId;
  const TaskDetailsPage({super.key, required this.taskId});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  final Map<int, String> mcqAnswers = {}; // questionId -> selected option
  final Map<int, String> essayAnswers = {}; // questionId -> essay text

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskController>().getTaskById(widget.taskId);
    });
  }

  void submitTask(Task task) async {
    List<Answer> answers = [];
    for (var mcq in task.multipleChoiceTasks) {
      answers.add(Answer(
        type: "mcq",
        questionId: mcq.id,
        answer: mcqAnswers[mcq.id] ?? "",
      ));
    }
    for (var essay in task.essayTasks) {
      answers.add(Answer(
        type: "essay",
        questionId: essay.id,
        answer: essayAnswers[essay.id] ?? "",
      ));
    }
    final request = TaskSubmitRequest(answers: answers);

    bool success = await context.read<TaskController>().submitTask(task.id, request);

    if (success) {
      // بعد نجاح التسليم، جلب النتيجة من السيرفر
      await context.read<TaskController>().getTaskResult(task.id);
      final result = context.read<TaskController>().taskResult;

      if (mounted && result != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(context.w(4)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // أيقونة
                  Container(
                    padding: EdgeInsets.all(context.w(3)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFFE3C7),
                    ),
                    child: Icon(
                      Icons.emoji_events_rounded,
                      size: context.w(9),
                      color: const Color(0xFFF39F5F),
                    ),
                  ),

                  SizedBox(height: context.h(1.5)),

                  // العنوان
                  Text(
                    'Task Result',
                    style: TextStyle(
                      fontSize: context.w(5),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF39F5F),
                    ),
                  ),

                  SizedBox(height: context.h(1)),

                  // العلامة
                  Text(
                    '${result.studentMark} / ${result.taskFullMark}',
                    style: TextStyle(
                      fontSize: context.w(6),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: context.h(0.8)),

                  // حالة التصحيح
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: context.h(0.6),
                      horizontal: context.w(4),
                    ),
                    decoration: BoxDecoration(
                      color: result.status
                          ? Colors.green.shade50
                          : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      result.status ? '✔ تم التصحيح' : '⏳ بانتظار التصحيح',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: result.status ? Colors.green : Colors.orange,
                      ),
                    ),
                  ),

                  SizedBox(height: context.h(2)),

                  // زر الإغلاق
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context); // يرجع لصفحة التاسكات
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF39F5F),
                        padding: EdgeInsets.symmetric(vertical: context.h(1.3)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit task.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TaskController>();
    final taskDetail = controller.selectedTask;

    if (controller.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (taskDetail == null) {
      return const Scaffold(
        body: Center(child: Text('Task not found')),
      );
    }

    final task = taskDetail.task;

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان المهمة
              Text(
                task.title,
                style: TextStyle(
                  fontSize: context.w(5.5),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF39F5F),
                  letterSpacing: 1.1,
                ),
              ),
              SizedBox(height: context.h(1)),
              Text(
                task.description,
                style: TextStyle(fontSize: context.w(3.5)),
              ),
              SizedBox(height: context.h(1.2)),
              Container(
                padding: EdgeInsets.symmetric(vertical: context.h(0.7), horizontal: context.w(3)),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE3C7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '🎯 Type: ${task.type}',
                  style: TextStyle(
                    fontSize: context.w(3.2),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFF39F5F),
                  ),
                ),
              ),
              SizedBox(height: context.h(2.5)),

              // ===== MCQ =====
              if (task.multipleChoiceTasks.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.only(bottom: context.h(1.1)),
                  child: Text(
                    '📝 Multiple Choice (${task.multipleChoiceTasks.length})',
                    style: TextStyle(
                        fontSize: context.w(3.7),
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade800),
                  ),
                ),
                ...task.multipleChoiceTasks.map((q) => Container(
                  margin: EdgeInsets.only(bottom: context.h(1.5)),
                  padding: EdgeInsets.all(context.w(3)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.05),
                        blurRadius: 7,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        q.question,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(3.6),
                          color: Colors.orange.shade900,
                        ),
                      ),
                      SizedBox(height: context.h(1)),
                      ...q.options.entries.map((e) {
                        return RadioListTile<String>(
                          activeColor: const Color(0xFFF39F5F),
                          value: e.key,
                          groupValue: mcqAnswers[q.id],
                          onChanged: (val) {
                            setState(() {
                              mcqAnswers[q.id] = val ?? "";
                            });
                          },
                          title: Text(
                            '${e.key.toUpperCase()}. ${e.value}',
                            style: TextStyle(
                                fontSize: context.w(3.2),
                                color: Colors.grey.shade800),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.zero,
                        );
                      }),
                    ],
                  ),
                )),
              ],

              // ===== Essay =====
              if (task.essayTasks.isNotEmpty) ...[
                SizedBox(height: context.h(0.7)),
                Padding(
                  padding: EdgeInsets.only(bottom: context.h(1.1)),
                  child: Text(
                    '📝 Essay (${task.essayTasks.length})',
                    style: TextStyle(
                        fontSize: context.w(3.7),
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade800),
                  ),
                ),
                ...task.essayTasks.map((q) => Container(
                  margin: EdgeInsets.only(bottom: context.h(1.5)),
                  padding: EdgeInsets.all(context.w(3)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.05),
                        blurRadius: 7,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFF39F5F),
                          width: 1.4,
                        ),
                      ),
                      labelText: q.question,
                      labelStyle: TextStyle(color: Colors.orange.shade700),
                      hintText: "اكتب إجابتك هنا...",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFF39F5F),
                          width: 1.4,
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      essayAnswers[q.id] = val;
                    },
                  ),
                )),
              ],

              SizedBox(height: context.h(2.5)),

              // ===== Submit Button =====
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => submitTask(task),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF39F5F),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: context.h(1.5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: TextStyle(
                      fontSize: context.w(4.2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Submit Task'),
                ),
              ),
              SizedBox(height: context.h(2)),
            ],
          ),
        ),
      ),
    );
  }
}
