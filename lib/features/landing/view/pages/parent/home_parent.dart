import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_announcement_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/features/landing/view/pages/parent/ai_assistant_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/announcements_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/communities_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/discounts_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/motivational_messages_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/my_children_parent.dart';
import 'package:telmeeth/features/landing/view/pages/parent/transfer_requests_parent.dart';

import '../../../../../core/widgets/parent/parent_app_bar.dart';

class HomeParent extends StatefulWidget {
  const HomeParent({super.key});

  @override
  State<HomeParent> createState() => _HomeParentState();
}

class _HomeParentState extends State<HomeParent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<FeatureModel> features = [
    FeatureModel(
      title: 'My Children',
      image: 'assets/image/feature_sample.png',
      page: MyChildrenPage(),
    ),
    FeatureModel(
      title: 'Transfer',
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
      page: AnnouncementsParent(),
    ),
    FeatureModel(
      title: 'AI Assistant',
      image: 'assets/image/feature_sample.png',
      page: AiAssistantParent(),
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
      // عدّل هنا لاحقاً إذا API فيها جلب للكل
      Provider.of<ParentAnnouncementController>(context, listen: false)
          .loadAnnouncements(1); // أو id الطالب الفعلي    });
    });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ParentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.h(2.5)),

            // ==== PageView إعلانات المدرسة ====
            Consumer<ParentAnnouncementController>(
              builder: (context, announcementController, _) {
                if (announcementController.isLoading) {
                  return SizedBox(
                    height: context.h(22),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (announcementController.errorMessage != null) {
                  return SizedBox(
                    height: context.h(22),
                    child: Center(child: Text(announcementController.errorMessage!)),
                  );
                }

                final data = announcementController.response?.data ?? [];

                return SizedBox(
                  height: context.h(22),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: data.isNotEmpty ? data.length : 1,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final announcement = data.isNotEmpty ? data[index] : null;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.w(4)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/image/ad_sample.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                announcement?.title != null && announcement?.title != ""
                                    ? (announcement!.title!)
                                    : 'No Announcements Yet!',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            SizedBox(height: context.h(1.5)),
            Consumer<ParentAnnouncementController>(
              builder: (context, announcementController, _) {
                final data = announcementController.response?.data ?? [];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    data.isNotEmpty ? data.length : 1,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 18 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.orange
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: context.h(3)),

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
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => features[index].page,
                              ),
                            );
                          },
                          child: Container(
                            height: context.w(18),
                            width: context.w(18),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.withOpacity(0.15),
                              image: DecorationImage(
                                image: AssetImage(features[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          feature.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.5,
                ),
                children: const [
                  _HomeInfoBox(
                    title: 'My Children',
                    count: '1',
                    subtitle: 'Registered children',
                    icon: Icons.group_outlined,
                  ),
                  _HomeInfoBox(
                    title: 'Messages',
                    count: '1',
                    subtitle: 'Motivational messages',
                    icon: Icons.message_outlined,
                  ),
                  _HomeInfoBox(
                    title: 'Announcements',
                    count: '13',
                    subtitle: 'School announcements',
                    icon: Icons.campaign_outlined,
                  ),
                  _HomeInfoBox(
                    title: 'Attendance',
                    count: '6',
                    subtitle: 'Attendance records',
                    icon: Icons.menu_book_outlined,
                  ),
                ],
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
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  count,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 9, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, size: 24, color: Colors.orange),
        ],
      ),
    );
  }
}
