import 'package:flutter/material.dart';

extension ResponsiveValues1 on BuildContext {
  // 📌 أبعاد الشاشة
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // 🟢 نسبة مئوية من الشاشة
  double w(double percent) => screenWidth * (percent / 100);
  double h(double percent) => screenHeight * (percent / 100);

  // 🔵 Scale حسب تصميم أساسي 390x844
  double scaleWidth(double value) => value * screenWidth / 390;
  double scaleHeight(double value) => value * screenHeight / 844;

  // 🟣 فونت / padding / radius / icons
  double font(double value) => scaleWidth(value);
  double padding(double value, int i) => scaleWidth(value);
  double radius(double value) => scaleWidth(value);
  double icon(double value) => scaleWidth(value);

  // Shadow
  double shadowBlur(double value) => scaleWidth(value);
  double shadowOffsetY(double value) => scaleHeight(value);
}
