import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  int selectedTab = 0;
  String searchQuery = "";

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
      "isMember": true,
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    List<Map<String, dynamic>> communities = selectedTab == 0
        ? myCommunities
        : discoverCommunities;

    if (searchQuery.isNotEmpty) {
      communities = communities
          .where(
            (c) => c["name"].toString().toLowerCase().contains(
          searchQuery.toLowerCase(),
        ),
      )
          .toList();
    }

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? context.w(3) : context.w(6),
          vertical: context.h(1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Communities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? context.w(6) : context.w(7),
              ),
            ),
            SizedBox(height: context.h(0.5)),
            Text(
              "Connect with other parents and teachers",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: isMobile ? context.w(2.6) : context.w(3.4),
              ),
            ),

            SizedBox(height: context.h(1.8)),

            TextField(
              onChanged: (val) => setState(() => searchQuery = val),
              style: TextStyle(
                fontSize: isMobile ? context.w(2.9) : context.w(3.6),
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: context.w(5)),
                hintText: "Search communities...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: context.w(3)),
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

            SizedBox(height: context.h(1.8)),

            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.w(1)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F8FB),
                  borderRadius: BorderRadius.circular(context.h(1.2)),
                ),
                child: Row(
                  children: [
                    Expanded(child: _tabButton("My Communities", 0, isMobile)),
                    Expanded(child: _tabButton("Discover", 1, isMobile)),
                  ],
                ),
              ),
            ),

            SizedBox(height: context.h(1.8)),

            Expanded(
              child: communities.isEmpty
                  ? Center(
                child: Text(
                  "No communities found.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isMobile ? context.w(3) : context.w(3.6),
                  ),
                ),
              )
                  : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: communities.length,
                itemBuilder: (context, index) {
                  return _communityCard(
                    communities[index],
                    isMobile: isMobile,
                  );
                },
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
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? context.w(3) : context.w(3.6),
            color: selected ? Colors.black : Colors.blueGrey,
          ),
        ),
      ),
    );
  }

  Widget _communityCard(
      Map<String, dynamic> community, {
        required bool isMobile,
      }) {
    bool isMember = community["isMember"] == true;

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: context.h(0.8)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.h(1.4)),
        side: const BorderSide(color: Color(0xFFE7EAF0), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.h(1.6),
          horizontal: context.w(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              community["name"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? context.w(3.8) : context.w(4.6),
              ),
            ),

            SizedBox(height: context.h(0.4)),

            Text(
              community["desc"],
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: isMobile ? context.w(2.6) : context.w(3.2),
              ),
            ),

            SizedBox(height: context.h(1.2)),

            Row(
              children: [
                Icon(
                  Icons.people_alt_outlined,
                  size: isMobile ? context.w(3.8) : context.w(4.4),
                  color: Colors.blueGrey,
                ),
                SizedBox(width: context.w(1.2)),
                Text(
                  "${community["members"]} Members",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: isMobile ? context.w(2.6) : context.w(3.1),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.h(1.6)),

            /// Button
            SizedBox(
              width: double.infinity,
              child: isMember
                  ? OutlinedButton.icon(
                icon: Icon(
                  Icons.logout,
                  color: Color(0xFFFF8C00),
                  size: isMobile ? context.w(3.8) : context.w(4.6),
                ),
                label: Text(
                  "Leave Community",
                  style: TextStyle(
                    color: Color(0xFFFF8C00),
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? context.w(2.7) : context.w(3.1),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xFF111827),
                    width: 1.2,
                  ),
                  padding: EdgeInsets.symmetric(vertical: context.h(1.2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.h(0.9)),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    community["isMember"] = false;
                  });
                },
              )
                  : ElevatedButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: isMobile ? context.w(3.8) : context.w(4.6),
                ),
                label: Text(
                  "Join Community",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? context.w(2.7) : context.w(3.4),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827), // كحلي
                  padding: EdgeInsets.symmetric(vertical: context.h(1.2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.h(0.9)),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    community["isMember"] = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
