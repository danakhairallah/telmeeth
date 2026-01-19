import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/chatbot_controller_teacher.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class ChatBotTeacher extends StatefulWidget {
  const ChatBotTeacher({super.key});

  @override
  State<ChatBotTeacher> createState() => _ChatBotTeacherState();
}

class _ChatBotTeacherState extends State<ChatBotTeacher> {
  final _textCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TeacherChatbotController>(context, listen: false).fetchToday());
  }

  @override
  Widget build(BuildContext context) {
    final mainColor = Colors.black;
    return Consumer<TeacherChatbotController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("AI Assistant"),
            backgroundColor: Colors.white,
            elevation: 0.7,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
          ),
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
                    "Ask questions about your class or lessons",
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
                                : controller.todayChats.isEmpty
                                ? Center(child: Text("No chat history yet. Start a conversation!"))
                                : ListView.builder(
                              reverse: true,
                              itemCount: controller.todayChats.length,
                              itemBuilder: (ctx, i) {
                                final msg = controller.todayChats[controller.todayChats.length - 1 - i];
                                print("==== MESSAGE ====");
                                print("msg.message: ${msg.message}");
                                print("msg.reply: ${msg.reply}");
                                print("msg.response: ${msg.response}");
                                print("===============");

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    // رسالة المعلم
                                    if (msg.message != null && msg.message!.isNotEmpty)
                                      Container(
                                        margin: EdgeInsets.only(bottom: 7),
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey[50],
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(msg.message ?? ""),
                                        ),
                                      ),
                                    // رد الذكاء الصناعي (reply أو response)
                                    if ((msg.reply != null && msg.reply.isNotEmpty) || (msg.response != null && msg.response!.isNotEmpty))
                                      Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.orange[50],
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            msg.reply.isNotEmpty
                                                ? msg.reply
                                                : (msg.response ?? ""),
                                          ),
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
                                      await Provider.of<TeacherChatbotController>(context, listen: false)
                                          .send(text);
                                      _textCtrl.clear();
                                      // إعادة تحميل الشات بعد الإرسال مباشرة (أو أضف الرسالة يدويًا حسب منطقك)
                                      await Provider.of<TeacherChatbotController>(context, listen: false)
                                          .fetchToday();
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
