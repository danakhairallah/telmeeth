import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget{
  const AppBarPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Student Portal' ,
          style: TextStyle(fontSize: ResponsiveValues.font(context, 20), fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 2,),
          Image.asset('assets/png/icon.png', height: 50,)
        ],
      ),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}