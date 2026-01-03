import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

import '../../constants/responsive.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  /// المتغير الوحيد
  final Color? backgroundColor;

  /// اختياري
  final VoidCallback? onTap;

  /// padding اختياري
  final EdgeInsetsGeometry? padding;

  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: MediaQuery.sizeOf(context).width,
      padding: padding ?? EdgeInsets.all(ResponsiveValues.padding(context, 20)),
      decoration: BoxDecoration(
        color: backgroundColor, // 👈 المتغير الوحيد
        borderRadius: BorderRadius.circular(
          ResponsiveValues.radius(context, 15),
        ),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: ResponsiveValues.radius(context, 1),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(91, 141, 238, 0.12),
            blurRadius: ResponsiveValues.shadowBlur(context, 12),
            offset: Offset(0, ResponsiveValues.shadowOffsetY(context, 4)),
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'IBMPlexSansArabic',
          color: const Color(0xFF1E293B),
          fontSize: ResponsiveValues.font(context, 16), // نص متجاوب
        ),
        child: child,
      ),
    );

    // InkWell فقط عند الحاجة
    if (onTap == null) return content;

    return InkWell(
      borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 20)),
      onTap: onTap,
      child: content,
    );
  }
}
