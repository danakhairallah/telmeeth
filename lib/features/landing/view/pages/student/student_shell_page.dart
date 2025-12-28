import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/student/student_app_bar.dart';
import 'package:telmeeth/core/widgets/student_bottom_nav_bar.dart';
import 'package:telmeeth/core/widgets/student_drawer.dart';
import 'package:telmeeth/features/landing/view/pages/student/profile_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/student_file_page.dart';

import '../../../../../core/widgets/student/navigation.dart';

class StudentShellPage extends StatefulWidget {
  const StudentShellPage({super.key});

  @override
  State<StudentShellPage> createState() => _StudentShellPageState();
}

class _StudentShellPageState extends State<StudentShellPage> {
  int _currentPage = 0;

  Widget get _body {
    switch (_currentPage) {
      case 1:
        return const StudentFilePage();
      default:
        return const ProfilePage();
    }
  }

  void changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E6),
      appBar: const StudentAppBar(),
      drawer: StudentDrawer(onSelect: changePage),
      body: _body,
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}
