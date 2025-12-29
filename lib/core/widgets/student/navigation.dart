import 'package:flutter/material.dart';
import '../../../features/landing/view/pages/student/home1_page.dart';
import '../../../features/landing/view/pages/student/materials_page.dart';
import '../../../features/landing/view/pages/student/profile_page.dart';
import '../../../features/landing/view/pages/student/tasks_page.dart';
import '../../constants/responsive.dart';

class NavigationBarPrimary extends StatelessWidget {
  const NavigationBarPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveValues.padding(context, 8)),
      width: MediaQuery
          .sizeOf(context)
          .width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ResponsiveValues.radius(context, 20),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 182, 191, 202),
          width: ResponsiveValues.radius(context, 2),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(91, 141, 238, 0.12),
            blurRadius: ResponsiveValues.shadowBlur(context, 12),
            offset: Offset(0, ResponsiveValues.shadowOffsetY(context, 4)),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text(
              'Home🏠',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Materials()),
              );
            },
            child: Text(
              'Materials📚',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tasks()),
              );
            },
            child: Text(
              'Tasks📝',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Text(
              'Profile👤',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}