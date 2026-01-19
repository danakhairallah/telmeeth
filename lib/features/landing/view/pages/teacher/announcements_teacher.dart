import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/teacher/teacher_features_app_bar.dart';
import 'package:telmeeth/core/api/teacher/controllers/announcement_controller_teacher.dart';
import 'package:telmeeth/core/api/teacher/model/response/announcement_model_teacher.dart';

class AnnouncementsTeacher extends StatelessWidget {
  const AnnouncementsTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    final mainColor = Colors.black;
    final cardColor = Colors.white;

    return Scaffold(
      appBar: TeacherFeaturesAppBar(),
      backgroundColor: const Color(0xFFF8FAFB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.w(4.3),
            vertical: context.h(2.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Announcements',
                style: TextStyle(
                  fontSize: context.font(22),
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: context.h(0.7)),
              Text(
                "View school announcements for your children",
                style: TextStyle(
                  fontSize: context.font(14),
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: context.h(2.2)),
              SizedBox(height: context.h(2.7)),

              Expanded(
                child: Consumer<AnnouncementControllerTeacher>(
                  builder: (context, ctrl, _) {
                    print("📄 UI announcements count = ${ctrl.announcements.length}");

                    if (ctrl.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (ctrl.errorMessage != null) {
                      return Center(child: Text(ctrl.errorMessage!));
                    }

                    if (ctrl.announcements.isEmpty) {
                      return const Center(child: Text("No announcements yet!"));
                    }

                    return ListView.separated(
                      itemCount: ctrl.announcements.length,
                      separatorBuilder: (c, i) => SizedBox(height: context.h(2)),
                      itemBuilder: (context, index) {
                        final ann = ctrl.announcements[index];
                        return _AnnouncementCard(
                          ann: ann,
                          mainColor: mainColor,
                          cardColor: cardColor,
                          context: context,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _AnnouncementCard({
  required AnnouncementTeacher ann,
  required Color mainColor,
  required Color cardColor,
  required BuildContext context,
}) {
  Color priorityColor = ann.priority == "HIGH" ? Colors.red[200]! : Colors.yellow[200]!;
  Color typeColor = Colors.grey[350]!;

  IconData icon;
  switch (ann.type.toLowerCase()) {
    case "activity":
      icon = Icons.track_changes;
      break;
    case "exam":
      icon = Icons.edit_document;
      break;
    case "holiday":
      icon = Icons.celebration;
      break;
    default:
      icon = Icons.campaign;
  }

  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: context.w(5),
      vertical: context.h(2.6),
    ),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(context.radius(15)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // === بادجز وأيقونات وتواريخ ===
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: context.icon(8), color: mainColor),
            SizedBox(width: context.w(2.7)),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.h(0.3), horizontal: context.w(2)),
              decoration: BoxDecoration(
                color: priorityColor,
                borderRadius: BorderRadius.circular(context.radius(5)),
              ),
              child: Text(
                ann.priority,
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: context.font(10),
                ),
              ),
            ),
            SizedBox(width: context.w(2)),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.h(0.3), horizontal: context.w(2)),
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: BorderRadius.circular(context.radius(5)),
              ),
              child: Text(
                ann.type,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: context.font(10),
                ),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${ann.dateTime.year}-${ann.dateTime.month}-${ann.dateTime.day}",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(11.5),
                  ),
                ),
                Text(
                  "${ann.dateTime.hour.toString().padLeft(2, '0')}:${ann.dateTime.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: context.font(9),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: context.h(2.3)),
        // العنوان (لو فيه)
        Text(
          "School Announcement", // إذا عندك عنوان بالإعلان الفعلي استخدمه هنا
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.font(15.8),
            color: mainColor,
          ),
        ),
        SizedBox(height: context.h(1.4)),
        // نص الإعلان
        Text(
          ann.text,
          style: TextStyle(
            fontSize: context.font(12.5),
            color: Colors.black87,
          ),
        ),
        if (ann.fileUrl != null && ann.fileUrl!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: context.h(2)),
            child: ElevatedButton.icon(
              onPressed: () {
                // تفتح الملف أو الرابط في المتصفح أو عارض ملفات
              },
              icon: Icon(Icons.attach_file, color: Colors.white, size: context.icon(7.8)),
              label: Text(
                "View Attachment",
                style: TextStyle(
                  fontSize: context.font(12.5),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(5.5),
                  vertical: context.h(1.5),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.radius(9)),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
