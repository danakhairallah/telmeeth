import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/ai_report_controller.dart';
import 'package:telmeeth/core/api/controllers/announcement_controller.dart';
import 'package:telmeeth/core/api/controllers/attendance_controller.dart';
import 'package:telmeeth/core/api/controllers/auth_controller.dart';
import 'package:telmeeth/core/api/controllers/average_controller.dart';
import 'package:telmeeth/core/api/controllers/behavior_controller.dart';
import 'package:telmeeth/core/api/controllers/exam_controller.dart';
import 'package:telmeeth/core/api/controllers/highlight_controller.dart';
import 'package:telmeeth/core/api/controllers/lessons_controller.dart';
import 'package:telmeeth/core/api/controllers/mark_controller.dart';
import 'package:telmeeth/core/api/controllers/note_controller.dart';
import 'package:telmeeth/core/api/controllers/profile_controller.dart';
import 'package:telmeeth/core/api/controllers/schedual_controller.dart';
import 'package:telmeeth/core/api/controllers/score_controller.dart';
import 'package:telmeeth/core/api/controllers/study_plan_controller.dart';
import 'package:telmeeth/core/api/controllers/subject_controller.dart';
import 'package:telmeeth/core/api/controllers/task_controller.dart';
import 'package:telmeeth/core/api/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/controllers/unit_controller.dart';
import 'package:telmeeth/core/api/controllers/website_activity_controller.dart';
import 'package:telmeeth/core/api/controllers/worksheet_controller.dart';
import 'package:telmeeth/features/landing/view/pages/landing/ai_tools_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/our_schools_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/stories_page.dart';
import 'package:telmeeth/features/landing/view/pages/login/login_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/attachments_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/attendance_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/book_marks_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/class_schedule_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/exams_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/grades_results_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/live_lessons_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/materials_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/student_file_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/study_plan_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/tasks_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/work_sheets_page.dart';
import 'core/api/controllers/ai_advice_controller.dart';
import 'core/api/controllers/ai_message_controller.dart';
import 'core/theme/app_theme.dart';
import 'features/landing/view/landing_page.dart';
import 'features/landing/view/pages/student/home_student.dart';
import 'features/landing/view/pages/student/profile_page.dart';
import 'features/landing/view/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(
          create: (_) => AttendanceController(),
          child: Attendance(),
        ),
        ChangeNotifierProvider(create: (_) => WebsiteActivityController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => HighlightController()),
        ChangeNotifierProvider(create: (_) => AiMessageController()),
        ChangeNotifierProvider(create: (_) => AiAdviceController()),
        ChangeNotifierProvider(create: (_) => AiReportController()),
        ChangeNotifierProvider(create: (_) => StudyPlanController()),
        ChangeNotifierProvider(create: (_) => ExamController()),
        ChangeNotifierProvider(create: (_) => WorksheetController()),
        ChangeNotifierProvider(create: (_) => TaskController()),
        ChangeNotifierProvider(create: (_) => SubjectController()),
        ChangeNotifierProvider(create: (_) => SchedualController()),
        ChangeNotifierProvider(create: (_) => TimeTableController()),
        ChangeNotifierProvider(create: (_) => AnnouncementController()),
        ChangeNotifierProvider(create: (_) => UnitController()),
        ChangeNotifierProvider(create: (_) => LessonController()),
        ChangeNotifierProvider(create: (_) => NoteController()),
        ChangeNotifierProvider(create: (_) => MarksController()),
        ChangeNotifierProvider(create: (_) => ScoreController()),
        ChangeNotifierProvider(create: (_) => AverageController()),
        ChangeNotifierProvider(create: (_) => BehaviorController()),


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
      home: SplashPage(),
    );
  }
}
