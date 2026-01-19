import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/api/parent/controllers/ai_chat_parent_controller.dart';
import 'package:telmeeth/core/widgets/teacher/teacher_features_app_bar.dart';

class AiAssistantParent extends StatefulWidget {
  const AiAssistantParent({super.key});

  @override
  State<AiAssistantParent> createState() => _AiAssistantParentState();
}

class _AiAssistantParentState extends State<AiAssistantParent> {
  final _textCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AiChatParentController>(context, listen: false).loadHistory());
  }

  @override
  Widget build(BuildContext context) {
    final mainColor = Colors.black;
    return Consumer<AiChatParentController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: TeacherFeaturesAppBar(),
          backgroundColor: const Color(0xFFF8FAFB),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(5),
                vertical: context.h(2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===== PAGE TITLE =====
                  Text(
                    "AI Assistant",
                    style: TextStyle(
                      fontSize: context.font(22),
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(height: context.h(0.8)),
                  Text(
                    "Ask questions about your children's education",
                    style: TextStyle(
                      fontSize: context.font(14),
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: context.h(2)),
                  /// ===== MAIN CARD =====
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(5),
                        vertical: context.h(2.5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(context.radius(18)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// HEADER
                          Row(
                            children: [
                              Icon(Icons.chat_bubble_outline,
                                  color: mainColor, size: context.icon(22)),
                              SizedBox(width: context.w(3)),
                              Text(
                                "Chat with AI Assistant",
                                style: TextStyle(
                                  fontSize: context.font(16),
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: context.h(4)),
                          /// CHAT HISTORY
                          Expanded(
                            child: controller.isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : controller.history.isEmpty
                                ? Center(child: Text("No chat history yet. Start a conversation!"))
                                : ListView.builder(
                              reverse: true,
                              itemCount: controller.history.length,
                              itemBuilder: (ctx, i) {
                                final msg = controller.history[controller.history.length - 1 - i];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey[50],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(msg.message),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.orange[50],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(msg.response),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          /// INPUT
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.w(4),
                              vertical: context.h(1.2),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                              BorderRadius.circular(context.radius(14)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _textCtrl,
                                    style: TextStyle(
                                      fontSize: context.font(14),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Type your message here...",
                                      hintStyle: TextStyle(
                                        fontSize: context.font(13),
                                        color: Colors.grey[400],
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(width: context.w(3)),
                                Container(
                                  height: context.h(5.5),
                                  width: context.h(5.5),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(context.radius(12)),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.send, color: Colors.white, size: context.icon(18)),
                                    onPressed: () async {
                                      final text = _textCtrl.text.trim();
                                      if (text.isEmpty) return;
                                      await Provider.of<AiChatParentController>(context, listen: false)
                                          .sendMessage(text);
                                      _textCtrl.clear();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
