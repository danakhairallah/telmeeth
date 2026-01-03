import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class ClassSchedule extends StatelessWidget {
  const ClassSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(child: Padding(
        padding:EdgeInsets.all(context.w(4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(backgroundColor: Color(0xFFF39F5F), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('📅 My Timetable' , style: TextStyle(color: Colors.white , fontSize: context.w(5) , fontWeight: FontWeight.bold),),
                      SizedBox(height: context.h(0.8),),
                      Text('👤Muhammad Ahmed Ali' , style: TextStyle(color: Colors.white , fontSize: context.w(3)),),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text('Total Classes' , style: TextStyle(color: Colors.white , fontSize: context.w(3)),),
                      SizedBox(height: context.h(0.6),),
                      Container(
                        width: context.w(9.7),
                        height: context.h(4.3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white , width: context.w(0.4)),
                          borderRadius: BorderRadius.circular(context.h(0.7))
                        ),
                        child: Center(child: Text('1' , style: TextStyle(color: Colors.white ,fontSize: context.w(3)),),),
                      )
                    ],
                  )
                ],
              )
              ),
            ],
          ),
        ),
        )
        ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8)),
          child: NavigationBarPrimary(),
        ),
      ),
    );
  }
}