import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Attachments extends StatefulWidget {
  const Attachments({super.key});

  @override
  State<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  String? selectedSubject;
  String? selectedUnit;
  String? selectedLesson;

  final List<String> subjects = ['Math', 'Science', 'English'];
  final Map<String, List<String>> units = {
    'Math': ['Unit 1', 'Unit 2'],
    'Science': ['Unit A', 'Unit B'],
    'English': ['Unit X'],
  };
  final Map<String, List<String>> lessons = {
    'Unit 1': ['Lesson 1', 'Lesson 2'],
    'Unit 2': ['Lesson 3'],
    'Unit A': ['Lesson A1'],
    'Unit B': ['Lesson B1', 'Lesson B2'],
    'Unit X': ['Lesson X1'],
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF6F2EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.4) : context.w(7.2), vertical: isMobile ? context.h(1) : context.h(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(3.4) : context.w(5.3), vertical: isMobile ? context.h(1.4) : context.h(1.9)),
                margin: EdgeInsets.only(bottom: context.h(1.3)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.09),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.w(1.2)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6E0),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.menu_book, color: Color(0xFFFFA962), size: context.w(5.3)),
                    ),
                    SizedBox(width: context.w(2.9)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Learning Resources",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? context.w(3.8) : context.w(5),
                            color: const Color(0xFF264566),
                          ),
                        ),
                        SizedBox(height: context.h(2)),
                        Text(
                          "Access lesson materials and educational resources",
                          style: TextStyle(
                            fontSize: isMobile ? context.w(2.4) : context.w(2.9),
                            color: Colors.blueGrey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(0.9) : context.h(1.4), horizontal: isMobile ? context.w(1.9) : context.w(4.1)),
                margin: EdgeInsets.only(bottom: context.h(1.2)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.filter_alt, size: context.w(4.1), color: Color(0xFF64748B)),
                    SizedBox(width: context.w(1.7)),
                    Text("Filters", style: TextStyle(fontSize: isMobile ? context.w(2.6) : context.w(3.1), fontWeight: FontWeight.bold, color: const Color(0xFF264566))),
                    SizedBox(width: context.w(3.1)),
                    // Add more filters if needed...
                    Text("Show All", style: TextStyle(fontSize: isMobile ? context.w(2.4) : context.w(2.9), color: const Color(0xFF64748B))),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(0.8) : context.h(1.4), horizontal: isMobile ? context.w(1.9) : context.w(3.8)),
                margin: EdgeInsets.only(bottom: context.h(1.7)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? context.h(0.8) : context.h(1.4),
                    horizontal: isMobile ? context.w(1.9) : context.w(3.8),
                  ),
                  margin: EdgeInsets.only(bottom: context.h(1.7)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.h(1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.06),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDropdown(
                        label: "Subject",
                        value: selectedSubject,
                        items: subjects,
                        onChanged: (val) {
                          setState(() {
                            selectedSubject = val;
                            selectedUnit = null;
                            selectedLesson = null;
                          });
                        },
                        isMobile: isMobile,
                      ),
                      SizedBox(height: context.h(1)),

                      _buildDropdown(
                        label: "Unit",
                        value: selectedUnit,
                        items: selectedSubject != null
                            ? units[selectedSubject!] ?? []
                            : [],
                        onChanged: (val) {
                          setState(() {
                            selectedUnit = val;
                            selectedLesson = null;
                          });
                        },
                        isMobile: isMobile,
                        hint: selectedSubject == null ? 'Select Subject First' : null,
                      ),
                      SizedBox(height: context.h(1)),

                      _buildDropdown(
                        label: "Lesson",
                        value: selectedLesson,
                        items: selectedUnit != null
                            ? lessons[selectedUnit!] ?? []
                            : [],
                        onChanged: (val) {
                          setState(() {
                            selectedLesson = val;
                          });
                        },
                        isMobile: isMobile,
                        hint: selectedUnit == null ? 'Select Unit First' : null,
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.sizeOf(context).width,
                constraints: BoxConstraints(minHeight: context.h(22.9)),
                padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(3.9) : context.h(6)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: context.w(0.2), style: BorderStyle.solid),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.blueGrey[200], size: isMobile ? context.w(9) : context.w(10.9)),
                    SizedBox(height: context.h(1)),
                    Text(
                      selectedSubject == null
                          ? 'Select a Subject'
                          : (selectedUnit == null
                          ? 'Select a Unit'
                          : (selectedLesson == null
                          ? 'Select a Lesson'
                          : 'Resources for $selectedLesson')),
                      style: TextStyle(
                        fontSize: isMobile ? context.w(3.6) : context.w(4.3),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF334155),
                      ),
                    ),
                    SizedBox(height: context.h(0.7)),
                    Text(
                      selectedSubject == null
                          ? 'Please select a subject from the filters to view available resources.'
                          : (selectedUnit == null
                          ? 'Please select a unit to view available lessons.'
                          : (selectedLesson == null
                          ? 'Please select a lesson to view resources.'
                          : 'Showing materials and attachments for $selectedLesson')),
                      style: TextStyle(
                        fontSize: isMobile ? context.w(2.5) : context.w(3.1),
                        color: const Color(0xFF6C7A87),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Small helper for dropdowns
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    required bool isMobile,
    String? hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: isMobile ? context.w(2.4) : context.w(2.9), fontWeight: FontWeight.w600, color: const Color(0xFF64748B)),
        ),
        SizedBox(height: context.h(0.3)),
        DropdownButtonFormField<String>(
          initialValue: value,
          items: items
              .map((d) => DropdownMenuItem(
            value: d,
            child: Text(d, style: TextStyle(fontSize: isMobile ? context.w(2.6) : context.w(3.1))),
          ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint ?? 'Select $label',
            hintStyle: TextStyle(fontSize: isMobile ? context.w(2.5) : context.w(2.9), color: const Color(0xFFB8C2CA)),
            contentPadding: EdgeInsets.symmetric(horizontal: context.w(2.4), vertical: context.h(0.7)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(context.h(0.8))),
            isDense: true,
          ),
        ),
      ],
    );
  }
}