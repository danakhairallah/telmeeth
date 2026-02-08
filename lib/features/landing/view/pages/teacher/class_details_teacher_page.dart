import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_model.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/attendance_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/behaviors_of_class_teacher_Page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/exams_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/students_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/tasks_of_class_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/worksheet/worksheets_of_class_teacher_page.dart';

class ClassDetailsTeacherPage extends StatelessWidget {
  final ClassesData classData;
  const ClassDetailsTeacherPage({super.key, required this.classData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          classData.classC?.grade?.nameAr ?? "Class Details",
          style: TextStyle(fontSize: ResponsiveValues.font(context, 20)),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Section: ${classData.section?.nameAr ?? '-'}",
              style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 15),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: ResponsiveValues.h(context, 1.2)),
            Text(
              "Day: ${classData.day ?? '-'}",
              style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),
            ),
            Text(
              "Time: ${classData.classTime ?? '-'}",
              style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),
            ),

            Divider(height: ResponsiveValues.h(context, 4)),

            // ========== FEATURES ==========
            Text(
              "Features",
              style: TextStyle(
                fontSize: ResponsiveValues.font(context, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ResponsiveValues.h(context, 2)),

            // أزرار الميزات (طلاب، حضور، واجبات ...)
            Wrap(
              spacing: ResponsiveValues.w(context, 4),
              runSpacing: ResponsiveValues.h(context, 2),
              children: [
                _FeatureButton(
                  icon: Icons.group,
                  label: "Students",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentsOfClassTeacherPage(classId: classData.id!),
                      ),
                    );
                  },
                ),

                _FeatureButton(
                  icon: Icons.check_circle,
                  label: "Attendance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AttendanceOfClassTeacherPage(classId: classData.id!),
                      ),
                    );
                  },
                ),

                _FeatureButton(
                  icon: Icons.assignment,
                  label: "Tasks",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TasksOfClassTeacherPage(classId: classData.id!),
                      ),
                    );
                  },

                ),
                _FeatureButton(
                  icon: Icons.psychology,
                  label: "Behaviors",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BehaviorsOfClassTeacherPage(classTeacherId: classData.id!),
                      ),
                    );
                  },
                ),
                _FeatureButton(
                  icon: Icons.assignment_turned_in,
                  label: "Exams",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamsOfClassTeacherPage(classId: classData.id!),
                      ),
                    );
                  },
                ),
                _FeatureButton(
                  icon: Icons.library_books,
                  label: "Worksheets",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WorksheetsOfClassTeacherPage(classId: classData.id!),
                      ),
                    );
                  },
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}

// زر ميزة واحدة
class _FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _FeatureButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: ResponsiveValues.icon(context, 22)),
      label: Text(label, style: TextStyle(fontSize: ResponsiveValues.font(context, 14))),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValues.w(context, 5),
          vertical: ResponsiveValues.h(context, 1.2),
        ),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 10)),
        ),
      ),
    );
  }
}
