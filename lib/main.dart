import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/controllers/branches_controllers.dart';
import 'package:telmeeth/core/api/parent/controllers/fees_controllers.dart';
import 'package:telmeeth/core/api/parent/controllers/my_children_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_exam_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/school_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/student_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/teacher_report_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/walking_time_controller.dart';
import 'package:telmeeth/core/api/parent/services/student_service.dart';

// ===== Student Controllers =====
import 'package:telmeeth/core/api/student/controllers/auth_controller.dart';
import 'package:telmeeth/core/api/student/controllers/attendance_controller.dart';
import 'package:telmeeth/core/api/student/controllers/streak_controller.dart';
import 'package:telmeeth/core/api/student/controllers/website_activity_controller.dart';
import 'package:telmeeth/core/api/student/controllers/profile_controller.dart';
import 'package:telmeeth/core/api/student/controllers/highlight_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_message_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_advice_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_report_controller.dart';
import 'package:telmeeth/core/api/student/controllers/study_plan_controller.dart';
import 'package:telmeeth/core/api/student/controllers/exam_controller.dart';
import 'package:telmeeth/core/api/student/controllers/worksheet_controller.dart';
import 'package:telmeeth/core/api/student/controllers/task_controller.dart';
import 'package:telmeeth/core/api/student/controllers/subject_controller.dart';
import 'package:telmeeth/core/api/student/controllers/schedual_controller.dart';
import 'package:telmeeth/core/api/student/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/student/controllers/announcement_controller.dart';
import 'package:telmeeth/core/api/student/controllers/unit_controller.dart';
import 'package:telmeeth/core/api/student/controllers/lessons_controller.dart';
import 'package:telmeeth/core/api/student/controllers/note_controller.dart';
import 'package:telmeeth/core/api/student/controllers/mark_controller.dart';
import 'package:telmeeth/core/api/student/controllers/score_controller.dart';
import 'package:telmeeth/core/api/student/controllers/average_controller.dart';
import 'package:telmeeth/core/api/student/controllers/behavior_controller.dart';
import 'package:telmeeth/core/api/student/controllers/report_controller.dart';
import 'package:telmeeth/core/api/student/controllers/student_messages_controller.dart';
import 'package:telmeeth/core/api/student/controllers/chatbot_controller.dart';
import 'package:telmeeth/core/api/student/controllers/bus_details_controller.dart';

// ===== Parent Controllers =====
import 'package:telmeeth/core/api/parent/controllers/transfer_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_profile_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/ai_chat_parent_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_announcement_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/discounts_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/motivational_messages_controller.dart';

// ===== Parent Services =====
import 'package:telmeeth/core/api/parent/services/motivational_messages_service.dart';
import 'package:telmeeth/core/api/teacher/controllers/announcement_controller_teacher.dart';
import 'package:telmeeth/core/api/teacher/controllers/attendance_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/behavior_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/chatbot_controller_teacher.dart';
import 'package:telmeeth/core/api/teacher/controllers/exam_question_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/profile_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/schedule_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/task_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_classes_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_exam_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_motivational_message_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/uplode_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_essay_question_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_multi_question_controller.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_motivational_message_service.dart';

// ===== App =====
import 'core/api/student/controllers/student_file_controller.dart';
import 'features/landing/view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Dio dio = await ApiClient.getDio();

  runApp(
    MultiProvider(
      providers: [

        // ================= TEACHER PORTAL =================
        ChangeNotifierProvider(create: (_) => TeacherChatbotController()),
        ChangeNotifierProvider(
            create: (_) => MotivationMessageControllerTeacher(MotivationMessageServiceTeacher())
        ),
        ChangeNotifierProvider(create: (_) => AnnouncementControllerTeacher()),
        ChangeNotifierProvider(create: (_) => TeacherClassesController()),
        ChangeNotifierProvider(create: (_) => AttendanceTeacherController()),
        ChangeNotifierProvider(create: (_) => TaskTeacherController()),
        ChangeNotifierProvider(create: (_) => BehaviorTeacherController()),
        ChangeNotifierProvider(create: (_) => ProfileTeacherController()),
        ChangeNotifierProvider(create: (_) => TeacherExamController()),
        ChangeNotifierProvider(create: (_) => ExamQuestionTeacherController()),
        ChangeNotifierProvider(create: (_) => UplodesTeacherController()),
        ChangeNotifierProvider(create: (_) => ScheduleTeacherController()),
        ChangeNotifierProvider(create: (_) => WorksheetTeacherController()),
        ChangeNotifierProvider(create: (_) => WorksheetMultiQuestionController()),
        ChangeNotifierProvider(create: (_) => WorksheetEssayQuestionController()),





        // ================= STUDENT PORTAL =================
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => AttendanceController()),
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
        ChangeNotifierProvider(create: (_) => ReportController()),
        ChangeNotifierProvider(create: (_) => StudentMessagesController()),
        ChangeNotifierProvider(create: (_) => ChatbotController()),
        ChangeNotifierProvider(create: (_) => BusDetailsController()),
        ChangeNotifierProvider(create: (_) => StreakController()),
        ChangeNotifierProvider(create: (_) => StudentFileController()),


        // ================= PARENT PORTAL =================
        ChangeNotifierProvider(create: (_) => TransferController()),
        ChangeNotifierProvider(create: (_) => ProfileParentController()),
        ChangeNotifierProvider(create: (_) => AiChatParentController()),
        ChangeNotifierProvider(create: (_) => ParentAnnouncementController()),
        ChangeNotifierProvider(create: (_) => DiscountsController()),
        ChangeNotifierProvider(create: (_) => FeesController()),
        ChangeNotifierProvider(create: (_) => MyChildrenController()),
        ChangeNotifierProvider(create: (_) => TimeTableControllerParent()),
        ChangeNotifierProvider(create: (_) => ParentExamController()),
        ChangeNotifierProvider(create: (_) => TeacherReportController()),
        ChangeNotifierProvider(create: (_) => SchoolController()),
        ChangeNotifierProvider(create: (_) => BranchesController()),
        ChangeNotifierProvider(
          create: (_) => StudentController(StudentService(dio))),
        Provider<MotivationalMessagesService>(
          create: (_) => MotivationalMessagesService(dio)),
        ChangeNotifierProvider<MotivationalMessagesController>(
          create: (context) => MotivationalMessagesController(
            context.read<MotivationalMessagesService>(),
            StudentService(dio)),



        ),
      ],
      child: const MyApp(),
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
      home: const SplashPage(),
    );
  }
}
