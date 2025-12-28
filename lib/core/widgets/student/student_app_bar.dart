import 'package:flutter/material.dart';

class StudentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StudentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color(0xFF495C6E)),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Student Portal",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Montserrat',
          letterSpacing: 1.1,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            'assets/logo_telmeeth.png',
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
