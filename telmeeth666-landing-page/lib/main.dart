import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/branches_controllers.dart';
import 'package:telmeeth/core/api/parent/controllers/fees_controllers.dart';
import 'package:telmeeth/core/api/parent/controllers/my_children_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_exam_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/school_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/teacher_report_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/walking_time_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_advice_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_message_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_report_controller.dart';
import 'package:telmeeth/core/api/student/controllers/announcement_controller.dart';
import 'package:telmeeth/core/api/student/controllers/attendance_controller.dart';
import 'package:telmeeth/core/api/student/controllers/auth_controller.dart';
import 'package:telmeeth/core/api/student/controllers/average_controller.dart';
import 'package:telmeeth/core/api/student/controllers/behavior_controller.dart';
import 'package:telmeeth/core/api/student/controllers/exam_controller.dart';
import 'package:telmeeth/core/api/student/controllers/highlight_controller.dart';
import 'package:telmeeth/core/api/student/controllers/lessons_controller.dart';
import 'package:telmeeth/core/api/student/controllers/mark_controller.dart';
import 'package:telmeeth/core/api/student/controllers/note_controller.dart';
import 'package:telmeeth/core/api/student/controllers/profile_controller.dart';
import 'package:telmeeth/core/api/student/controllers/schedual_controller.dart';
import 'package:telmeeth/core/api/student/controllers/school_days_controller.dart';
import 'package:telmeeth/core/api/student/controllers/score_controller.dart';
import 'package:telmeeth/core/api/student/controllers/study_plan_controller.dart';
import 'package:telmeeth/core/api/student/controllers/subject_controller.dart';
import 'package:telmeeth/core/api/student/controllers/task_controller.dart';
import 'package:telmeeth/core/api/student/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/student/controllers/unit_controller.dart';
import 'package:telmeeth/core/api/student/controllers/website_activity_controller.dart';
import 'package:telmeeth/core/api/student/controllers/worksheet_controller.dart';
import 'package:telmeeth/features/landing/view/pages/student/attendance_page.dart';
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
        ChangeNotifierProvider(create: (_) => FeesController()),
        ChangeNotifierProvider(create: (_) => MyChildrenController()),
        ChangeNotifierProvider(create: (_) => TimeTableControllerParent()),
        ChangeNotifierProvider(create: (_) => ParentExamController()),
        ChangeNotifierProvider(create: (_) => TeacherReportController()),
        ChangeNotifierProvider(create: (_) => SchoolController()),
        ChangeNotifierProvider(create: (_) => BranchesController()),
        ChangeNotifierProvider(create: (_) => WalkingTimeController()),
        ChangeNotifierProvider(create: (_) => SchoolController()),
        ChangeNotifierProvider(create: (_) => SchoolDaysController())

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
