import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/attendance_controller.dart';
import 'package:telmeeth/core/api/controllers/auth_controller.dart';
import 'package:telmeeth/core/api/controllers/highlight_controller.dart';
import 'package:telmeeth/core/api/controllers/profile_controller.dart';
import 'package:telmeeth/core/api/controllers/website_activity_controller.dart';
import 'package:telmeeth/features/landing/view/pages/landing/ai_tools_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/our_schools_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/stories_page.dart';
import 'package:telmeeth/features/landing/view/pages/login/login_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/attendance_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/book_marks_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/exams_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/grades_results_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/home1_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/live_lessons_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/materials_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/student_file_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/study_plan_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/tasks_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/work_sheets_page.dart';
import 'core/theme/app_theme.dart';
import 'features/landing/view/landing_page.dart';
import 'features/landing/view/pages/student/profile_page.dart';
import 'features/landing/view/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => AttendanceController(), child: Attendance(),),
        ChangeNotifierProvider(create: (_) => WebsiteActivityController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => HighlightController())
      ],
      child: MyApp(),
      ),
  );
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
      home: Tasks(),
    );
  }
}