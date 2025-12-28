import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(ResponsiveValues.padding(context, 16)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                  child: Column(
                    children: [
                      Text('Highlights🖊️' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),
                      SizedBox(height: 8,),
                      Text('Save and organize your study highlights' , style: TextStyle(fontSize: 12))
                    ],
                  ))
              ],
            ),
          ),
        )),
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}