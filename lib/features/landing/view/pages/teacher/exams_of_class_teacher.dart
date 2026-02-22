import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_exam_controller.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/add_exam_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/edit_exam_teacher_page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/exam_details_teacher.dart';

class ExamsOfClassTeacherPage extends StatefulWidget {
  final int classId;
  const ExamsOfClassTeacherPage({super.key, required this.classId});

  @override
  State<ExamsOfClassTeacherPage> createState() => _ExamsOfClassTeacherPageState();
}

class _ExamsOfClassTeacherPageState extends State<ExamsOfClassTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TeacherExamController>().fetchTeacherExams();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exams")),
      body: Consumer<TeacherExamController>(
        builder: (context, ctrl, _) {
          if (ctrl.isLoading) return Center(child: CircularProgressIndicator());
          final exams = ctrl.examsModel?.examData?.where((e) => e.classTeacherId == widget.classId).toList() ?? [];
          if (exams.isEmpty) {
            return Center(child: Text("No exams for this class."));
          }
          return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (context, i) {
              final exam = exams[i];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(exam.title ?? "-",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  subtitle: Text("Date: ${exam.dateTime ?? "-"} | Mark: ${exam.mark ?? "-"}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // زر التعديل
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditExamTeacherPage(exam: exam),
                            ),
                          );
                        },
                      ),
                      // زر الحذف
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          // تأكيد الحذف
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text("Delete Exam"),
                              content: Text("Are you sure you want to delete this exam?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text("Delete", style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            await context.read<TeacherExamController>().removeTeacherExam(exam.id!);
                            // تحديث الصفحة بعد الحذف
                            context.read<TeacherExamController>().fetchTeacherExams();
                          }
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamDetailsTeacherPage(examId: exam.id!),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // فتح صفحة إضافة امتحان جديد
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddExamTeacherPage(classTeacherId: widget.classId),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
