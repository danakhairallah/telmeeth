import 'package:flutter/material.dart';

class TelmeethAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onToggleTheme;
  final VoidCallback onLogin;

  const TelmeethAppBar({
    super.key,
    required this.onToggleTheme,
    required this.onLogin,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      // الحل الأهم: إلغاء المسافة الجانبية الافتراضية
      titleSpacing: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Image.asset(
              'assets/logo_telmeeth.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Telmeeth',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
