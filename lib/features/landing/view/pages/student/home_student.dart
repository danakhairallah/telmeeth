import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/ai_advice_controller.dart';
import 'package:telmeeth/core/api/student/controllers/announcement_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/ai_advice_box.dart';
import 'package:telmeeth/core/widgets/student/announcement_slider.dart';
import 'package:telmeeth/core/widgets/student/student_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/student/ai_counselor_page.dart';

// student pages
import 'package:telmeeth/features/landing/view/pages/student/attendance_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/behaviors_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/bus_details_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/class_schedule_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/community_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/exams_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/grades_results_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/live_lessons_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/materials_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/messages_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/reports_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/schedule_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/school_days_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/smart_assistant_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/student_file_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/study_plan_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/tasks_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/work_sheets_page.dart';

class HomeStudent extends StatefulWidget {
  const HomeStudent({super.key});

  @override
  State<HomeStudent> createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AnnouncementController>().loadAllAnnouncements();
      context.read<AiAdviceController>().getAiAdvices();
    });
  }

  final List<FeatureModel> features = [
    FeatureModel(title: 'Materials', image: 'assets/image/feature_sample.png', page: const Materials()),
    FeatureModel(title: 'WorkSheets', image: 'assets/image/feature_sample.png', page: const WorkSheets()),
    FeatureModel(title: 'Tasks', image: 'assets/image/feature_sample.png', page: const Tasks()),
    FeatureModel(title: 'Exams', image: 'assets/image/feature_sample.png', page: const Exams()),
    FeatureModel(title: 'Attendance', image: 'assets/image/feature_sample.png', page: const Attendance()),
    FeatureModel(title: 'Class Schedule', image: 'assets/image/feature_sample.png', page: const ClassSchedule()),
    FeatureModel(title: 'Bus Details', image: 'assets/image/feature_sample.png', page: const BusDetailsPage()),
    //FeatureModel(title: 'BookMarks', image: 'assets/image/feature_sample.png', page: const BookMarks()),
    FeatureModel(title: 'Community', image: 'assets/image/feature_sample.png', page: const Communities()),
    FeatureModel(title: 'Grades Results', image: 'assets/image/feature_sample.png', page: const GradesResults()),
    FeatureModel(title: 'Live Lessons', image: 'assets/image/feature_sample.png', page: const LiveLessons()),
    FeatureModel(title: 'Messages', image: 'assets/image/feature_sample.png', page: const Messages()),
    //FeatureModel(title: 'NotesPage', image: 'assets/image/feature_sample.png', page: const NotesPage()),
    FeatureModel(title: 'Reports', image: 'assets/image/feature_sample.png', page: const Reports()),
    FeatureModel(title: 'Schedule', image: 'assets/image/feature_sample.png', page: const SchedulePage()),
    FeatureModel(title: 'School Days', image: 'assets/image/feature_sample.png', page: const SchoolDays()),
    FeatureModel(title: 'Smart Assistant', image: 'assets/image/feature_sample.png', page: const SmartAssistant()),
    FeatureModel(title: 'Student File', image: 'assets/image/feature_sample.png', page: const StudentFilePage()),
    FeatureModel(title: 'Study Plan', image: 'assets/image/feature_sample.png', page: const StudyPlan()),
    FeatureModel(title: 'Behaviors', image: 'assets/image/feature_sample.png', page: const Behaviors()),
    FeatureModel(title: 'AI Counselor', image: 'assets/image/feature_sample.png', page: const AiCounselorPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final announcementCount =
    context.watch<AnnouncementController>().allAnnouncements.length.toString();

    return Scaffold(
      appBar: const StudentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: context.h(2.5)),

            /// ===== Announcements Slider =====
            const AnnouncementSlider(),

            SizedBox(height: context.h(3)),

            /// ===== Features =====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              child: const Text(
                'Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: context.h(2)),

            SizedBox(
              height: context.h(13),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: context.w(4)),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return Container(
                    width: context.w(22),
                    margin: EdgeInsets.only(right: context.w(4)),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => feature.page),
                            );
                          },
                          child: Container(
                            height: context.w(18),
                            width: context.w(18),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.withOpacity(0.15),
                              image: DecorationImage(
                                image: AssetImage(feature.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: context.h(0.7)),
                        Text(
                          feature.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// ===== AI Advice =====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              child: const AiAdviceBox(),
            ),

            SizedBox(height: context.h(2)),

            /// ===== Info Boxes =====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.25,
                ),
                children: [

                  const _HomeInfoBox(
                    title: 'Messages',
                    count: '1',
                    subtitle: 'Motivational messages',
                    icon: Icons.message_outlined,
                  ),

                  const _HomeInfoBox(
                    title: 'Attendance',
                    count: '6',
                    subtitle: 'Attendance records',
                    icon: Icons.menu_book_outlined,
                  ),
                ],
              ),
            ),

            SizedBox(height: context.h(3)),
          ],
        ),
      ),
    );
  }
}

class FeatureModel {
  final String title;
  final String image;
  final Widget page;

  FeatureModel({required this.title, required this.image, required this.page});
}

class _HomeInfoBox extends StatelessWidget {
  final String title;
  final String count;
  final String subtitle;
  final IconData icon;

  const _HomeInfoBox({
    required this.title,
    required this.count,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 9, color: Colors.grey.shade600)),
              ],
            ),
          ),
          Icon(icon, size: 24, color: Colors.orange),
        ],
      ),
    );
  }
}
