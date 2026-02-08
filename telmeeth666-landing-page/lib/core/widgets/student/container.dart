import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class FilterContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool isActive;
  final double? width;
  final double? height;
  final Color color;

  const FilterContainer({
    super.key,
    required this.child,
    this.onTap,
    this.isActive = false,
    this.width,
    this.height,
    this.color = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.h(1.7)),
      onTap: onTap,
      child: AnimatedContainer(
        width: width,
        height: height,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(context.w(2.9)),
        decoration: BoxDecoration(
          color: color, // bg-theme-surface
          borderRadius: BorderRadius.circular(context.h(1.7)), // rounded-theme-lg
          border: Border.all(
            color: isActive
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300, // border-theme-borders
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
