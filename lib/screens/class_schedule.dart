import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';
import 'package:telmeeth1/widget/app_bar.dart';
import 'package:telmeeth1/widget/custom_container1.dart';
import 'package:telmeeth1/widget/drawer.dart';
import 'package:telmeeth1/widget/navigation.dart';

class ClassSchedule extends StatelessWidget {
  const ClassSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(),
      drawer: AppDrawer(),
      body: SafeArea(child: Padding(
        padding:EdgeInsets.all(ResponsiveValues.padding(context, 16)),
        child: Column(
          children: [
            CustomContainer(backgroundColor: Color(0xFFF39F5F), child: Text('📚 My Subjects' , style: TextStyle(color: Colors.white),))
          ],
        ),
        )
        ),
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}