import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/api/parent/controllers/ai_chat_parent_controller.dart';
import 'package:telmeeth/core/widgets/parent/parent_app_bar.dart';
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
        Provider.of<AiChatParentController>(context, listen: false)
            .loadHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AiChatParentController>(
      builder: (context, controller, _) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: const FeaturesAppBar(),
          body: Padding(
            padding: EdgeInsets.all(context.w(5)),
            child: Column(
              children: [

                /// 🔥 HEADER
                Container(
                  padding: EdgeInsets.all(context.w(5)),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primaryDark,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(context.radius(25)),
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
                          Icons.smart_toy_outlined,
                          color: Colors.white,
                          size: context.icon(26),
                        ),
                      ),
                      SizedBox(width: context.w(4)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AI Assistant",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: context.font(18),
                              ),
                            ),
                            SizedBox(height: context.h(0.5)),
                            Text(
                              "Ask anything about your child’s education",
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

                /// 🔥 CHAT AREA
                Expanded(
                  child: Container(
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
                      children: [

                        /// CHAT HISTORY
                        Expanded(
                          child: controller.isLoadingHistory
                              ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                              : controller.history.isEmpty
                              ? Center(
                            child: Text(
                              "Start a conversation with AI",
                              style: TextStyle(
                                fontSize: context.font(13),
                                color: Colors.grey,
                              ),
                            ),
                          )
                              : ListView.builder(
                            reverse: true,
                            itemCount:
                            controller.history.length,
                            itemBuilder: (ctx, i) {
                              final msg = controller
                                  .history[
                              controller.history.length -
                                  1 -
                                  i];

                              return Column(
                                children: [

                                  /// USER BUBBLE
                                  Align(
                                    alignment:
                                    Alignment.centerRight,
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(
                                          bottom:
                                          context.h(1)),
                                      padding:
                                      EdgeInsets.all(
                                          context.w(3)),
                                      decoration:
                                      BoxDecoration(
                                        color:
                                        AppColors.primary
                                            .withOpacity(
                                            .1),
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            context
                                                .radius(
                                                15)),
                                      ),
                                      child: Text(
                                        msg.message,
                                        style: TextStyle(
                                          fontSize:
                                          context.font(
                                              12),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// AI BUBBLE
                                  Align(
                                    alignment:
                                    Alignment.centerLeft,
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(
                                          bottom:
                                          context.h(
                                              2)),
                                      padding:
                                      EdgeInsets.all(
                                          context.w(3)),
                                      decoration:
                                      BoxDecoration(
                                        color: Colors
                                            .grey[100],
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            context
                                                .radius(
                                                15)),
                                      ),
                                      child: Text(
                                        msg.response,
                                        style: TextStyle(
                                          fontSize:
                                          context.font(
                                              12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        /// INPUT FIELD
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.w(4),
                            vertical: context.h(1),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                            BorderRadius.circular(context.radius(15)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _textCtrl,
                                  style: TextStyle(fontSize: context.font(14)),
                                  decoration: InputDecoration(
                                    hintText: "Type your message...",
                                    border: InputBorder.none,


                                  ),
                                ),
                              ),
                              SizedBox(width: context.w(3)),
                              GestureDetector(
                                onTap: controller.isSending
                                    ? null
                                    : () async {
                                  final text =
                                  _textCtrl.text.trim();
                                  if (text.isEmpty) return;

                                  await context
                                      .read<
                                      AiChatParentController>()
                                      .sendMessage(text);

                                  _textCtrl.clear();
                                },
                                child: Container(
                                  height: context.h(5),
                                  width: context.h(5),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius:
                                    BorderRadius.circular(
                                        context.radius(12)),
                                  ),
                                  child: controller.isSending
                                      ? const Padding(
                                    padding:
                                    EdgeInsets.all(10),
                                    child:
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                      : Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size:
                                    context.icon(18),
                                  ),
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
        );
      },
    );
  }

}