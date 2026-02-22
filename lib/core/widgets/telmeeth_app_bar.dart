import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class TelmeethAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onToggleTheme;
  final VoidCallback onLogin;

  const TelmeethAppBar({
    super.key,
    required this.onToggleTheme,
    required this.onLogin,
  });

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Image.asset(
              'assets/logo_telmeeth.png',
              height: context.h(10.9),
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Telmeeth',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: context.w(5),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
