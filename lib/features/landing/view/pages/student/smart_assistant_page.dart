import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/ai_advice_controller.dart';
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
    _selectedTab = widget.initialTab;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AiAdviceController>().getAiAdvices();
      context.read<ChatbotController>().fetchMessages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF8F3EE),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Text(
              "Smart Assistant",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.w(5.4),
                color: const Color(0xFF39566C),
              ),
            ),

            SizedBox(height: context.h(1.5)),

            /// TABS
            Container(
              padding: EdgeInsets.all(context.w(1)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.h(1.4)),
              ),
              child: Row(
                children: [
                  _tabButton("Chat", 0),
                  _tabButton("AI Advice", 1),
                  _tabButton("Reports", 2),
                ],
              ),
            ),

            SizedBox(height: context.h(1.5)),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final selected = _selectedTab == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedTab = index),
        borderRadius: BorderRadius.circular(context.h(1)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: context.h(0.9)),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFFFA962) : Colors.transparent,
            borderRadius: BorderRadius.circular(context.h(1)),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: context.w(3.6),
              ),
            ),
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
    final textController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.6)),
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
                  return Center(
                    child: Text(
                      "Start chatting with your AI assistant",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: context.w(3.5),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: context.h(1)),
                  itemCount: chat.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chat.messages[index];
                    return Column(
                      children: [
                        _chatBubble(msg.message, true),
                        _chatBubble(msg.response, false),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          /// INPUT
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.w(2)),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(context.h(1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.orange),
                  onPressed: () async {
                    if (textController.text.trim().isEmpty) return;
                    await context
                        .read<ChatbotController>()
                        .sendMessage(textController.text.trim());
                    textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatBubble(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.h(0.4)),
        padding: EdgeInsets.all(context.w(3)),
        constraints: BoxConstraints(maxWidth: context.w(75)),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFFFFF5EC) : const Color(0xFFF6F8FB),
          borderRadius: BorderRadius.circular(context.h(1.2)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: context.w(3.4)),
        ),
      ),
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
          return const Center(child: Text("No advice available today."));
        }

        return ListView(
          children: [
            _adviceCard(latest.content, latest.createdAt, highlight: true),
            SizedBox(height: context.h(1)),
            ...ai.adviceModel!.data.skip(1).map(
                  (e) => _adviceCard(e.content, e.createdAt),
            ),
          ],
        );
      },
    );
  }

  Widget _adviceCard(String text, String? date, {bool highlight = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(1)),
      padding: EdgeInsets.all(context.w(3.5)),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFFF9EDD8) : Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: context.w(3.5),
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (date != null) ...[
            SizedBox(height: context.h(0.4)),
            Text(
              date,
              style: TextStyle(
                fontSize: context.w(2.8),
                color: Colors.blueGrey,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ================= REPORTS TAB =================
  Widget _reportsTab() {
    return Center(
      child: Text(
        "No AI reports generated yet",
        style: TextStyle(
          fontSize: context.w(4),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
