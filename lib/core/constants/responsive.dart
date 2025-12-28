import 'package:flutter/material.dart';

class ResponsiveValues {
  // 📌 MediaQuery
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // 📌 Breakpoints
  static bool isSmallPhone(BuildContext context) => width(context) < 360;
  static bool isPhone(BuildContext context) =>
      width(context) >= 360 && width(context) < 600;
  static bool isTablet(BuildContext context) =>
      width(context) >= 600 && width(context) < 1000;
  static bool isDesktop(BuildContext context) => width(context) >= 1000;

  // 📌 Scaling Logic
  static double scale(BuildContext context, double base) {
    if (isSmallPhone(context)) return base * 0.9;
    if (isPhone(context)) return base;
    if (isTablet(context)) return base * 1.15;
    return base * 1.3;
  }

  // 📌 Fonts & Sizing
  static double font(BuildContext context, double value) =>
      scale(context, value);

  static double padding(BuildContext context, double value) =>
      scale(context, value);

  static double radius(BuildContext context, double value) =>
      scale(context, value);

  static double icon(BuildContext context, double value) =>
      scale(context, value);

  // 📌 ⭐ Shadow Blur + Offset
  static double shadowBlur(BuildContext context, double value) =>
      scale(context, value);

  static double shadowOffsetY(BuildContext context, double value) =>
      scale(context, value);
}
