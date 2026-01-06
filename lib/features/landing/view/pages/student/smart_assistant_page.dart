import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class SmartAssistant extends StatefulWidget {
  const SmartAssistant({super.key});

  @override
  State<SmartAssistant> createState() => _SmartAssistantState();
}

class _SmartAssistantState extends State<SmartAssistant> {
  int _selectedTab = 0;

  String latestAdvice =
      "إخصص 15 دقيقة يومياً لمراجعة المواد. استخدم الألوان و الرسوم لتسهيل الفهم. اجعل الدراسة ممتعة بقراءة القصص أو اللعب بألعاب تعليمية. تذكر، كل دقيقة تدرسها تقربك من النجاح";
  String adviceDate = "12/29/2025, 2:24:17 PM";

  List<Map<String, String>> adviceHistory = [
    {
      "title": "AI Advice",
      "content":
          "إخصص 15 دقيقة يومياً لمراجعة المواد. استخدم الألوان و الرسوم لتسهيل الفهم. اجعل الدراسة ممتعة بقراءة القصص أو اللعب بألعاب تعليمية. تذكر، كل دقيقة تدرسها تقربك من النجاح",
      "date": "12/29/2025, 2:24:17 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: AppDrawer(),
      backgroundColor: const Color(0xF8F3EEE7),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.all(context.w(1.9)),
        child: NavigationBarPrimary(),
      )),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          children: [
            // Title
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: context.h(0.8), horizontal: context.w(1.9)),
              child: Text(
                "AI Assistant",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.w(5.5),
                  color: Color(0xFF39566C),
                ),
              ),
            ),
            SizedBox(height: context.h(0.4)),
            // Tabs
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: context.h(1)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.h(1)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _tabButton("Chat", 0 , context),
                    _tabButton("AI Advice", 1 , context),
                    _tabButton("Reports", 2 , context),
                  ],
                ),
              ),
            ),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index , BuildContext context) {
    bool selected = _selectedTab == index;
    return InkWell(
      onTap: () => setState(() => _selectedTab = index),
      borderRadius: BorderRadius.circular(context.h(0.8)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.w(6.3), vertical: context.h(0.7)),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(context.h(0.8)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.w600,
            color: selected ? Colors.black : Colors.blueGrey[900],
            fontSize: context.w(4),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        // Chat
        return _chatTab();
      case 1:
        // AI Advice
        return _adviceTab();
      case 2:
        // Reports
        return _reportsTab();
      default:
        return Container();
    }
  }

  Widget _chatTab() {
    final TextEditingController _controller = TextEditingController();
    ValueNotifier<bool> isWriting = ValueNotifier(false);

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: EdgeInsets.only(top: context.h(0.8)),
          padding: EdgeInsets.all(context.w(2.4)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.h(1.9)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.smart_toy_outlined,
                    color: Color(0xFFF7B67A),
                    size: context.w(6.3),
                  ),
                  SizedBox(width: context.w(1.7)),
                  Text(
                    "Chat with AI-Mohammed",
                    style: TextStyle(
                      color: Color(0xFF39566C),
                      fontWeight: FontWeight.w500,
                      fontSize: context.w(5),
                    ),
                  ),
                ],
              ),
              Divider(height: context.h(2.1)),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(
                        Icons.smart_toy_outlined,
                        size: context.w(15.5),
                        color: Color(0xFFF7B67A),
                      ),
                      SizedBox(height: context.h(0.8)),
                      Text(
                        "Start a conversation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(5),
                          color: Color(0xFF39566C),
                        ),
                      ),
                      SizedBox(height: context.h(0.2)),
                      Text(
                        "Ask me anything about your studies!",
                        style: TextStyle(color: Colors.blueGrey , fontSize: context.w(3.4)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: context.h(0.7)),
                padding: EdgeInsets.symmetric(vertical: context.h(0.7), horizontal: context.w(0.4)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.blueGrey[400]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(context.h(0.8)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8F8F8),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: context.w(3.6),
                            vertical: context.h(1.3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: context.w(2.4)),
                    Container(
                      decoration: BoxDecoration(
                        color: _controller.text.isEmpty
                            ? const Color(0xFFF7B67A)
                            : const Color(0xFFFF7818),
                        borderRadius: BorderRadius.circular(context.h(1)),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: context.w(3.6),
                        ),
                        onPressed: _controller.text.isEmpty ? null : () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _adviceTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Latest Advice
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(top: context.h(0.8)),
            padding: EdgeInsets.all(context.w(4.3)),
            decoration: BoxDecoration(
              color: const Color(0xFFF9EDD8),
              borderRadius: BorderRadius.circular(context.h(1)),
              border: Border.all(color: const Color(0xFFF7E3C4), width: context.w(0.17)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:[
                    Icon(Icons.recommend_outlined, color: Color(0xFFF7B67A), size: context.w(5.3)),
                    SizedBox(width: context.w(1.4)),
                    Text(
                      "Latest Personalized Advice",
                      style: TextStyle(
                        color: Color(0xFF39566C),
                        fontWeight: FontWeight.bold,
                        fontSize: context.w(3.8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(0.4)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: context.h(0.4)),
                  padding: EdgeInsets.all(context.w(2.6)),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.85),
                    borderRadius: BorderRadius.circular(context.h(0.8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommendation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(3.1),
                          color: Color(0xFF39566C),
                        ),
                      ),
                      SizedBox(height: context.h(0.2)),
                      Text(
                        latestAdvice,
                        style: TextStyle(fontSize: context.w(3.2)),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: context.h(0.2)),
                      Text(
                        adviceDate,
                        style: TextStyle(
                          fontSize: context.w(3.6),
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Advice History
          Text(
            "Advice History",
            style: TextStyle(
              color: Color(0xFF39566C),
              fontWeight: FontWeight.bold,
              fontSize: context.w(3.6),
            ),
          ),
          SizedBox(height: context.h(0.4)),
          Column(
            children: adviceHistory.map((item) {
              return Container(
                width: MediaQuery.sizeOf(context).width,
                margin: EdgeInsets.only(bottom: context.h(0.7)),
                padding: EdgeInsets.all(context.w(2.4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(0.8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.w(2.9),
                        color: Color(0xFF39566C),
                      ),
                    ),
                    SizedBox(height: context.h(0.2)),
                    Text(
                      item['content'] ?? "",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: context.w(3)),
                    ),
                    SizedBox(height: context.h(0.2)),
                    Text(
                      item['date'] ?? "",
                      style: TextStyle(
                        fontSize: context.w(2.4),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _reportsTab() {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        margin:  EdgeInsets.only(top: context.h(1)),
        padding: EdgeInsets.symmetric(vertical: context.h(5)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.h(1.8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(
              Icons.insert_drive_file_outlined,
              size: context.w(13.3),
              color: Colors.blueGrey,
            ),
            SizedBox(height: context.h(1.6)),
            Text(
              "No AI reports generated yet",
              style: TextStyle(color: Colors.blueGrey, fontSize: context.w(5)),
            ),
          ],
        ),
      ),
    );
  }
}
