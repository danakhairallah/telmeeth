import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_announcement_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';

import '../../../../../core/widgets/parent/features_app_bar.dart';

class AnnouncementsParent extends StatefulWidget {
  const AnnouncementsParent({super.key});

  @override
  State<AnnouncementsParent> createState() => _AnnouncementsParentState();
}

class _AnnouncementsParentState extends State<AnnouncementsParent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ParentAnnouncementController>().loadAnnouncements(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ParentAnnouncementController>();

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: const Color(0xffF4F6FA),
      body: controller.isLoading
          ? const Center(
        child: CircularProgressIndicator(color: Colors.orange),
      )
          : controller.errorMessage != null
          ? Center(child: Text(controller.errorMessage!))
          : _buildContent(controller),
    );
  }

  Widget _buildContent(ParentAnnouncementController controller) {
    final data = controller.response?.data ?? [];

    if (data.isEmpty) {
      return const Center(
        child: Text(
          "No Announcements Found",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(context.w(4)),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final announcement = data[index];

        return Container(
          margin: EdgeInsets.only(bottom: context.h(2)),
          padding: EdgeInsets.all(context.w(5)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.w(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                announcement.title ?? "",
                style: TextStyle(
                  fontSize: context.w(4.3),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: context.h(1)),

              /// DATE
              Text(
                announcement.date ?? "",
                style: TextStyle(
                  fontSize: context.w(3.2),
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: context.h(1.5)),

              /// CONTENT
              Text(
                announcement.content ?? "",
                style: TextStyle(
                  fontSize: context.w(3.6),
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}