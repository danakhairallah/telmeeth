import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_exam_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/features/landing/view/pages/parent/exam_details_page.dart';

class ParentExamsPage extends StatefulWidget {
  final int studentId;

  const ParentExamsPage({super.key, required this.studentId});

  @override
  State<ParentExamsPage> createState() => _ParentExamsPageState();
}

class _ParentExamsPageState extends State<ParentExamsPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ParentExamController>().getParentExams(widget.studentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams", style: TextStyle(fontSize: context.w(4.5))),
        centerTitle: true,
      ),
      body: Consumer<ParentExamController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final exams = controller.parentExamModel?.data;

          if (exams == null || exams.isEmpty) {
            return Center(
              child: Text(
                "No exams available",
                style: TextStyle(fontSize: context.w(4)),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(context.w(4)),
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];

              return GestureDetector(
                onTap: () {
                  // 🚀 فتح صفحة تفاصيل الامتحان
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExamDetailsPage(exam: exam),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: context.h(2)),
                  padding: EdgeInsets.all(context.w(4)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.w(4)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: context.w(2),
                        offset: Offset(0, context.h(0.3)),
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        exam.title ?? "Exam",
                        style: TextStyle(
                          fontSize: context.w(4.3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.h(1)),

                      /// Subject
                      Text(
                        "Subject: ${exam.subjectNameAr ?? "-"}",
                        style: TextStyle(fontSize: context.w(3.6)),
                      ),
                      SizedBox(height: context.h(0.7)),

                      /// Teacher
                      Text(
                        "Teacher: ${exam.teacherNameAr ?? "-"}",
                        style: TextStyle(fontSize: context.w(3.4)),
                      ),
                      SizedBox(height: context.h(0.7)),

                      /// Date
                      Text(
                        "Date: ${exam.dateTime ?? "-"}",
                        style: TextStyle(fontSize: context.w(3.3)),
                      ),
                      SizedBox(height: context.h(1.5)),

                      /// Bottom Row: Status & Mark
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.w(3),
                              vertical: context.h(0.6),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius:
                                  BorderRadius.circular(context.w(2)),
                            ),
                            child: Text(
                              exam.status ?? "Unknown",
                              style: TextStyle(
                                fontSize: context.w(3.2),
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Text(
                            "Mark: ${exam.mark ?? 0}",
                            style: TextStyle(
                              fontSize: context.w(3.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
