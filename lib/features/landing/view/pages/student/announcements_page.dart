import 'package:flutter/material.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

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
      appBar: StudentAppBar(),
      drawer: StudentDrawer(),
      backgroundColor: const Color(0xFFF8F3EE),
      bottomNavigationBar: NavigationBarPrimary(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 6, top: 2),
                child: const Text(
                  "Announcements",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF39566C),
                  ),
                ),
              ),
              // Tabs
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF6F8FB),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _tabButton(
                        "General",
                        0,
                        leftRadius: 8,
                        rightRadius: 0,
                      ),
                    ),
                    Expanded(
                      child: _tabButton(
                        "Teacher",
                        1,
                        leftRadius: 0,
                        rightRadius: 8,
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
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: displayList.length,
                        separatorBuilder: (c, i) => const SizedBox(height: 7),
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
            fontSize: 14,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
                    style: const TextStyle(
                      fontSize: 12.5,
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
                      margin: const EdgeInsets.only(left: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag.toString(),
                        style: TextStyle(
                          color: tagColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 3),
            // Description or Attachment
            if (item.containsKey('attachment'))
              Row(
                children: [
                  const Icon(Icons.attach_file, color: Colors.orange, size: 14),
                  const SizedBox(width: 3),
                  Text(
                    item['attachment'],
                    style: const TextStyle(
                      color: Color(0xFFFF7818),
                      fontWeight: FontWeight.w600,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              )
            else
              Text(
                getTrimmed(item['desc'] ?? "", expanded),
                maxLines: expanded ? 4 : maxLines,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11.5, color: Colors.blueGrey[700]),
              ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  item['date'] ?? "",
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 9.5),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onToggle,
                  child: Row(
                    children: [
                      Text(
                        expanded ? "hide" : "more",
                        style: TextStyle(
                          color: Colors.orange.shade400,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                      Icon(
                        expanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: Colors.orange.shade400,
                        size: 16,
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
