import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_exam_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/exam_question_teacher_controller.dart';

class ExamDetailsTeacherPage extends StatefulWidget {
  final int examId;
  const ExamDetailsTeacherPage({super.key, required this.examId});

  @override
  State<ExamDetailsTeacherPage> createState() => _ExamDetailsTeacherPageState();
}

class _ExamDetailsTeacherPageState extends State<ExamDetailsTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TeacherExamController>().fetchTeacherExamDetails(widget.examId);
      context.read<ExamQuestionTeacherController>().fetchExamQuestions(widget.examId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exam Details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<TeacherExamController>(
              builder: (context, ctrl, _) {
                final exam = ctrl.examDetailsModel?.examDataT;
                if (exam == null) return Center(child: Text("Exam not found."));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title: ${exam.title}"),
                    Text("Description: ${exam.description ?? '-'}"),
                    Text("Total Mark: ${exam.mark}"),
                    // ... أضف ما تريد من التفاصيل ...
                  ],
                );
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Essay Questions", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Consumer<ExamQuestionTeacherController>(
              builder: (context, ctrl, _) {
                final questions = ctrl.questionsModel?.examDataT ?? [];
                if (questions.isEmpty) return Text("No questions found.");
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: questions.length,
                  itemBuilder: (context, i) {
                    final q = questions[i];
                    return ListTile(
                      title: Text(q.question ?? "-"),
                      subtitle: Text("Mark: ${q.mark}"),
                      // ... يمكنك إضافة أزرار تعديل/حذف ...
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // فتح صفحة إضافة سؤال
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
