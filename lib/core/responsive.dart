import 'package:flutter/material.dart';

class ResponsiveValues {
  static double _scale(BuildContext context, double base) {
    final width = MediaQuery.of(context).size.width;

    if (width < 360) return base * 0.9;   // موبايل صغير
    if (width < 600) return base;         // موبايل عادي
    if (width < 900) return base * 1.1;   // تابلت
    return base * 1.2;                    // شاشات كبيرة
  }

  // 🔹 Font
  static double font(BuildContext context, double base) {
    return _scale(context, base);
  }

  // 🔹 Padding
  static double padding(BuildContext context, double base) {
    return _scale(context, base);
  }

  // 🔹 Radius
  static double radius(BuildContext context, double base) {
    return _scale(context, base);
  }

  // 🔹 Border width
  static double border(BuildContext context, double base) {
    return _scale(context, base);
  }

  // 🔹 Shadow blur
  static double shadowBlur(BuildContext context, double base) {
    return _scale(context, base);
  }

  // 🔹 Shadow offset Y
  static double shadowOffsetY(BuildContext context, double base) {
    return _scale(context, base);
  }
}