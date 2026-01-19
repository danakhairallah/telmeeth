import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/ai_message_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class AiCounselorPage extends StatefulWidget {
  const AiCounselorPage({super.key});

  @override
  State<AiCounselorPage> createState() => _AiCounselorPageState();
}

class _AiCounselorPageState extends State<AiCounselorPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => context.read<AiMessageController>().fetchTodayMessages(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF8F3EE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(4), vertical: context.h(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Title ----
              Row(
                children: [
                  Icon(Icons.psychology_alt_outlined, color: Colors.orange, size: context.w(7)),
                  SizedBox(width: context.w(2)),
                  Text(
                    "AI Counselor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.w(5.2),
                      color: const Color(0xFF39566C),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.h(1.5)),

              // ---- Description ----
              Text(
                "Ask your AI Counselor anything related to studying, time management, or any academic or social question.",
                style: TextStyle(
                  fontSize: context.w(3.3),
                  color: const Color(0xFF7C8A97),
                ),
              ),
              SizedBox(height: context.h(2)),

              // ---- Request Counseling Button ----
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showCounselorDialog(context);
                  },
                  icon: const Icon(Icons.add_comment, color: Colors.white),
                  label: const Text("Request Counseling", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA962),
                    padding: EdgeInsets.symmetric(vertical: context.h(1.1)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(1))),
                    elevation: 0,
                  ),
                ),
              ),
              SizedBox(height: context.h(2)),

              // ---- Messages List ----
              Expanded(
                child: Consumer<AiMessageController>(
                  builder: (context, ai, _) {
                    if (ai.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (ai.todayMessages.isEmpty) {
                      return Center(child: Text('Start a conversation with your AI counselor.'));
                    }
                    return ListView.builder(
                      itemCount: ai.todayMessages.length,
                      itemBuilder: (context, idx) {
                        final msg = ai.todayMessages[idx];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: _chatBubble(msg.content, true),
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
            ],
          ),
        ),
      ),
    );
  }

  // ==== Chat Bubble Widget ====
  Widget _chatBubble(String text, bool isUser) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.h(0.6),
        left: isUser ? context.w(8) : 0,
        right: isUser ? 0 : context.w(8),
      ),
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xFFFFF5EC) : const Color(0xFFF6F8FB),
        borderRadius: BorderRadius.circular(context.h(1)),
      ),
      child: Text(
        text,
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: context.w(3.2)),
      ),
    );
  }

  // ==== Dialog for New Counseling Request ====
  void _showCounselorDialog(BuildContext context) {
    final questionCtrl = TextEditingController();
    bool loading = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(1.2))),
              child: Padding(
                padding: EdgeInsets.all(context.w(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.psychology_alt_outlined, color: Colors.orange),
                        SizedBox(width: context.w(1.3)),
                        Text(
                          "New Counseling Request",
                          style: TextStyle(fontSize: context.w(4), fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: loading ? null : () => Navigator.pop(context),
                          child: Icon(Icons.close, size: context.w(5.2)),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(1.1)),
                    TextField(
                      controller: questionCtrl,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Type your question or concern...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(context.h(0.8)),
                        ),
                      ),
                      enabled: !loading,
                    ),
                    SizedBox(height: context.h(1.4)),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loading
                            ? null
                            : () async {
                          final question = questionCtrl.text.trim();
                          if (question.isNotEmpty) {
                            setState(() => loading = true);
                            await context.read<AiMessageController>().sendMessage(question);
                            await context.read<AiMessageController>().fetchTodayMessages();
                            setState(() => loading = false);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: EdgeInsets.symmetric(vertical: context.h(1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.h(0.8)),
                          ),
                          elevation: 0,
                        ),
                        child: loading
                            ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text(
                          "Send Counseling Request",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: context.w(3.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
