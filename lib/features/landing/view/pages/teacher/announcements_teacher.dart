import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/teacher/teacher_features_app_bar.dart';
import 'package:telmeeth/core/api/teacher/controllers/announcement_controller_teacher.dart';
import 'package:telmeeth/core/api/teacher/model/response/announcement_model_teacher.dart';

class AnnouncementsTeacher extends StatefulWidget {
  const AnnouncementsTeacher({super.key});

  @override
  State<AnnouncementsTeacher> createState() => _AnnouncementsTeacherState();
}

class _AnnouncementsTeacherState extends State<AnnouncementsTeacher> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AnnouncementControllerTeacher>().fetchAnnouncements();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnnouncementControllerTeacher>(
      builder: (context, ctrl, _) {
        return Scaffold(
          backgroundColor: const Color(0xffF7F8FA),
          appBar: TeacherFeaturesAppBar(),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primary,
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text("Create", style: TextStyle(color: Colors.white)),
            onPressed: () {
              // TODO: افتح صفحة إنشاء إعلان (رح أعطيك صفحة جاهزة تحت)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const _CreateAnnouncementTeacherPage()),
              );
            },
          ),
          body: ctrl.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
              : ctrl.errorMessage != null
              ? _ErrorState(
            message: ctrl.errorMessage!,
            onRetry: () => ctrl.fetchAnnouncements(),
          )
              : _buildContent(context, ctrl),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, AnnouncementControllerTeacher ctrl) {
    final list = ctrl.filteredAnnouncements;

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.w(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderCardTeacher(
            title: "Announcements",
            subtitle: "Manage and view announcements for your classes",
            icon: Icons.campaign,
          ),
          SizedBox(height: context.h(2)),

          // ===== FILTER CHIPS =====
          Row(
            children: [
              _FilterChipTeacher(
                label: "All",
                selected: ctrl.scopeFilter == AnnouncementScopeFilter.all,
                onTap: () => ctrl.setScopeFilter(AnnouncementScopeFilter.all),
              ),
              SizedBox(width: context.w(2)),
              _FilterChipTeacher(
                label: "Public",
                selected: ctrl.scopeFilter == AnnouncementScopeFilter.publicOnly,
                onTap: () => ctrl.setScopeFilter(AnnouncementScopeFilter.publicOnly),
              ),
              SizedBox(width: context.w(2)),
              _FilterChipTeacher(
                label: "Private",
                selected: ctrl.scopeFilter == AnnouncementScopeFilter.privateOnly,
                onTap: () => ctrl.setScopeFilter(AnnouncementScopeFilter.privateOnly),
              ),
            ],
          ),

          SizedBox(height: context.h(2)),

          if (list.isEmpty)
            const _EmptyState(message: "No announcements found for this filter.")
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (_, __) => SizedBox(height: context.h(1.5)),
              itemBuilder: (context, index) => _AnnouncementCardTeacher(
                ann: list[index],
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderCardTeacher extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _HeaderCardTeacher({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(context.radius(25)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.shadowBlur(18),
            offset: Offset(0, context.shadowOffsetY(6)),
            color: AppColors.primary.withOpacity(0.35),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: context.w(7),
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(icon, color: Colors.white, size: context.icon(26)),
          ),
          SizedBox(width: context.w(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.font(17),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.h(0.5)),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: context.font(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChipTeacher extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChipTeacher({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.radius(999)),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(4),
          vertical: context.h(0.9),
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withOpacity(0.15) : Colors.white,
          borderRadius: BorderRadius.circular(context.radius(999)),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: context.font(12),
            fontWeight: FontWeight.w600,
            color: selected ? AppColors.primary : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}

class _AnnouncementCardTeacher extends StatelessWidget {
  final AnnouncementTeacher ann;

  const _AnnouncementCardTeacher({required this.ann});

  bool get isHigh => ann.priority.toUpperCase() == "HIGH";

  IconData get typeIcon {
    switch (ann.type.toLowerCase()) {
      case "activity":
        return Icons.track_changes;
      case "exam":
        return Icons.edit_document;
      case "holiday":
        return Icons.celebration;
      case "public":
      case "general":
        return Icons.public;
      case "private":
        return Icons.lock;
      default:
        return Icons.campaign;
    }
  }

  @override
  Widget build(BuildContext context) {
    final priorityColor = isHigh ? Colors.red : AppColors.primary;
    final dateStr =
        "${ann.dateTime.year}-${ann.dateTime.month.toString().padLeft(2, '0')}-${ann.dateTime.day.toString().padLeft(2, '0')}";
    final timeStr =
        "${ann.dateTime.hour.toString().padLeft(2, '0')}:${ann.dateTime.minute.toString().padLeft(2, '0')}";

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(context.w(2.8)),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(typeIcon, size: context.icon(18), color: AppColors.primary),
              ),
              SizedBox(width: context.w(3)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "School Announcement",
                      style: TextStyle(
                        fontSize: context.font(14),
                        fontWeight: FontWeight.bold,
                        color: AppColors.petrolGreen,
                      ),
                    ),
                    SizedBox(height: context.h(0.4)),
                    Text(
                      "$dateStr • $timeStr",
                      style: TextStyle(
                        fontSize: context.font(10.5),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.w(3), vertical: context.h(0.6)),
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(context.radius(999)),
                ),
                child: Text(
                  ann.priority,
                  style: TextStyle(
                    color: priorityColor,
                    fontSize: context.font(10.5),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: context.h(1.6)),

          Text(
            ann.text,
            style: TextStyle(
              fontSize: context.font(12.8),
              color: Colors.black87,
              height: 1.35,
            ),
          ),

          if (ann.fileUrl != null && ann.fileUrl!.trim().isNotEmpty) ...[
            SizedBox(height: context.h(1.6)),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: افتح الرابط (url_launcher) أو viewer
                },
                icon: Icon(Icons.attach_file, color: Colors.white, size: context.icon(16)),
                label: Text(
                  "View Attachment",
                  style: TextStyle(
                    fontSize: context.font(12),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(5),
                    vertical: context.h(1.3),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.radius(12)),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(20)),
      ),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: context.icon(30), color: Colors.grey.shade400),
          SizedBox(height: context.h(1)),
          Text(
            message,
            style: TextStyle(fontSize: context.font(12.5), color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.w(6)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: context.icon(34), color: Colors.red),
            SizedBox(height: context.h(1)),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: context.font(12.5), color: Colors.grey.shade800),
            ),
            SizedBox(height: context.h(2)),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Placeholder Create Page (بدنا نعملها fully بعدين) =====
class _CreateAnnouncementTeacherPage extends StatelessWidget {
  const _CreateAnnouncementTeacherPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: TeacherFeaturesAppBar(),
      body: Center(
        child: Text(
          "Create Announcement Page (Next Step)",
          style: TextStyle(fontSize: context.font(14), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}