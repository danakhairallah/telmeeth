import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';

class NavigationBarPrimary extends StatelessWidget {
  const NavigationBarPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveValues.padding(context, 8)),
      width: MediaQuery.sizeOf(context).width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 20)),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: ResponsiveValues.border(context, 2),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(91, 141, 238, 0.12),
            blurRadius: ResponsiveValues.shadowBlur(context, 12),
            offset: Offset(0, ResponsiveValues.shadowOffsetY(context, 4)),
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: (){}, child: Text('🏠\nControl Panel' , style: TextStyle(fontWeight: FontWeight.bold),)),
          TextButton(onPressed: (){}, child: Text('📚\nMaterials', style: TextStyle(fontWeight: FontWeight.bold))),
          TextButton(onPressed: (){}, child: Text('📝\nTasks', style: TextStyle(fontWeight: FontWeight.bold))),
          TextButton(onPressed: (){}, child: Text('👤\nProfile', style: TextStyle(fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}