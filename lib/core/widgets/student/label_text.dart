import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class AppPrimaryLabel extends StatelessWidget {
  final String? text;

  const AppPrimaryLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: context.w(3.8),
        height: context.h(0.1),
        color: const Color(0xFF334155),
      ),
      textAlign: TextAlign.start,
    );
  }
}
