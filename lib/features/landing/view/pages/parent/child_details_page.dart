import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/parent/branches_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/fees_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/parent_exam.dart';
import 'package:telmeeth/features/landing/view/pages/parent/teacher_report_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/time_table_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/walking_time_page.dart';

class ChildDetailsPage extends StatelessWidget {
  final int studentId;
  final String name;
  final String grade;

  const ChildDetailsPage({
    super.key,
    required this.studentId,
    required this.name,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Header ----------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.w(4)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.w(5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: context.w(4.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.h(0.8)),
                  Text(
                    "Grade: $grade",
                    style: TextStyle(fontSize: context.w(3.6)),
                  ),
                ],
              ),
            ),

            SizedBox(height: context.h(2.5)),

            // ---------- Services ----------
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: context.w(4),
                mainAxisSpacing: context.w(4),
                children: [
                  /*_service(context, Icons.fact_check, "Attendance",
                      () => go(context, AttendancePage(studentId))),*/
                  _service(context, Icons.quiz, "Exams",
                      () => go(context, ParentExamsPage(studentId : studentId))),
                  _service(context, Icons.payments, "Fees",
                      () => go(context, FeesPage(studentId: studentId))),
                  /*_service(context, Icons.task, "Tasks",
                      () => go(context, TasksPage(studentId))),*/
                  _service(context, Icons.directions_bus, "Bus Tracking",
                      () => go(context, WalkingTimePage(studentId: studentId))),
                  _service(context, Icons.schedule, "Time Table",
                      () => go(context, TimeTablePage(studentId: studentId))),
                  /*_service(context, Icons.psychology, "Behaviors",
                      () => go(context, BehaviorsPage(studentId))),
                  _service(context, Icons.message, "Messages",
                      () => go(context, MessagesPage(studentId))),*/
                  _service(context, Icons.description, "Reports",
                      () => go(context, TeacherReportPage(studentId: studentId))),
                  _service(context, Icons.school, "Branches",
                      () => go(context, BranchesPage(id: studentId , fromStudent: true,))),
                  /*_service(context, Icons.timeline, "Score",
                      () => go(context, ScorePage(studentId))),*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void go(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Widget _service(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.w(4)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.w(5)),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: context.w(10), color: Colors.blue),
            SizedBox(height: context.h(1.2)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.w(3.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
