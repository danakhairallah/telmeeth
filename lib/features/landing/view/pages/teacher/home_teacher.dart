import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/announcement_controller_teacher.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/teacher/teacher_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/announcements_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/chatbot_teacher.dart';
import 'package:telmeeth/features/landing/view/pages/parent/my_children_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/transfer_requests_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/discounts_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/communities_parent.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({super.key});

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<FeatureModel> features = [
    FeatureModel(
      title: 'My Children',
      image: 'assets/image/feature_sample.png',
      page: MyChildrenPage(),
    ),
    FeatureModel(
      title: 'Transfer Requests',
      image: 'assets/image/feature_sample.png',
      page: TransferRequestsParent(),
    ),
    FeatureModel(
      title: 'Discounts',
      image: 'assets/image/feature_sample.png',
      page: DiscountsParent(),
    ),
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
      title: 'Communities',
      image: 'assets/image/feature_sample.png',
      page: CommunitiesParent(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnnouncementControllerTeacher>(
        context,
        listen: false,
      ).fetchAnnouncements();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TeacherAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.h(2.5)),

            /// ===== ANNOUNCEMENTS CAROUSEL =====
            Consumer<AnnouncementControllerTeacher>(
              builder: (context, ctrl, _) {
                if (ctrl.isLoading) {
                  return SizedBox(
                    height: context.h(22),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                final data = ctrl.announcements;

                if (data.isEmpty) {
                  return SizedBox(
                    height: context.h(22),
                    child: const Center(
                      child: Text('No announcements yet'),
                    ),
                  );
                }

                return Column(
                  children: [
                    SizedBox(
                      height: context.h(22),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: data.length,
                        onPageChanged: (i) {
                          setState(() => _currentPage = i);
                        },
                        itemBuilder: (context, index) {
                          final ann = data[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.w(4)),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black,
                              ),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                ann.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    /// ===== DOTS =====
                    SizedBox(height: context.h(1.5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        data.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 18 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.orange
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: context.h(3)),

            /// ===== FEATURES =====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              child: const Text(
                'Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: context.h(2)),

            SizedBox(
              height: context.h(18),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => feature.page,
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: context.w(9),
                            backgroundColor: Colors.orange.shade100,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          feature.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
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
