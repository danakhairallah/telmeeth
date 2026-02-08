import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

import '../../../../../core/widgets/parent/features_app_bar.dart';

class AnnouncementsParent extends StatelessWidget {
  const AnnouncementsParent({super.key});

  // بيانات وهمية للإعلانات
  List<Map<String, dynamic>> get announcements => [
    {
      "icon": Icons.track_changes, // أو Icons.campaign وهكذا
      "priority": "HIGH",
      "priorityColor": Colors.red[200],
      "type": "Activity",
      "typeColor": Colors.grey[350],
      "title": "School Announcement",
      "body":
      "Consequatur itaque exercitationem unde inventore eligendi exercitationem minus nesciunt quae deserunt dolorem unde corrupti iusto rem.",
      "date": "Dec 27, 2025",
      "time": "08:08 AM",
    },
    {
      "icon": Icons.edit_document,
      "priority": "HIGH",
      "priorityColor": Colors.red[200],
      "type": "Exam",
      "typeColor": Colors.grey[350],
      "title": "School Announcement",
      "body":
      "Numquam facere dolor molestiae id iure vel consectetur laborum saepe omnis unde voluptatem maxime labore voluptas placeat.",
      "date": "Dec 26, 2025",
      "time": "06:08 PM",
    },
    {
      "icon": Icons.campaign,
      "priority": "MEDIUM",
      "priorityColor": Colors.yellow[200],
      "type": "General",
      "typeColor": Colors.grey[350],
      "title": "School Announcement",
      "body": "Sapiente quia praesentium voluptate nisi nemo eaque et ipsum consequatur.",
      "date": "Dec 29, 2025",
      "time": "09:08 AM",
    },
    {
      "icon": Icons.edit_document,
      "priority": "MEDIUM",
      "priorityColor": Colors.yellow[200],
      "type": "Exam",
      "typeColor": Colors.grey[350],
      "title": "School Announcement",
      "body": "Quae quibusdam et cumque cum fuga at temporibus reiciendis nostrum veniam et.",
      "date": "Dec 26, 2025",
      "time": "12:08 PM",
    },
    {
      "icon": Icons.celebration,
      "priority": "MEDIUM",
      "priorityColor": Colors.yellow[200],
      "type": "Holiday",
      "typeColor": Colors.grey[350],
      "title": "School Announcement",
      "body": "Inventore dolores tempore nesciunt qui vel dolores iusto et.",
      "date": "Dec 25, 2025",
      "time": "02:08 PM",
    },
    // أضف المزيد من العناصر حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    final Color mainColor =  Colors.black;
    final Color cardColor = Colors.white;

    return Scaffold(
      appBar: FeaturesAppBar(),
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
              // ===== عنوان الصفحة =====
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
              // ===== وصف الصفحة =====
              Text(
                "View school announcements for your children",
                style: TextStyle(
                  fontSize: context.font(14),
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: context.h(2.2)),

              // ===== حقل اختيار الطالب =====
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(5),
                  vertical: context.h(2.1),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.radius(15)),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Child',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.font(13),
                        color: mainColor,
                      ),
                    ),
                    SizedBox(height: context.h(0.6)),
                    DropdownButtonFormField<String>(
                      initialValue: "هند علي سالم",
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: context.h(1.2),
                          horizontal: context.w(2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(context.radius(8)),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: "هند علي سالم",
                          child: Text(
                            "هند علي سالم",
                            style: TextStyle(fontSize: context.font(13)),
                          ),
                        ),
                        // أضف أسماء الطلاب هنا
                      ],
                      onChanged: (v) {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(2.7)),

              // ===== قائمة الإعلانات =====
              Expanded(
                child: ListView.separated(
                  itemCount: announcements.length,
                  separatorBuilder: (c, i) => SizedBox(height: context.h(2)),
                  itemBuilder: (context, index) {
                    final ann = announcements[index];
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
                          // ==== البادجز (الأولوية + النوع) + الأيقونة + التاريخ ====
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(ann["icon"], size: context.icon(8), color: mainColor),
                              SizedBox(width: context.w(2.7)),
                              // Badges
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.h(0.3), horizontal: context.w(2)),
                                decoration: BoxDecoration(
                                  color: ann["priorityColor"],
                                  borderRadius: BorderRadius.circular(context.radius(5)),
                                ),
                                child: Text(
                                  ann["priority"],
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
                                  color: ann["typeColor"],
                                  borderRadius: BorderRadius.circular(context.radius(5)),
                                ),
                                child: Text(
                                  ann["type"],
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
                                    ann["date"],
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.font(11.5),
                                    ),
                                  ),
                                  Text(
                                    ann["time"],
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
                          // ===== العنوان =====
                          Text(
                            ann["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.font(15.8),
                              color: mainColor,
                            ),
                          ),
                          SizedBox(height: context.h(1.4)),
                          // ===== النص =====
                          Text(
                            ann["body"],
                            style: TextStyle(
                              fontSize: context.font(12.5),
                              color: Colors.black87,
                            ),
                          ),
                          if (index == 6)
                            Padding(
                              padding: EdgeInsets.only(top: context.h(2)),
                              child: ElevatedButton.icon(
                                onPressed: () {},
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
