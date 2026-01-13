import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  int mainTabIndex = 0;
  int sideTabIndex = 0;
  bool showNewConversationDialog = false;

  List<Map<String, String>> parentsMessages = [
    {
      "sender": "Parent",
      "date": "12/30/2025",
      "content": "You always make us proud! 🌟",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 750;

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF7F8F9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(1.4), vertical: context.h(0.8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Messages",
                style: TextStyle(
                  fontSize: context.w(5.5),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2530),
                ),
              ),
              SizedBox(height: context.h(0.5)),
              Text(
                "Stay connected and inspired.",
                style: TextStyle(
                  fontSize: context.w(3.1),
                  color: Color(0xFF7B8A98),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.h(1.5)),
              Container(
                margin: EdgeInsets.only(bottom: context.h(1.5)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _tabButton(
                      icon: Icons.chat_bubble_outline,
                      text: "Chats",
                      selected: mainTabIndex == 0,
                      color: const Color(0xFF172135),
                      onTap: () => setState(() => mainTabIndex = 0),
                    ),
                    _tabButton(
                      icon: Icons.favorite_border,
                      text: "From Parents",
                      selected: mainTabIndex == 1,
                      color: const Color(0xFFE02F78),
                      onTap: () => setState(() => mainTabIndex = 1),
                    ),
                    _tabButton(
                      icon: Icons.school_outlined,
                      text: "From Teachers",
                      selected: mainTabIndex == 2,
                      color: const Color(0xFF296CF3),
                      onTap: () => setState(() => mainTabIndex = 2),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isMobile
                    ? _desktopLayout(context)
                    : _desktopLayout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mainTabIndex == 0)
          Container(
            width: context.w(84),
            padding: EdgeInsets.symmetric(vertical: context.h(0.6)),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.only(
                        left: context.w(1.9),
                        right: context.w(3.8),
                        top: context.h(0.6),
                        bottom: context.h(0.6),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(context.h(1)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.07),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: context.w(3.6),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3A45),
                        ),
                      ),
                    ),
                    Positioned(
                      right: context.w(1.7),
                      top: context.h(0.6),
                      child: SizedBox(
                        height: context.h(2.5),
                        width: context.w(5.5),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showNewConversationDialog = true;
                            });
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => _newConversationDialog(context),
                            ).then((_) {
                              setState(() {
                                showNewConversationDialog = false;
                              });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF172135),
                            elevation: 0,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: context.w(4.6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(0.7)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.h(0.8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.09),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: TextField(
                    style: TextStyle(fontSize: context.w(2.9)),
                    decoration: InputDecoration(
                      hintText: "Search messages...",
                      hintStyle: TextStyle(
                        fontSize: context.w(2.9),
                        color: Colors.grey[400],
                      ),
                      prefixIcon: Icon(Icons.search, size: context.w(3.8)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(context.h(0.7)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.h(1)),
                  child: Divider(
                    thickness: context.h(0.14),
                    color: Color(0xFFEAEAEA),
                    height: 0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: context.h(0.4)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F8FB),
                    borderRadius: BorderRadius.circular(context.h(0.8)),
                  ),
                  child: Row(
                    children: [
                      _sideTab(
                        icon: Icons.forum_outlined,
                        text: "Conversations",
                        selected: sideTabIndex == 0,
                        onTap: () => setState(() => sideTabIndex = 0),
                      ),
                      _sideTab(
                        icon: Icons.send,
                        text: "Sent",
                        selected: sideTabIndex == 1,
                        onTap: () => setState(() => sideTabIndex = 1),
                      ),
                      _sideTab(
                        icon: Icons.mail_outline,
                        text: "Inbox",
                        selected: sideTabIndex == 2,
                        onTap: () => setState(() => sideTabIndex = 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(1.2)),
                Expanded(
                  child: Builder(
                    builder: (_) {
                      if (sideTabIndex == 0) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.send_rounded,
                                color: Colors.grey[300],
                                size: context.w(9.4),
                              ),
                              SizedBox(height: context.h(0.8)),
                              Flexible(
                                child: Text(
                                  "Select a conversation to start messaging",
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: context.w(3.1),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (sideTabIndex == 1) {
                        return Center(
                          child: Text(
                            "No sent messages yet.",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: context.w(3.1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      } else if (sideTabIndex == 2) {
                        return Center(
                          child: Text(
                            "No messages found.",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: context.w(3.1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: Builder(
            builder: (_) {
              if (mainTabIndex == 0 && sideTabIndex == 2) {
                return const SizedBox.shrink();
              } else if (mainTabIndex == 1) {
                final msg = parentsMessages.first;
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: context.w(85.1),
                    height: context.h(10),
                    padding: EdgeInsets.symmetric(
                      vertical: context.h(1.6),
                      horizontal: context.w(3.1),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(context.h(1.3)),
                      border: Border.all(
                        color: const Color(0xFFFFE9F1),
                        width: context.w(0.18),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.05),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(context.w(1.2)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE9F1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFFE02F78),
                            size: context.w(3.4),
                          ),
                        ),
                        SizedBox(width: context.w(2.1)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg["sender"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.w(3.4),
                                ),
                              ),
                              Text(
                                msg["date"]!,
                                style: TextStyle(
                                  fontSize: context.w(2.4),
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(height: context.h(0.5)),
                              Text(
                                msg["content"]!,
                                style: TextStyle(fontSize: context.w(2.9)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (mainTabIndex == 2) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Colors.grey[350],
                        size: context.w(6.3),
                      ),
                      SizedBox(height: context.h(1.1)),
                      Text(
                        "No messages from teachers yet.",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: context.w(3.1),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  Widget _tabButton({
    required IconData icon,
    required String text,
    required bool selected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(context.h(1)),
        onTap: onTap,
        child: Container(
          height: context.h(3.7),
          decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            borderRadius: BorderRadius.circular(context.h(1)),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: selected ? Colors.white : color, size: context.w(3.6)),
                SizedBox(width: context.w(0.9)),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.w(2.9),
                    color: selected ? Colors.white : color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sideTab({
    required IconData icon,
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(context.h(0.8)),
            boxShadow: selected
                ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 2,
              ),
            ]
                : [],
          ),
          padding: EdgeInsets.symmetric(vertical: context.h(0.7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: context.w(3.4),
                color: selected ? Color(0xFF172135) : Colors.black38,
              ),
              SizedBox(width: context.w(0.7)),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: context.w(2.9),
                  color: selected ? Color(0xFF172135) : Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _newConversationDialog(BuildContext context) {
  String? selectedType;
  final List<String> recipientTypes = [
    'Student', 'Teacher', 'Admin', 'ParentModel'
  ];
  return StatefulBuilder(
    builder: (context, setState) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(1.4))),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: context.w(85.1),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.h(1.9), right: context.w(2.9), left: context.w(2.9), bottom: context.h(1.9)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),
                  Text(
                    "Start New Conversation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(4.6)),
                  ),
                  SizedBox(height: context.h(1.6)),
                  Text(
                    "Recipient Type:",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: context.w(3.4)),
                  ),
                  SizedBox(height: context.h(0.8)),
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    items: recipientTypes
                        .map((e) => DropdownMenuItem(
                        value: e,

                        child: Text(
                          e,
                          style: TextStyle(fontSize: context.w(2.9)),
                        )))
                        .toList(),
                    hint: Text('Select recipient type',
                        style: TextStyle(
                            color: Color(0xFFAEB9C6),
                            fontWeight: FontWeight.w400,
                            fontSize: context.w(3.4))),
                    icon: Icon(Icons.arrow_drop_down, color: Color(0xFFAEB9C6)),
                    onChanged: (v) => setState(() => selectedType = v),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: context.w(2.6), vertical: context.h(0.8)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(context.h(0.9)),
                        borderSide: const BorderSide(color: Color(0xFFE6E8EA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(context.h(0.9)),
                        borderSide: const BorderSide(color: Color(0xFFD2D7DB)),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    style: TextStyle(fontSize: context.w(3.4), color: Color(0xFF283046)),
                  ),
                  if (selectedType != null) ...[
                    SizedBox(height: context.h(1.4)),
                    TextField(
                      style: TextStyle(fontSize: context.w(3.4)),
                      decoration: InputDecoration(
                        hintText: 'Search for ${selectedType!.toLowerCase()} name...',
                        hintStyle: TextStyle(
                            color: Color(0xFFAEB9C6), fontSize: context.w(3.4)),
                        prefixIcon: Icon(Icons.search, size: context.w(4.3), color: Color(0xFFAEB9C6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(context.h(0.9)),
                          borderSide: const BorderSide(color: Color(0xFFE6E8EA)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(context.h(0.9)),
                          borderSide: const BorderSide(color: Color(0xFFD2D7DB)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: context.w(2.9), vertical: context.h(0.8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: context.h(1.3)),
                    Container(
                      width: double.infinity,
                      height: context.h(8.7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8F9),
                        borderRadius: BorderRadius.circular(context.h(0.7)),
                        border: Border.all(color: const Color(0xFFE6E8EA)),
                      ),
                      child: Text(
                        "No users found",
                        style: TextStyle(
                            color: Color(0xFFAEB9C6),
                            fontWeight: FontWeight.w500,
                            fontSize: context.w(3.4)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, size: context.w(5), color: Color(0xFFAEB9C6)),
                splashRadius: context.w(3.6),
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
