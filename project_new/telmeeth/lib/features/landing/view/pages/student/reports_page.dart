import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student_drawer.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      backgroundColor: const Color(0xFFF8F3EE),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.all(context.h(0.8)),
        child: NavigationBarPrimary(),
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Column(
            children: [
              // Header Box (مع زر الريكويست يمين)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("📊", style: TextStyle(fontSize: 25)),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Reports",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39566C),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "View your academic performance and teacher feedback",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF7C8A97),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      child: ElevatedButton.icon(
                        onPressed: () {  _showRequestReportDialog(context);
                        },
                        icon: const Icon(Icons.add, color: Colors.white, size: 14),
                        label: const Text(
                          "Request",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Tabs Box
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      blurRadius: 7,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _tabButton(
                      label: "Teacher (0)",
                      icon: Icons.insert_drive_file_outlined,
                      index: 0,
                    ),
                    _tabButton(
                      label: "AI (0)",
                      icon: Icons.auto_awesome_outlined,
                      index: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              // Content Box
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedTab == 0 ? "📄" : "✨",
                            style: const TextStyle(fontSize: 25),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            "No reports found",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39566C),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            selectedTab == 0
                                ? "You haven't received any reports from your teachers yet."
                                : "No AI performance analysis is available at the moment.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blueGrey[400],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabButton({required String label, required IconData icon, required int index}) {
    bool selected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFFFF5EC) : Colors.white,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(index == 0 ? 9 : 0),
              right: Radius.circular(index == 1 ? 9 : 0),
            ),
            border: Border(
              bottom: BorderSide(
                color: selected ? const Color(0xFFFFA962) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? const Color(0xFFFFA962) : Colors.blueGrey[400],
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: selected ? const Color(0xFFFFA962) : Colors.blueGrey[700],
                  fontWeight: selected ? FontWeight.bold : FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ],
          ), 
        ),
      ),
    );
  }

  void _showRequestReportDialog(BuildContext context) {
    final _titleController = TextEditingController();
    final _noteController = TextEditingController();

    bool titleError = false;
    bool noteError = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Request New Report",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, size: 19),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),

                    // Subject / Title
                    const Text(
                      "Subject / Title",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: "e.g., Math Progress",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB0B5BC),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: titleError ? "Title is required" : null,
                        errorStyle: const TextStyle(fontSize: 11),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Note to Teacher
                    const Text(
                      "Note to Teacher",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _noteController,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "What would you like to know?",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB0B5BC),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: noteError ? "Description is required" : null,
                        errorStyle: const TextStyle(fontSize: 11),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 95,
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              side: const BorderSide(color: Color(0xFFE5EAF2)),
                              textStyle: const TextStyle(fontSize: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                        const SizedBox(width: 13),
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                titleError = _titleController.text.trim().isEmpty;
                                noteError = _noteController.text.trim().isEmpty;
                              });

                              if (!titleError && !noteError) {
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFA962),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Submit Request",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
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