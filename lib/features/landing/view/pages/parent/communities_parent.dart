import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';

class CommunitiesParent extends StatefulWidget {
  const CommunitiesParent({super.key});

  @override
  State<CommunitiesParent> createState() => _CommunitiesParentState();
}

class _CommunitiesParentState extends State<CommunitiesParent> {
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

    List<Map<String, dynamic>> communities =
    selectedTab == 0 ? myCommunities : discoverCommunities;

    if (searchQuery.isNotEmpty) {
      communities = communities
          .where((c) => c["name"]
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase()))
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 HEADER (مثل باقي الصفحات)
            Container(
              padding: EdgeInsets.all(context.w(5)),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primaryDark,
                  ],
                ),
                borderRadius:
                BorderRadius.circular(context.radius(25)),
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
                  Container(
                    padding: EdgeInsets.all(context.w(3)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.groups_outlined,
                      color: Colors.white,
                      size: context.icon(26),
                    ),
                  ),
                  SizedBox(width: context.w(4)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Communities",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: context.font(18),
                          ),
                        ),
                        SizedBox(height: context.h(0.5)),
                        Text(
                          "Connect with other parents",
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
            ),

            SizedBox(height: context.h(3)),

            /// 🔎 SEARCH
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: context.w(4)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(context.radius(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(fontSize: context.font(12)),
                onChanged: (val) =>
                    setState(() => searchQuery = val),
                decoration: InputDecoration(
                  icon: Icon(Icons.search,
                      color: AppColors.primary),
                  hintText: "Search communities...",
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: context.h(2)),

            /// 🔥 TABS احترافية
            Container(
              padding: EdgeInsets.all(context.w(1)),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius:
                BorderRadius.circular(context.radius(30)),
              ),
              child: Row(
                children: [
                  _tabButton("My Communities", 0),
                  _tabButton("Discover", 1),
                ],
              ),
            ),

            SizedBox(height: context.h(2)),

            /// 🔥 LIST
            Expanded(
              child: communities.isEmpty
                  ? Center(
                child: Text(
                  "No communities found.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: context.font(13),
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: communities.length,
                itemBuilder: (context, index) {
                  return _communityCard(
                      communities[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _tabButton(String label, int index) {
    final selected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () =>
            setState(() => selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(
              vertical: context.h(1)),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary
                : Colors.transparent,
            borderRadius:
            BorderRadius.circular(context.radius(30)),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color:
              selected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: context.font(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _communityCard(Map<String, dynamic> community) {
    final isMember = community["isMember"] == true;

    return Container(
      margin: EdgeInsets.only(bottom: context.h(2)),
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                padding:
                EdgeInsets.all(context.w(3)),
                decoration: BoxDecoration(
                  color: AppColors.primary
                      .withOpacity(.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.group,
                  color: AppColors.primary,
                  size: context.icon(18),
                ),
              ),
              SizedBox(width: context.w(3)),
              Expanded(
                child: Text(
                  community["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(14),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: context.h(1)),

          Text(
            community["desc"],
            style: TextStyle(
              color: Colors.grey,
              fontSize: context.font(12),
            ),
          ),

          SizedBox(height: context.h(1.5)),

          Row(
            children: [
              Icon(Icons.people_alt_outlined,
                  size: context.icon(16),
                  color: Colors.grey),
              SizedBox(width: context.w(2)),
              Text(
                "${community["members"]} Members",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: context.font(11),
                ),
              ),
            ],
          ),

          SizedBox(height: context.h(2)),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isMember
                    ? Colors.grey[200]
                    : AppColors.primary,
                foregroundColor: isMember
                    ? Colors.black
                    : Colors.white,
                padding: EdgeInsets.symmetric(
                    vertical: context.h(1.2)),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                      context.radius(15)),
                ),
              ),
              onPressed: () {
                setState(() {
                  community["isMember"] =
                  !isMember;
                });
              },
              child: Text(
                isMember
                    ? "Leave Community"
                    : "Join Community",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
