/*import 'package:flutter/material.dart';

class StudentBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const StudentBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFFF7818),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_customize_outlined),
          label: 'Control Panel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: 'Materials',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt_outlined),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}*/
