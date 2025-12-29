import 'package:flutter/material.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

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
    double maxCardWidth = isMobile ? width - 50 : 350;

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
      drawer: const StudentDrawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarPrimary(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 28, vertical: isMobile ? 8 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Communities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 25 : 30,
                color: Colors.black,
              ),
            ),
            SizedBox(height: isMobile ? 4 : 6),
            Text(
              "connect_with_peers_and_teachers",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: isMobile ? 11 : 15,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(height: isMobile ? 11 : 17),

            // Search bar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: isMobile ? 340 : 320,
                  child: TextField(
                    onChanged: (val) => setState(() => searchQuery = val),
                    style: TextStyle(fontSize: isMobile ? 12 : 15),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.blueGrey, size: 21),
                      hintText: "Search communities...",
                      hintStyle: TextStyle(fontSize: isMobile ? 12 : 15, color: Colors.blueGrey[300]),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE5E9F2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE5E9F2)),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: isMobile ? 11 : 18),

            // Tabs - centered under the search
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: isMobile ? 280 : 380, // كبرنا العرض
                  padding: const EdgeInsets.all(4), // فراغ حول الأبيض
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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

            SizedBox(height: isMobile ? 13 : 24),

            Expanded(
              child: communities.isEmpty
                  ? Center(
                child: Text(
                  "No communities found.",
                  style: TextStyle(fontSize: isMobile ? 13 : 15, color: Colors.grey),
                ),
              )
                  : SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    spacing: isMobile ? 0 : 26,
                    runSpacing: 14,
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
      borderRadius: BorderRadius.circular(10),
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 13 : 16,
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
      margin: EdgeInsets.symmetric(vertical: isMobile ? 7 : 10, horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: const BorderSide(color: Color(0xFFE7EAF0), width: 1.2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: isMobile ? 15 : 22, horizontal: isMobile ? 10 : 19),
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
                      fontSize: isMobile ? 16 : 19,
                    ),
                  ),
                ),
                if (isMember && selectedTab == 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F5FA),
                        borderRadius: BorderRadius.circular(11)),
                    child: Text(
                      "Member",
                      style: TextStyle(
                        color: const Color(0xFF444C56),
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 10.5 : 13,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: isMobile ? 4 : 7),
            Text(
              community["desc"],
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: isMobile ? 11 : 13.5,
                  height: 1.3),
            ),
            SizedBox(height: isMobile ? 9 : 15),
            Row(
              children: [
                Icon(Icons.people_alt_outlined, color: Colors.blueGrey, size: isMobile ? 16 : 18),
                const SizedBox(width: 5),
                Text("${community["members"]} Members",
                    style: TextStyle(
                        color: Colors.blueGrey, fontSize: isMobile ? 11 : 13)),
              ],
            ),
            SizedBox(height: isMobile ? 10 : 17),
            SizedBox(
              width: double.infinity,
              child: isMember && selectedTab == 0
                  ? OutlinedButton.icon(
                icon: Icon(Icons.logout, color: Colors.redAccent, size: isMobile ? 16 : 19),
                label: Text("Leave Community",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold, fontSize: isMobile ? 11.2 : 13)),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: isMobile ? 11 : 13),
                  side: const BorderSide(color: Color(0xFFFFE3E3), width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              )
                  : ElevatedButton.icon(
                icon: Icon(Icons.add, color: Colors.white, size: isMobile ? 16 : 19),
                label: Text(
                  "Join Community",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 11.5 : 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: EdgeInsets.symmetric(vertical: isMobile ? 11 : 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
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
