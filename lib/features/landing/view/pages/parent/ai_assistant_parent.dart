import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/widgets/parent/parent_app_bar.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class AiAssistantParent extends StatelessWidget {
  const AiAssistantParent({super.key});

  @override
  Widget build(BuildContext context) {
    final Color mainColor =  Colors.black;

    return Scaffold(
      appBar: FeaturesAppBar(),
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
                  fontSize: context.font(22), // ✅ نفس Profile
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
                          Icon(
                            Icons.chat_bubble_outline,
                            color: mainColor,
                            size: context.icon(22),
                          ),
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

                      /// EMPTY STATE
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.android,
                              size: context.icon(64),
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: context.h(1.5)),
                            Text(
                              "No chat history yet. Start a conversation!",
                              style: TextStyle(
                                fontSize: context.font(14),
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
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
                                borderRadius:
                                BorderRadius.circular(context.radius(12)),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: context.icon(18),
                                ),
                                onPressed: () {},
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
  }
}
