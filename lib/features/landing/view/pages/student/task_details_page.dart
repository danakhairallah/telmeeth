import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/task_controller.dart';
import 'package:telmeeth/core/api/student/model/request/task_request.dart';
import 'package:telmeeth/core/api/student/model/response/task.dart';
import 'package:telmeeth/core/api/student/model/response/task_submit_response.dart';
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
  List<Answers> answers = [];

  // جمع إجابات MCQ
  for (var mcq in task.multipleChoiceTasks) {
    answers.add(Answers(
      type: "mcq",
      questionId: mcq.id,
      answer: mcqAnswers[mcq.id] ?? "",
    ));
  }

  // جمع إجابات Essay
  for (var essay in task.essayTasks) {
    answers.add(Answers(
      type: "essay",
      questionId: essay.id,
      answer: essayAnswers[essay.id] ?? "",
    ));
  }

  final request = TaskSubmitRequest(answers: answers);

  // استدعاء الكنترولر
  final response = await context
      .read<TaskController>()
      .submitTask(task.id, request);

  if (!mounted) return;

  // عرض Dialog باستخدام message و totalMark
  showSubmitDialog(context, response);
}



void showSubmitDialog(BuildContext context, TaskSubmitResponse response) {
  final success = response.totalMark != null;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          success ? "🎉 Success" : "❌ Failed",
          style: TextStyle(
            color: success ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              response.message ?? "No message from server",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            if (response.totalMark != null)
              Text(
                "Your Mark: ${response.totalMark}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // إغلاق الديالوك
              if (success) Navigator.pop(context); // الرجوع للصفحة السابقة
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
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
