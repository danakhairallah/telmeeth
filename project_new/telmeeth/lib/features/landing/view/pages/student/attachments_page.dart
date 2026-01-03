import 'package:flutter/material.dart';
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
      appBar: const StudentAppBar(),
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF6F2EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 30, vertical: isMobile ? 10 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 22, vertical: isMobile ? 13 : 18),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
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
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6E0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.menu_book, color: Color(0xFFFFA962), size: 22),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Learning Resources",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 16 : 20,
                            color: const Color(0xFF264566),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Access lesson materials and educational resources",
                          style: TextStyle(
                            fontSize: isMobile ? 10 : 12,
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
                padding: EdgeInsets.symmetric(vertical: isMobile ? 9 : 13, horizontal: isMobile ? 8 : 17),
                margin: const EdgeInsets.only(bottom: 11),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    const Icon(Icons.filter_alt, size: 17, color: Color(0xFF64748B)),
                    const SizedBox(width: 7),
                    Text("Filters", style: TextStyle(fontSize: isMobile ? 11 : 13, fontWeight: FontWeight.bold, color: const Color(0xFF264566))),
                    const SizedBox(width: 13),
                    // Add more filters if needed...
                    Text("Show All", style: TextStyle(fontSize: isMobile ? 10 : 12, color: const Color(0xFF64748B))),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 13, horizontal: isMobile ? 8 : 16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    vertical: isMobile ? 8 : 13,
                    horizontal: isMobile ? 8 : 16,
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                      const SizedBox(height: 10),

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
                      const SizedBox(height: 10),

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
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 210),
                padding: EdgeInsets.symmetric(vertical: isMobile ? 36 : 55),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1, style: BorderStyle.solid),
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
                    Icon(Icons.search, color: Colors.blueGrey[200], size: isMobile ? 37 : 45),
                    const SizedBox(height: 10),
                    Text(
                      selectedSubject == null
                          ? 'Select a Subject'
                          : (selectedUnit == null
                          ? 'Select a Unit'
                          : (selectedLesson == null
                          ? 'Select a Lesson'
                          : 'Resources for $selectedLesson')),
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      selectedSubject == null
                          ? 'Please select a subject from the filters to view available resources.'
                          : (selectedUnit == null
                          ? 'Please select a unit to view available lessons.'
                          : (selectedLesson == null
                          ? 'Please select a lesson to view resources.'
                          : 'Showing materials and attachments for $selectedLesson')),
                      style: TextStyle(
                        fontSize: isMobile ? 10.5 : 13,
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
      bottomNavigationBar: const NavigationBarPrimary(),
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
          style: TextStyle(fontSize: isMobile ? 10 : 12, fontWeight: FontWeight.w600, color: const Color(0xFF64748B)),
        ),
        const SizedBox(height: 3),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((d) => DropdownMenuItem(
            value: d,
            child: Text(d, style: TextStyle(fontSize: isMobile ? 11 : 13)),
          ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint ?? 'Select $label',
            hintStyle: TextStyle(fontSize: isMobile ? 10.5 : 12, color: const Color(0xFFB8C2CA)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
