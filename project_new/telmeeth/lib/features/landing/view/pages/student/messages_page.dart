import 'package:flutter/material.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

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
      appBar: const StudentAppBar(),
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF7F8F9),
      bottomNavigationBar: NavigationBarPrimary(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Messages",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2530),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Stay connected and inspired.",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF7B8A98),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
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
                    ? _mobileLayout(context)
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
            width: 345 ,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 35,
                        top: 6,
                        bottom: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.07),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3A45),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 7,
                      top: 6,
                      child: SizedBox(
                        height: 23,
                        width: 23,
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
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.09),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextField(
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: "Search messages...",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                      prefixIcon: const Icon(Icons.search, size: 16),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 5,
                    right: 5,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFEAEAEA),
                    height: 2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F8FB),
                    borderRadius: BorderRadius.circular(8),
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
                const SizedBox(height: 10),
                Expanded(
                  child: sideTabIndex == 0
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send_rounded,
                          color: Colors.grey[300],
                          size: 39,
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            "Select a conversation to start messaging",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                      : sideTabIndex == 1
                      ? Center(
                    child: Text(
                      "No messages found",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                      : Center(
                    child: Text(
                      "No sent messages yet",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        // Main Area
        Expanded(
          child: Builder(
            builder: (_) {
              if (mainTabIndex == 0) {
                if (sideTabIndex == 2) {
                  return const SizedBox.shrink();
                }
              } else if (mainTabIndex == 1) {
                final msg = parentsMessages.first;
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 350,
                    height: 90,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 13,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFFE9F1),
                        width: 1,
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
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE9F1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Color(0xFFE02F78),
                            size: 14,
                          ),
                        ),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg["sender"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                msg["date"]!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[400],
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                msg["content"]!,
                                style: const TextStyle(fontSize: 12),
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
                        size: 26,
                      ),
                      const SizedBox(height: 9),
                      Text(
                        "No messages from teachers yet.",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return _desktopLayout(context);
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
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: selected ? Colors.white : color, size: 15),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
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
            borderRadius: BorderRadius.circular(8),
            boxShadow: selected
                ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 2,
              ),
            ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 14,
                color: selected ? Color(0xFF172135) : Colors.black38,
              ),
              const SizedBox(width: 3),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 350,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, right: 12, left: 12, bottom: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 0),
                  const Text(
                    "Start New Conversation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Recipient Type:",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    items: recipientTypes
                        .map((e) => DropdownMenuItem(
                        value: e,

                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 12),
                        )))
                        .toList(),
                    hint: const Text('Select recipient type',
                        style: TextStyle(
                            color: Color(0xFFAEB9C6),
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                    icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFAEB9C6)),
                    onChanged: (v) => setState(() => selectedType = v),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: const BorderSide(color: Color(0xFFE6E8EA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: const BorderSide(color: Color(0xFFD2D7DB)),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF283046)),
                  ),
                  if (selectedType != null) ...[
                    const SizedBox(height: 13),
                    TextField(
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Search for ${selectedType!.toLowerCase()} name...',
                        hintStyle: const TextStyle(
                            color: Color(0xFFAEB9C6), fontSize: 14),
                        prefixIcon: const Icon(Icons.search, size: 18, color: Color(0xFFAEB9C6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: const BorderSide(color: Color(0xFFE6E8EA)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: const BorderSide(color: Color(0xFFD2D7DB)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8F9),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: const Color(0xFFE6E8EA)),
                      ),
                      child: const Text(
                        "No users found",
                        style: TextStyle(
                            color: Color(0xFFAEB9C6),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
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
                icon: const Icon(Icons.close, size: 20, color: Color(0xFFAEB9C6)),
                splashRadius: 15,
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
