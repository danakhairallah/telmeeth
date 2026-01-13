/*import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
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
      padding: EdgeInsets.all(context.w(3)),
      width: MediaQuery.sizeOf(context).width,
      height: context.h(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          context.h(2),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 177, 192, 210),
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
              '🏠',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(5)),
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
              '📚',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(5)),
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
              '📝',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(5)),
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
              '👤',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(5)),
            ),
          ),
        ],
      ),
    );
  }
}
*/