import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class TeacherFeaturesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TeacherFeaturesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      leading: null,

      centerTitle: true,
      title: Text(
        "Teacher Portal",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: context.w(5),
          fontFamily: 'Montserrat',
          letterSpacing: context.w(0.2),
        ),
      ),

      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.w(2.4)),
          child: Image.asset(
            'assets/Telmeeth logo (2).png',
            height: context.h(10.9),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
