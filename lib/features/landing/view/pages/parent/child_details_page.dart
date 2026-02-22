import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/parent/attendance_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/branches_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/bus/bus_main_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/fees_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/motivational_messages_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/parent_exam.dart';
import 'package:telmeeth/features/landing/view/pages/parent/parent_tasks_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/semester_days_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/teacher_report_page.dart';
import 'package:telmeeth/features/landing/view/pages/parent/time_table_page.dart';

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
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 Student Header (احترافي)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.w(5)),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
                borderRadius: BorderRadius.circular(context.radius(25)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: context.shadowBlur(18),
                    offset: Offset(0, context.shadowOffsetY(6)),
                    color: AppColors.primary.withOpacity(0.35),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: context.w(7),
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: context.icon(26),
                    ),
                  ),
                  SizedBox(width: context.w(4)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.font(17),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.h(0.5)),
                        Text(
                          "Grade: $grade",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: context.font(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: context.h(3)),

            /// 🔵 Services Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: context.w(4),
                mainAxisSpacing: context.w(4),
                childAspectRatio: 1,
                children: [
                  _service(
                    context,
                    Icons.message,
                    "Motivational Messages",
                    () => go(
                      context,
                      MotivationalMessagesForChildPage(
                        studentId: studentId,
                        name: name,
                      ),
                    ),
                  ),
                  _service(
                    context,
                    Icons.fact_check,
                    "Attendance",
                    () => go(context, AttendancePage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.quiz,
                    "Exams",
                    () => go(context, ParentExamPage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.task,
                    "Tasks",
                    () => go(context, ParentTasksPage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.payments,
                    "Fees",
                    () => go(context, FeesPage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.directions_bus,
                    "Bus Services",
                    () => go(context, BusMainPage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.calendar_today,
                    "Semester Days",
                        () => go(
                      context,
                      SemesterDaysPage(
                        studentId: studentId,
                      ),
                    ),
                  ),
                  _service(
                    context,
                    Icons.schedule,
                    "Time Table",
                    () => go(context, TimeTablePage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.description,
                    "Reports",
                    () => go(context, TeacherReportPage(studentId: studentId)),
                  ),
                  _service(
                    context,
                    Icons.school,
                    "Branches",
                    () => go(
                      context,
                      BranchesPage(id: studentId, fromStudent: true),
                    ),
                  ),
                ],
              ),
            ),
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
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(context.radius(20)),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(context.radius(20)),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(context.w(3)),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: context.icon(24),
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: context.h(1.2)),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.font(13),
                  fontWeight: FontWeight.w600,
                  color: AppColors.petrolGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
