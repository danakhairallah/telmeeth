import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> generalAnnouncements = [
    {
      "title":
          "Alias qui similique eum illo nemo est quae consequatur qui rem doloribus.",
      "desc":
          "Alias qui similique eum illo nemo est quae consequatur qui rem doloribus. هنا مزيد من النص حتى نجرب الزيادة.",
      "date": "12/28/2025, 5:56:41 PM",
      "tags": ["high", "exam"],
    },
    {
      "title":
          "Provident quaerat rerum quam perspiciatis perferendis sint nostrum veniam saepe deleniti velit enim culpa eum odio.",
      "desc":
          "Provident quaerat rerum quam perspiciatis perferendis sint nostrum veniam saepe deleniti velit enim culpa eum odio.",
      "date": "12/23/2025, 5:56:41 PM",
      "tags": ["high", "exam"],
    },
    {
      "title":
          "Veritatis fugiat dolorem asperiores impedit autem amet dolores.",
      "desc": "Veritatis fugiat dolorem asperiores impedit autem amet dolores.",
      "date": "12/23/2025, 9:56:41 AM",
      "tags": ["high", "holiday"],
    },
    {
      "title":
          "Et et qui rem atque itaque enim quod adipisci.",
      "desc": "Et et qui rem atque itaque enim quod adipisci.",
      "date": "12/22/2025, 3:56:41 PM",
      "tags": ["high", "activity"],
    },
    {
      "title":
          "Perspiciatis ipsum aut et qui et est aut officiis recusandae officiis.",
      "desc": "Perspiciatis ipsum aut et qui et est aut officiis recusandae officiis.",
      "date": "12/22/2025, 10:56:41 AM",
      "tags": ["high", "holiday"],
    },
    {
      "title":
          "Consequatur ex quod doloremque tenetur quam exercitationem quasi consequatur voluptate et ullam exercitationem.",
      "desc":
          "Consequatur ex quod doloremque tenetur quam exercitationem quasi consequatur voluptate et ullam exercitationem.",
      "date": "12/20/2025, 8:56:41 PM",
      "tags": ["high", "activity"],
    },
    {
      "title":
          "Repellendus nihil a iste voluptas enim reiciendis in in enim eius esse quis sed assumenda.",
      "desc":
          "Repellendus nihil a iste voluptas enim reiciendis in in enim eius esse quis sed assumenda.",
      "date": "12/29/2025, 3:56:41 PM",
      "tags": ["medium", "exam"],
    },
    {
      "title":
          "Laboriosam aliquam consequatur est est aut est sunt praesentium ducimus quam sequi voluptatem.",
      "desc":
          "Laboriosam aliquam consequatur est est aut est sunt praesentium ducimus quam sequi voluptatem.",
      "date": "12/19/2025, 2:56:41 PM",
      "tags": ["medium", "activity"],
    },
    {
      "title":
          "Perferendis at est consectetur commodi quaerat molestiae accusantium et expedita consequatur quidem deleniti consectetur minima.",
      "desc":
          "Perferendis at est consectetur commodi quaerat molestiae accusantium et expedita consequatur quidem deleniti consectetur minima.",
      "date": "12/22/2025, 2:56:41 PM",
      "tags": ["low", "exam"],
      "attachment": "View Attachment",
    },
  ];

  final List<Map<String, dynamic>> teacherAnnouncements = [];

  final Map<int, bool> expandedCards = {};

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayList = selectedTab == 0
        ? generalAnnouncements
        : teacherAnnouncements;

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF8F3EE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(1.7), vertical: context.h(1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: context.w(1.4), top: context.h(0.2)),
                child: Text(
                  "Announcements",
                  style: TextStyle(
                    fontSize: context.w(6),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF39566C),
                  ),
                ),
              ),
              // Tabs
              Container(
                margin: EdgeInsets.only(bottom: context.h(1)),
                height: context.h(3.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.h(0.8)),
                  color: const Color(0xFFF6F8FB),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _tabButton(
                        "General",
                        0,
                        leftRadius: context.w(1.9),
                        rightRadius: 0,
                      ),
                    ),
                    Expanded(
                      child: _tabButton(
                        "Teacher",
                        1,
                        leftRadius: 0,
                        rightRadius: context.w(1.9),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: displayList.isEmpty
                    ? Center(
                        child: Text(
                          selectedTab == 0
                              ? "No general announcements"
                              : "No teacher announcements",
                          style: TextStyle(
                            fontSize: context.w(3.1),
                            color: Colors.blueGrey,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: displayList.length,
                        separatorBuilder: (c, i) => SizedBox(height: context.h(0.7)),
                        itemBuilder: (context, i) {
                          return _announcementCard(
                            displayList[i],
                            context,
                            i,
                            expandedCards[i] ?? false,
                            () => setState(() {
                              expandedCards[i] = !(expandedCards[i] ?? false);
                            }),
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

  Widget _tabButton(
    String label,
    int index, {
    double leftRadius = 0,
    double rightRadius = 0,
  }) {
    bool selected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftRadius),
            bottomLeft: Radius.circular(leftRadius),
            topRight: Radius.circular(rightRadius),
            bottomRight: Radius.circular(rightRadius),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.blueGrey[800],
            fontSize: context.w(3.4),
          ),
        ),
      ),
    );
  }

  Widget _announcementCard(
    Map<String, dynamic> item,
    BuildContext context,
    int index,
    bool expanded,
    VoidCallback onToggle,
  ) {
    const int maxLines = 2;

    String getTrimmed(String text, bool expanded) {
      if (expanded) return text;
      if (text.length <= 70) return text;
      return text.substring(0, 70) + "...";
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: context.w(2.4), vertical: context.h(0.8)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.h(1)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title + tags
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    getTrimmed(item['title'] ?? "", expanded),
                    maxLines: expanded ? 4 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: context.w(3.04),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF39566C),
                    ),
                  ),
                ),
                Row(
                  children: (item['tags'] as List<dynamic>).map((tag) {
                    Color tagColor;
                    Color bgColor;

                    if (tag == "high") {
                      tagColor = Colors.red.shade400;
                      bgColor = const Color(0xFFFEE4E2);
                    } else if (tag == "medium") {
                      tagColor = Colors.orange.shade400;
                      bgColor = const Color(0xFFFFF1E4);
                    } else if (tag == "low") {
                      tagColor = Colors.orange.shade200;
                      bgColor = const Color(0xFFFFF6E4);
                    } else {
                      tagColor = Colors.orange.shade300;
                      bgColor = const Color(0xFFFFF6E4);
                    }

                    return Container(
                      margin: EdgeInsets.only(left: context.w(0.4)),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(1.7),
                        vertical: context.h(0.2),
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(context.h(1)),
                      ),
                      child: Text(
                        tag.toString(),
                        style: TextStyle(
                          color: tagColor,
                          fontWeight: FontWeight.w600,
                          fontSize: context.w(2.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: context.h(0.3)),
            // Description or Attachment
            if (item.containsKey('attachment'))
              Row(
                children: [
                  Icon(Icons.attach_file, color: Colors.orange, size: context.w(3.4)),
                  SizedBox(width: context.w(0.7)),
                  Text(
                    item['attachment'],
                    style: TextStyle(
                      color: Color(0xFFFF7818),
                      fontWeight: FontWeight.w600,
                      fontSize: context.w(2.5)
                    ),
                  ),
                ],
              )
            else
              Text(
                getTrimmed(item['desc'] ?? "", expanded),
                maxLines: expanded ? 4 : maxLines,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: context.w(2.7), color: Colors.blueGrey[700]),
              ),
            SizedBox(height: context.h(0.2)),
            Row(
              children: [
                Text(
                  item['date'] ?? "",
                  style: TextStyle(color: Colors.blueGrey, fontSize: context.w(2.3)),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onToggle,
                  child: Row(
                    children: [
                      Text(
                        expanded ? "hide" : "more",
                        style: TextStyle(
                          color: Colors.orange.shade400,
                          fontWeight: FontWeight.w600,
                          fontSize: context.w(2.4),
                        ),
                      ),
                      Icon(
                        expanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: Colors.orange.shade400,
                        size: context.w(3.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
