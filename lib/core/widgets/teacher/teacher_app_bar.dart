import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/features/landing/view/pages/student/profile_page.dart';

import '../../../features/landing/view/pages/login/login_page.dart';


enum MenuAction {
  language,
  theme,
  profile,
  logout,
}

class TeacherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TeacherAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      /// ☰ Menu Button
      leading: PopupMenuButton<MenuAction>(
        icon: const Icon(
          Icons.menu,
          color: Color(0xFF495C6E),
        ),

        offset: const Offset(0, kToolbarHeight),
        color: Colors.white,

        constraints: const BoxConstraints(
          minWidth: 180,
          maxWidth: 200,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        onSelected: (_) {},

        itemBuilder: (context) => [
          /// 🌐 Change Language
          PopupMenuItem(
            value: MenuAction.language,
            padding: EdgeInsets.zero,
            height: 42,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.pop(context);
                // TODO: Change language
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 18,
                    color: Color(0xFFFF8A00),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Change Language',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          /// 🌙 Dark Mode
          PopupMenuItem(
            value: MenuAction.theme,
            padding: EdgeInsets.zero,
            height: 42,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.pop(context);
                // TODO: Toggle theme
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    size: 18,
                    color: Color(0xFFFF8A00),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          PopupMenuItem(
            value: MenuAction.profile,
            padding: EdgeInsets.zero,
            height: 42,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfilePage(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 18,
                    color: Color(0xFFFF8A00),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          const PopupMenuDivider(height: 1),

          PopupMenuItem(
            value: MenuAction.logout,
            padding: EdgeInsets.zero,
            height: 42,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignIn(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 18,
                    color: Color(0xFFFF8A00),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

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
