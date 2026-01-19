import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/exam_controller.dart';
import 'package:telmeeth/core/api/student/model/request/answer_request.dart';
import 'package:telmeeth/core/api/student/model/request/exam_request.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class ExamQuestionsPage extends StatefulWidget {
  final int examId;
  const ExamQuestionsPage({super.key, required this.examId});

  @override
  State<ExamQuestionsPage> createState() => _ExamQuestionsPageState();
}

class _ExamQuestionsPageState extends State<ExamQuestionsPage> {
  Map<int, dynamic> answers = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ExamController>().getExamQuestions(widget.examId);
    });
  }

  // هنا دالة submitExam الجديدة — استخدمها تحت بدلاً من القديمة
  Future<void> submitExam() async {
    final examController = context.read<ExamController>();

    // بناء قائمة الإجابات من الـ Map
    final answersList = answers.entries
        .map((e) => Answers(
      questionId: e.key,
      answer: e.value,
    ))
        .toList();

    // بناء الريكوست المناسب (ExamRequest)
    final request = ExamRequest(answers: answersList);

    // استدعاء الميثود في الكنترولر
    await examController.submitExam(widget.examId, request);

    // التحقق من الحالة بعد الإرسال
    if (examController.isError) {
      // عرض الخطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(examController.errorMessage)),
      );
      return;
    }

    if (examController.examSubmitSuccess == true) {
      // جلب نتيجة الامتحان بعد الإرسال
      await examController.getExamResult(widget.examId);
      final result = examController.examResult;

      if (result != null) {
        // عرض الـ Dialog للنتيجة
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Exam Submitted 🎉'),
            content: Text(
              'Your Score: ${result.studentMark} / ${result.examFullMark}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );

        Navigator.pop(context); // العودة للصفحة السابقة
      }
    } else {
      // حالة الفشل من السيرفر
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(examController.examSubmitMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = context.w(100);
    final h = context.h(100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Questions'),
        backgroundColor: const Color(0xFFF39F5F),
      ),
      backgroundColor: const Color(0xFFFEF8F2),
      body: Consumer<ExamController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final questions = controller.examQuestions?.questions ?? [];

          if (questions.isEmpty) {
            return const Center(child: Text("No questions available"));
          }

          return Padding(
            padding: EdgeInsets.all(context.w(3.5)),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final q = questions[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: context.h(1.5)),
                        padding: EdgeInsets.all(context.w(2.3)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(context.h(1.2)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.07),
                              blurRadius: 7,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ${q.question}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.w(3.3),
                              ),
                            ),
                            SizedBox(height: context.h(0.7)),
                            if (q.type == "mcq" && q.options != null)
                              ...q.options!.map((opt) {
                              final selected = answers[q.id] == opt;
                                return Container(
                                margin: EdgeInsets.only(bottom: context.h(0.5)),
                                decoration: BoxDecoration(
                                color: selected ? const Color(0xFFFFF2DD) : Colors.transparent,
                                borderRadius: BorderRadius.circular(context.h(0.8)),
                                ),
                                child: ListTile(
                                title: Text(opt),
                                leading: Radio<String>(
                                value: opt,
                                groupValue: answers[q.id],
                                onChanged: (val) {
                                if (q.id == null) return; // تأكد من id
                                    setState(() {
                                    answers[q.id!] = val!;
                                    });
                                },
                                ),
                              ),
                            );
                          }).toList(),

                            if (q.type == "essay")
                              TextField(
                                maxLines: 4,
                                onChanged: (val) => answers[q.id!] = val,
                                decoration: const InputDecoration(
                                  hintText: "Write your answer...",
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: context.h(5),
                  child: ElevatedButton.icon(
                    onPressed: answers.isEmpty ? null : submitExam,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF39F5F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.h(1.2)),
                      ),
                      elevation: 0,
                    ),
                    icon: Icon(Icons.check_circle, color: Colors.white),
                    label: Text(
                      'Submit Exam',
                      style: TextStyle(
                        fontSize: context.w(3.4),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
