import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> myCommunities = [
    {
      "name": "Math Lovers",
      "desc": "No description available",
      "members": 0,
      "isMember": true,
    },
    {
      "name": "Parent Support Group",
      "desc": "No description available",
      "members": 0,
      "isMember": false,
    },
  ];

  final List<Map<String, dynamic>> discoverCommunities = [
    {
      "name": "Science Club",
      "desc": "No description available",
      "members": 0,
      "isMember": false,
    },
    {
      "name": "Drama Enthusiasts",
      "desc": "No description available",
      "members": 0,
      "isMember": false,
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    double maxCardWidth = isMobile ? width - context.w(12.1) : context.w(85.1);

    List<Map<String, dynamic>> communities = selectedTab == 0
        ? myCommunities
        : discoverCommunities;

    if (searchQuery.isNotEmpty) {
      communities = communities
          .where((c) =>
          c["name"].toString().toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: NavigationBarPrimary(),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.4) : context.w(6.8), vertical: isMobile ? context.h(0.8) : context.h(1.7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Communities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? context.w(6) : context.w(7.2),
                color: Colors.black,
              ),
            ),
            SizedBox(height: isMobile ? context.h(0.4) : context.h(0.6)),
            Text(
              "connect_with_peers_and_teachers",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: isMobile ? context.w(2.6) : context.w(3.6),
                letterSpacing: context.w(0.07),
              ),
            ),
            SizedBox(height: isMobile ? context.h(1.2) : context.h(1.8)),

            // Search bar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: isMobile ? context.w(82.7) : context.w(77.8),
                  child: TextField(
                    onChanged: (val) => setState(() => searchQuery = val),
                    style: TextStyle(fontSize: isMobile ? context.w(2.9) : context.w(3.6)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.blueGrey, size: context.w(5.1)),
                      hintText: "Search communities...",
                      hintStyle: TextStyle(fontSize: isMobile ? context.w(2.9) : context.w(3.6), color: Colors.blueGrey[300]),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: context.w(2.4)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(context.h(1)),
                        borderSide: const BorderSide(color: Color(0xFFE5E9F2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(context.h(1)),
                        borderSide: const BorderSide(color: Color(0xFFE5E9F2)),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: isMobile ? context.h(1.2) : context.h(1.9)),

            // Tabs - centered under the search
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: isMobile ? context.w(68.1) : context.w(92.4), // كبرنا العرض
                  padding: EdgeInsets.all(context.w(0.9)), // فراغ حول الأبيض
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.h(1.3)),
                    color: const Color(0xFFF6F8FB),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: _tabButton("My Communities", 0, isMobile)),
                      Expanded(child: _tabButton("Discover", 1, isMobile)),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: isMobile ? context.h(1.4) : context.h(2.6)),

            Expanded(
              child: communities.isEmpty
                  ? Center(
                child: Text(
                  "No communities found.",
                  style: TextStyle(fontSize: isMobile ? context.w(3.1) : context.w(3.6), color: Colors.grey),
                ),
              )
                  : SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    spacing: isMobile ? 0 : context.h(2.8),
                    runSpacing: context.w(3.4),
                    alignment: WrapAlignment.center,
                    children: List.generate(communities.length, (i) {
                      return SizedBox(
                        width: maxCardWidth,
                        child: _communityCard(
                          communities[i],
                          isMobile: isMobile,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index, bool isMobile) {
    bool selected = selectedTab == index;

    return InkWell(
      borderRadius: BorderRadius.circular(context.h(1)),
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        height: context.h(3.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(context.h(1)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? context.w(3.1) : context.w(3.8),
            color: selected ? Colors.black : Colors.blueGrey[400],
          ),
        ),
      ),
    );
  }

  Widget _communityCard(Map<String, dynamic> community, {bool isMobile = false}) {
    bool isMember = community["isMember"] == true;
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: isMobile ? context.h(0.7) : context.h(1), horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.h(1.4)),
        side: BorderSide(color: Color(0xFFE7EAF0), width: context.w(0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: isMobile ? context.h(1.6) : context.h(2.4), horizontal: isMobile ? context.w(2.4) : context.w(4.6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Badge
            Row(
              children: [
                Expanded(
                  child: Text(
                    community["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? context.w(3.8) : context.w(4.6),
                    ),
                  ),
                ),
                if (isMember && selectedTab == 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: context.w(2.1), vertical: context.h(0.2)),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F5FA),
                        borderRadius: BorderRadius.circular(context.h(1.2))),
                    child: Text(
                      "Member",
                      style: TextStyle(
                        color: const Color(0xFF444C56),
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? context.w(2.5) : context.w(3.1),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: isMobile ? context.h(0.4) : context.h(0.7)),
            Text(
              community["desc"],
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: isMobile ? context.w(2.6) : context.w(3.2),
                  height: context.h(0.14)),
            ),
            SizedBox(height: isMobile ? context.h(0.9) : context.h(1.6)),
            Row(
              children: [
                Icon(Icons.people_alt_outlined, color: Colors.blueGrey, size: isMobile ? context.w(3.8) : context.w(4.3)),
                SizedBox(width: context.w(1.2)),
                Text("${community["members"]} Members",
                    style: TextStyle(
                        color: Colors.blueGrey, fontSize: isMobile ? context.w(2.6) : context.w(3.1))),
              ],
            ),
            SizedBox(height: isMobile ? context.h(1) : context.h(1.8)),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: isMember && selectedTab == 0
                  ? OutlinedButton.icon(
                icon: Icon(Icons.logout, color: Colors.redAccent, size: isMobile ? context.w(3.8) : context.w(4.6)),
                label: Text("Leave Community",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold, fontSize: isMobile ? context.w(2.7) : context.w(3.1))),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(1.2) : context.h(1.4)),
                  side: BorderSide(color: Color(0xFFFFE3E3), width: context.w(0.3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.h(0.9)),
                  ),
                ),
              )
                  : ElevatedButton.icon(
                icon: Icon(Icons.add, color: Colors.white, size: isMobile ? context.w(3.8) : context.w(4.6)),
                label: Text(
                  "Join Community",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? context.w(2.7) : context.w(3.4)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(1.2) : context.h(1.4)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.h(0.9)),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}