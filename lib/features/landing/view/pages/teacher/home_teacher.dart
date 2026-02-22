import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/announcement_controller_teacher.dart';
import 'package:telmeeth/core/api/teacher/controllers/profile_teacher_controller.dart';
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
      context.read<AnnouncementControllerTeacher>().fetchAnnouncements();
      context.read<ProfileTeacherController>().getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileCtrl = context.watch<ProfileTeacherController>();
    final teacherId = profileCtrl.profileModel?.data?.teacherProfile?.id;

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

            /// ===== ANNOUNCEMENTS (DESIGN LIKE PARENT) =====
            Consumer<AnnouncementControllerTeacher>(
              builder: (context, ctrl, _) {
                if (ctrl.isLoading) {
                  return SizedBox(
                    height: ResponsiveValues.h(context, 22),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                if (ctrl.errorMessage != null) {
                  return SizedBox(
                    height: ResponsiveValues.h(context, 22),
                    child: Center(
                      child: Text(
                        ctrl.errorMessage!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                // ✅ اعرض فقط العامة بالهوم
                final publicList = ctrl.publicAnnouncements;

                if (publicList.isEmpty) {
                  return SizedBox(
                    height: ResponsiveValues.h(context, 22),
                    child: const Center(
                      child: Text(
                        'No public announcements yet',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }

                // ✅ إذا عدد الإعلانات قلّ، تأكد الـcurrentPage ما يطلع برا
                if (_currentPage >= publicList.length) {
                  _currentPage = 0;
                  _pageController.jumpToPage(0);
                }

                return Column(
                  children: [
                    SizedBox(
                      height: ResponsiveValues.h(context, 22),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: publicList.length,
                        onPageChanged: (i) => setState(() => _currentPage = i),
                        itemBuilder: (context, index) {
                          final ann = publicList[index];

                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveValues.w(context, 4),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  ResponsiveValues.radius(context, 16),
                                ),
                                image: const DecorationImage(
                                  image: AssetImage('assets/image/ad_sample.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    ResponsiveValues.radius(context, 16),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.60),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    ann.text,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ResponsiveValues.font(context, 16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: ResponsiveValues.h(context, 1.5)),

                    // ✅ dots لازم تعتمد على publicList
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        publicList.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal: ResponsiveValues.w(context, 1),
                          ),
                          height: ResponsiveValues.h(context, 0.9),
                          width: _currentPage == index
                              ? ResponsiveValues.w(context, 5)
                              : ResponsiveValues.w(context, 2),
                          decoration: BoxDecoration(
                            color: _currentPage == index ? Colors.orange : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(
                              ResponsiveValues.radius(context, 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: ResponsiveValues.h(context, 3)),

            /// ===== FEATURES (DESIGN LIKE PARENT) =====
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveValues.w(context, 4),
              ),
              child: Text(
                'Features',
                style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 18),
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
                  horizontal: ResponsiveValues.w(context, 4),
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];

                  return Container(
                    width: ResponsiveValues.w(context, 22),
                    margin: EdgeInsets.only(
                      right: ResponsiveValues.w(context, 4),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(
                            ResponsiveValues.radius(context, 999),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => feature.page),
                            );
                          },
                          child: Container(
                            height: ResponsiveValues.w(context, 18),
                            width: ResponsiveValues.w(context, 18),
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
                        SizedBox(height: ResponsiveValues.h(context, 0.8)),
                        Text(
                          feature.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ResponsiveValues.font(context, 10),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// ===== OPTIONAL INFO GRID (LIKE PARENT) =====
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveValues.w(context, 4),
              ),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ResponsiveValues.w(context, 3),
                  mainAxisSpacing: ResponsiveValues.w(context, 3),
                  childAspectRatio: 1.5,
                ),
                children: [
                  _HomeInfoBoxTeacher(
                    title: 'My Classes',
                    count: '-',
                    subtitle: 'Your classes',
                    icon: Icons.class_outlined,
                  ),
                  _HomeInfoBoxTeacher(
                    title: 'Uploads',
                    count: '-',
                    subtitle: 'Uploaded files',
                    icon: Icons.upload_file_outlined,
                  ),
                  _HomeInfoBoxTeacher(
                    title: 'Announcements',
                    count: '${context.watch<AnnouncementControllerTeacher>().announcements.length}',
                    subtitle: 'School announcements',
                    icon: Icons.campaign_outlined,
                  ),
                  _HomeInfoBoxTeacher(
                    title: 'Schedule',
                    count: '-',
                    subtitle: 'Weekly schedule',
                    icon: Icons.calendar_month_outlined,
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveValues.h(context, 2)),
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

class _HomeInfoBoxTeacher extends StatelessWidget {
  final String title;
  final String count;
  final String subtitle;
  final IconData icon;

  const _HomeInfoBoxTeacher({
    required this.title,
    required this.count,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveValues.w(context, 3.5),
        vertical: ResponsiveValues.h(context, 1.4),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ResponsiveValues.radius(context, 14),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ResponsiveValues.font(context, 13),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: ResponsiveValues.h(context, 0.6)),
                Text(
                  count,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ResponsiveValues.font(context, 20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ResponsiveValues.h(context, 0.4)),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ResponsiveValues.font(context, 9),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: ResponsiveValues.w(context, 2)),
          Icon(icon, size: ResponsiveValues.icon(context, 24), color: Colors.orange),
        ],
      ),
    );
  }
}