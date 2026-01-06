import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
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
        padding: EdgeInsets.all(context.w(4)),
        child: NavigationBarPrimary(),
      )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(1.9), vertical: context.h(1)),
          child: Column(
            children: [
              // Header Box (مع زر الريكويست يمين)
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.w(3.1), vertical: context.h(0.7)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
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
                    Text("📊", style: TextStyle(fontSize: context.w(6))),
                    SizedBox(width: context.w(2.1)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reports",
                            style: TextStyle(
                              fontSize: context.w(4.3),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39566C),
                            ),
                          ),
                          SizedBox(height: context.h(0.2)),
                          Text(
                            "View your academic performance and teacher feedback",
                            style: TextStyle(
                              fontSize: context.w(2.4),
                              color: Color(0xFF7C8A97),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.h(3),
                      child: ElevatedButton.icon(
                        onPressed: () {  _showRequestReportDialog(context);
                        },
                        icon: Icon(Icons.add, color: Colors.white, size: context.w(3.4)),
                        label: Text(
                          "Request",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.w(2.9),
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: EdgeInsets.symmetric(horizontal: context.w(2.4), vertical: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.h(0.7)),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(1)),
              // Tabs Box
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(0.9)),
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
                      context,
                      label: "Teacher (0)",
                      icon: Icons.insert_drive_file_outlined,
                      index: 0,
                    ),
                    _tabButton(
                      context,
                      label: "AI (0)",
                      icon: Icons.auto_awesome_outlined,
                      index: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(0.7)),
              // Content Box
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.h(1)),
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
                      padding: EdgeInsets.symmetric(vertical: context.h(2.4)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedTab == 0 ? "📄" : "✨",
                            style: const TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: context.h(0.7)),
                          Text(
                            "No reports found",
                            style: TextStyle(
                              fontSize: context.w(3.4),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39566C),
                            ),
                          ),
                          SizedBox(height: context.h(0.4)),
                          Text(
                            selectedTab == 0
                                ? "You haven't received any reports from your teachers yet."
                                : "No AI performance analysis is available at the moment.",
                            style: TextStyle(
                              fontSize: context.w(2.4),
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

  Widget _tabButton(BuildContext context,{required String label, required IconData icon, required int index}) {
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
              left: Radius.circular(index == 0 ? context.w(2.1) : 0),
              right: Radius.circular(index == context.w(0.2) ? context.w(2.1) : 0),
            ),
            border: Border(
              bottom: BorderSide(
                color: selected ? const Color(0xFFFFA962) : Colors.transparent,
                width: context.w(0.4),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? const Color(0xFFFFA962) : Colors.blueGrey[400],
                size: context.w(3.8),
              ),
              SizedBox(width: context.w(0.9)),
              Text(
                label,
                style: TextStyle(
                  color: selected ? const Color(0xFFFFA962) : Colors.blueGrey[700],
                  fontWeight: selected ? FontWeight.bold : FontWeight.w600,
                  fontSize: context.w(2.6),
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
                borderRadius: BorderRadius.circular(context.h(1.4)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.w(4.3), vertical: context.h(1.6)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Request New Report",
                          style: TextStyle(
                            fontSize: context.w(3.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, size: context.w(4.6)),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(1.4)),

                    // Subject / Title
                    Text(
                      "Subject / Title",
                      style: TextStyle(fontSize: context.w(2.6), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: context.h(0.4)),
                    TextField(
                      controller: _titleController,
                      style: TextStyle(fontSize: context.w(3.1)),
                      decoration: InputDecoration(
                        hintText: "e.g., Math Progress",
                        hintStyle: TextStyle(
                          fontSize: context.w(2.9),
                          color: Color(0xFFB0B5BC),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: context.w(2.6), vertical: context.h(0.9)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(context.h(0.7)),
                        ),
                        errorText: titleError ? "Title is required" : null,
                        errorStyle: TextStyle(fontSize: context.w(2.6)),
                      ),
                    ),

                    SizedBox(height: context.h(1)),

                    // Note to Teacher
                    Text(
                      "Note to Teacher",
                      style: TextStyle(fontSize: context.w(2.6), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: context.h(0.4)),
                    TextField(
                      controller: _noteController,
                      style: TextStyle(fontSize: context.w(3.1)),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "What would you like to know?",
                        hintStyle: TextStyle(
                          fontSize: context.w(2.9),
                          color: Color(0xFFB0B5BC),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: context.w(2.6), vertical: context.h(1.2)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(context.h(0.7)),
                        ),
                        errorText: noteError ? "Description is required" : null,
                        errorStyle: TextStyle(fontSize: context.w(2.6)),
                      ),
                    ),

                    SizedBox(height: context.h(1.7)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.w(23.1),
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: context.h(0.8)),
                              side: const BorderSide(color: Color(0xFFE5EAF2)),
                              textStyle: TextStyle(fontSize: context.w(2.9)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(context.h(0.7)),
                              ),
                            ),
                            child: Text("Cancel" , style: TextStyle(fontSize: context.w(3)),),
                          ),
                        ),
                        SizedBox(width: context.w(3.1)),
                        SizedBox(
                          width: context.w(29.1),
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
                              padding: EdgeInsets.symmetric(vertical: context.h(0.8)),
                              textStyle: TextStyle(fontSize: context.w(2.9), fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(context.h(0.7)),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Submit Request",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: context.w(2.9)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(0.3)),
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