import 'package:flutter/material.dart';

class FilterContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool isActive;

  const FilterContainer({
    super.key,
    required this.child,
    this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        width: 90,
        //height: 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white, // bg-theme-surface
          borderRadius: BorderRadius.circular(16), // rounded-theme-lg
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
