import 'package:flutter/material.dart';
import 'package:telmeeth/features/landing/view/pages/student/attendance_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/grades_results_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/home1_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/live_lessons_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/materials_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/student_file_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/study_plan_page.dart';
import 'core/theme/app_theme.dart';
import 'features/landing/view/landing_page.dart';
import 'features/landing/view/pages/student/profile_page.dart';
import 'features/landing/view/pages/student/student_shell_page.dart';
import 'features/landing/view/splash_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telmeeth',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Home(),
    );
  }
}