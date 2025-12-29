import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';

import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: StudentDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(ResponsiveValues.padding(context, 16)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                  child: Text(
                    'Schedule',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 16),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Midterm Exam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveValues.font(context, 20),
                            ),
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,
                            // حجم الدائرة
                            backgroundColor: Color(0xFFEFEFEF),
                            // لون الدائرة
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              // أيقونة X
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Midterm Exam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveValues.font(context, 20),
                            ),
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,
                            // حجم الدائرة
                            backgroundColor: Color(0xFFEFEFEF),
                            // لون الدائرة
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              // أيقونة X
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}
