import 'package:flutter/material.dart';

class ResponsiveValues {
  // 📌 قياسات الشاشة الأساسية
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // 📌 Breakpoints (لتحديد نوع الجهاز)
  static bool isSmallPhone(BuildContext context) => screenWidth(context) < 360;
  static bool isPhone(BuildContext context) =>
      screenWidth(context) >= 360 && screenWidth(context) < 600;
  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1000;
  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= 1000;

  // 📌 Scale factor حسب العرض (تقدر تعدّل حسب احتياجك)
  static double scaleWidth(BuildContext context, double value) {
    // بناءً على تصميم أساسي 390px عرض
    double baseWidth = 390;
    return (value / baseWidth) * screenWidth(context);
  }

  static double scaleHeight(BuildContext context, double value) {
    // بناءً على تصميم أساسي 844px ارتفاع
    double baseHeight = 844;
    return (value / baseHeight) * screenHeight(context);
  }

  // 📌 Fonts & UI Sizing
  static double font(BuildContext context, double value) =>
      scaleWidth(context, value); // عادة scaleWidth يكفي للخطوط

  static double padding(BuildContext context, double value) =>
      scaleWidth(context, value);

  static double radius(BuildContext context, double value) =>
      scaleWidth(context, value);

  static double icon(BuildContext context, double value) =>
      scaleWidth(context, value);

  // 📌 Shadow
  static double shadowBlur(BuildContext context, double value) =>
      scaleWidth(context, value);

  static double shadowOffsetY(BuildContext context, double value) =>
      scaleHeight(context, value);

  // 📌 قياسات كنسبة % من الشاشة
  static double w(BuildContext context, double percent) =>
      screenWidth(context) * (percent / 100);

  static double h(BuildContext context, double percent) =>
      screenHeight(context) * (percent / 100);
}