import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/announcement_controller_teacher.dart';
import 'package:telmeeth/core/api/teacher/controllers/profile_teacher_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/core/widgets/teacher/teacher_app_bar.dart';

// مثبتين هدول زي ما حكيت
import 'package:telmeeth/features/landing/view/pages/teacher/announcements_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/chatbot_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/my_classes_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/schedule_teacher_page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/upload_files_teacher.dart';


class HomeTeacher extends StatefulWidget {
  const HomeTeacher({super.key});

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<AnnouncementControllerTeacher>()
          .fetchAnnouncements();
      context.read<ProfileTeacherController>().getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileCtrl = context.watch<ProfileTeacherController>();
    final teacherId =
        profileCtrl.profileModel?.data?.teacherProfile?.id;

    final List<FeatureModel> features = [
      FeatureModel(
        title: 'Announcements',
        image: 'assets/image/feature_sample.png',
        page: AnnouncementsTeacher(),
      ),
      FeatureModel(
        title: 'Chat Bot',
        image: 'assets/image/feature_sample.png',
        page: ChatBotTeacher(),
      ),
      FeatureModel(
        title: 'My Classes',
        image: 'assets/image/feature_sample.png',
        page: MyClassesTeacherPage(),
      ),
      if (teacherId != null)
        FeatureModel(
          title: 'Upload Files',
          image: 'assets/image/feature_sample.png',
          page: UploadFilesTeacherPage(teacherId: teacherId),
        ),
      if (teacherId != null)
        FeatureModel(
          title: 'Schedule',
          image: 'assets/image/feature_sample.png',
          page: ScheduleTeacherPage(teacherId: teacherId),
        ),
    ];

    return Scaffold(
      appBar: const TeacherAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ResponsiveValues.h(context, 2.5)),

            /// ===== ANNOUNCEMENTS =====
            Consumer<AnnouncementControllerTeacher>(
              builder: (context, ctrl, _) {
                if (ctrl.isLoading) {
                  return SizedBox(
                    height: ResponsiveValues.h(context, 22),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                if (ctrl.announcements.isEmpty) {
                  return SizedBox(
                    height: ResponsiveValues.h(context, 22),
                    child: const Center(
                      child: Text(
                        'No announcements yet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    SizedBox(
                      height: ResponsiveValues.h(context, 22),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: ctrl.announcements.length,
                        onPageChanged: (i) =>
                            setState(() => _currentPage = i),
                        itemBuilder: (context, index) {
                          final ann = ctrl.announcements[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                ResponsiveValues.w(context, 4)),
                            child: Container(
                              padding:
                              EdgeInsets.all(ResponsiveValues.w(context, 4)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ResponsiveValues.radius(context, 16)),
                                color: Colors.black,
                              ),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                ann.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                  ResponsiveValues.font(context, 20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: ResponsiveValues.h(context, 3)),

            /// ===== FEATURES =====
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveValues.w(context, 4)),
              child: Text(
                'Features',
                style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 22),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: ResponsiveValues.h(context, 2)),

            SizedBox(
              height: ResponsiveValues.h(context, 18),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveValues.w(context, 4)),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return Container(
                    width: ResponsiveValues.w(context, 22),
                    margin: EdgeInsets.only(
                        right: ResponsiveValues.w(context, 4)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => feature.page),
                            );
                          },
                          child: CircleAvatar(
                            radius: ResponsiveValues.w(context, 9),
                            backgroundColor: Colors.orange.shade100,
                            child: Icon(Icons.widgets,
                                color: Colors.orange,
                                size: ResponsiveValues.icon(context, 28)),
                          ),
                        ),
                        SizedBox(height: ResponsiveValues.h(context, 1)),
                        Text(
                          feature.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                            ResponsiveValues.font(context, 14),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
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

  FeatureModel({
    required this.title,
    required this.image,
    required this.page,
  });
}
