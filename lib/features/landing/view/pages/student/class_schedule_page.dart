import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/custom_container1.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

class ClassSchedule extends StatelessWidget {
  const ClassSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: StudentDrawer(),
      body: SafeArea(child: Padding(
        padding:EdgeInsets.all(ResponsiveValues.padding(context, 16)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(backgroundColor: Color(0xFFF39F5F), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('📅 My Timetable' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      Text('👤Muhammad Ahmed Ali' , style: TextStyle(color: Colors.white , fontSize: 12),),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text('Total Classes' , style: TextStyle(color: Colors.white),),
                      SizedBox(height: 6,),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white , width: 2),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text('1' , style: TextStyle(color: Colors.white),),),
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
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}