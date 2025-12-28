import 'package:flutter/material.dart';

import '../../constants/responsive.dart';

class AppPrimaryLabel extends StatelessWidget {
  final String? text;

  const AppPrimaryLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: ResponsiveValues.font(context, 16),
        height: 1,
        color: const Color(0xFF334155),
      ),
      textAlign: TextAlign.start,
    );
  }
}
