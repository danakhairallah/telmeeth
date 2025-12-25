import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const SectionWrapper({
    super.key,
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 300,
        ),
        child: child,
      ),
    );
  }
}
