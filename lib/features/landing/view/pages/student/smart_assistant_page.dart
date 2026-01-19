import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/ai_advice_controller.dart';
import 'package:telmeeth/core/api/student/controllers/ai_message_controller.dart';
import 'package:telmeeth/core/api/student/controllers/chatbot_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/student/student_features_app_bar.dart';

class SmartAssistant extends StatefulWidget {
  final int initialTab;
  const SmartAssistant({super.key, this.initialTab = 0});

  @override
  State<SmartAssistant> createState() => _SmartAssistantState();
}

class _SmartAssistantState extends State<SmartAssistant> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab; // يبدأ حسب ما أرسلتله
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AiAdviceController>().getAiAdvices();
      context.read<ChatbotController>().fetchMessages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xF8F3EEE7),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          children: [
            /// TITLE
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "AI Assistant",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.w(5.5),
                  color: const Color(0xFF39566C),
                ),
              ),
            ),

            SizedBox(height: context.h(1)),

            /// TABS
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.h(1)),
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

            SizedBox(height: context.h(1)),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final selected = _selectedTab == index;
    return InkWell(
      onTap: () => setState(() => _selectedTab = index),
      borderRadius: BorderRadius.circular(context.h(0.8)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(6),
          vertical: context.h(0.7),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.w600,
            fontSize: context.w(4),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _chatTab();
      case 1:
        return _adviceTab();
      case 2:
        return _reportsTab();
      default:
        return const SizedBox();
    }
  }

  // ================= CHAT TAB =================
  Widget _chatTab() {
    final controller = TextEditingController();

    return Container(
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.5)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Consumer<ChatbotController>(
              builder: (context, chat, _) {
                if (chat.isLoading && chat.messages.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (chat.messages.isEmpty) {
                  return Center(child: Text("ابدأ المحادثة مع المساعد الذكي"));
                }
                return ListView.builder(
                  padding: EdgeInsets.all(context.w(2)),
                  itemCount: chat.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chat.messages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: _chatBubble(msg.message, true),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _chatBubble(msg.response, false),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "اكتب رسالتك...",
                    filled: true,
                  ),
                ),
              ),
              Consumer<ChatbotController>(
                builder: (context, chat, _) => IconButton(
                  icon: const Icon(Icons.send, color: Colors.orange),
                  onPressed: () async {
                    if (controller.text.trim().isEmpty) return;

                    await context
                        .read<AiMessageController>()
                        .sendMessage(controller.text.trim());

                    controller.clear();
                  },
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chatBubble(String text, bool isUser) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(0.6)),
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xFFFFF5EC) : const Color(0xFFF6F8FB),
        borderRadius: BorderRadius.circular(context.h(1)),
      ),
      child: Text(text, textDirection: TextDirection.rtl),
    );
  }

  // ================= AI ADVICE TAB =================
  Widget _adviceTab() {
    return Consumer<AiAdviceController>(
      builder: (context, ai, _) {
        if (ai.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final latest = ai.latestAdvice;
        if (latest == null) {
          return Center(child: Text("لا يوجد نصائح اليوم."));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(context.w(4)),
              decoration: BoxDecoration(
                color: Color(0xFFF9EDD8),
                borderRadius: BorderRadius.circular(context.h(1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    latest.content,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: context.w(3.2)),
                  ),
                  SizedBox(height: context.h(0.4)),
                  Text(
                    latest.createdAt ?? '',
                    style: TextStyle(fontSize: context.w(2.6), color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.h(1)),
            // History
            ...ai.adviceModel!.data.skip(1).map((e) {
              return Container(
                margin: EdgeInsets.only(bottom: context.h(0.7)),
                padding: EdgeInsets.all(context.w(2.4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(0.8)),
                ),
                child: Text(
                  e.content,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: context.w(3)),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  // ================= REPORTS TAB =================
  Widget _reportsTab() {
    return Center(
      child: Text(
        "No AI reports generated yet",
        style: TextStyle(fontSize: context.w(4), color: Colors.blueGrey),
      ),
    );
  }
}
