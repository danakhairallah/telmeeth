import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_model.dart';

// pages
import 'package:telmeeth/features/landing/view/pages/teacher/attendance_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/behaviors_of_class_teacher_Page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/exams_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/students_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/tasks_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/worksheet/worksheets_of_class_teacher_page.dart';

// appbar
import 'package:telmeeth/core/widgets/teacher/teacher_features_app_bar.dart';

class ClassDetailsTeacherPage extends StatelessWidget {
  final ClassesData classData;
  const ClassDetailsTeacherPage({super.key, required this.classData});

  @override
  Widget build(BuildContext context) {
    final gradeName = classData.classC?.grade?.nameAr ?? "Class Details";
    final sectionName = classData.section?.nameAr ?? "-";
    final day = classData.day ?? "-";
    final time = classData.classTime ?? "-";

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const TeacherFeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 HEADER (same style as ChildDetailsPage)
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
                      Icons.class_,
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
                          gradeName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.font(17),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.h(0.5)),
                        Text(
                          "Section: $sectionName",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: context.font(12),
                          ),
                        ),
                        SizedBox(height: context.h(0.3)),
                        Text(
                          "Day: $day  •  Time: $time",
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

            /// 🔵 SERVICES GRID (same style as ChildDetailsPage)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: context.w(4),
                mainAxisSpacing: context.w(4),
                childAspectRatio: 1,
                children: [
                  _service(
                    context,
                    Icons.group,
                    "Students",
                        () => _go(
                      context,
                      StudentsOfClassTeacherPage(classId: classData.id!),
                    ),
                  ),
                  _service(
                    context,
                    Icons.fact_check,
                    "Attendance",
                        () => _go(
                      context,
                      AttendanceOfClassTeacherPage(classId: classData.id!),
                    ),
                  ),
                  _service(
                    context,
                    Icons.task,
                    "Tasks",
                        () => _go(
                      context,
                      TasksOfClassTeacherPage(classId: classData.id!),
                    ),
                  ),
                  _service(
                    context,
                    Icons.psychology,
                    "Behaviors",
                        () => _go(
                      context,
                      BehaviorsOfClassTeacherPage(classTeacherId: classData.id!),
                    ),
                  ),
                  _service(
                    context,
                    Icons.quiz,
                    "Exams",
                        () => _go(
                      context,
                      ExamsOfClassTeacherPage(classId: classData.id!),
                    ),
                  ),
                  _service(
                    context,
                    Icons.library_books,
                    "Worksheets",
                        () => _go(
                      context,
                      WorksheetsOfClassTeacherPage(classId: classData.id!),
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

  void _go(BuildContext context, Widget page) {
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