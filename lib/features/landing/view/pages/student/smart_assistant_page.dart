import 'package:flutter/material.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

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
      drawer: const StudentDrawer(),
      backgroundColor: const Color(0xF8F3EEE7),
      bottomNavigationBar: NavigationBarPrimary(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: const Text(
                "AI Assistant",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF39566C),
                ),
              ),
            ),
            const SizedBox(height: 4),
            // Tabs
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _tabButton("Chat", 0),
                    _tabButton("AI Advice", 1),
                    _tabButton("Reports", 2),
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

  Widget _tabButton(String label, int index) {
    bool selected = _selectedTab == index;
    return InkWell(
      onTap: () => setState(() => _selectedTab = index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.w600,
            color: selected ? Colors.black : Colors.blueGrey[900],
            fontSize: 16.5,
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
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.smart_toy_outlined,
                    color: Color(0xFFF7B67A),
                    size: 26,
                  ),
                  SizedBox(width: 7),
                  Text(
                    "Chat with AI-Mohammed",
                    style: TextStyle(
                      color: Color(0xFF39566C),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Divider(height: 20),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.smart_toy_outlined,
                        size: 64,
                        color: Color(0xFFF7B67A),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Start a conversation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF39566C),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Ask me anything about your studies!",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 7),
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.blueGrey[400]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8F8F8),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: _controller.text.isEmpty
                            ? const Color(0xFFF7B67A)
                            : const Color(0xFFFF7818),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
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
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF9EDD8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFF7E3C4), width: 0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.recommend_outlined, color: Color(0xFFF7B67A), size: 22),
                    SizedBox(width: 6),
                    Text(
                      "Latest Personalized Advice",
                      style: TextStyle(
                        color: Color(0xFF39566C),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommendation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xFF39566C),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        latestAdvice,
                        style: const TextStyle(fontSize: 13.2),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        adviceDate,
                        style: const TextStyle(
                          fontSize: 11,
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
          const Text(
            "Advice History",
            style: TextStyle(
              color: Color(0xFF39566C),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Column(
            children: adviceHistory.map((item) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 7),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0xFF39566C),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['content'] ?? "",
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(fontSize: 12.2),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['date'] ?? "",
                      style: const TextStyle(
                        fontSize: 10,
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
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 46),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.insert_drive_file_outlined,
              size: 55,
              color: Colors.blueGrey,
            ),
            SizedBox(height: 15),
            Text(
              "No AI reports generated yet",
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
