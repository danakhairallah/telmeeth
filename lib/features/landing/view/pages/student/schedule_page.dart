import 'package:flutter/material.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                  child: Text(
                    'Schedule',
                    style: TextStyle(fontSize: context.w(5), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: context.h(1.7)),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Midterm Exam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4),
                            ),
                          ),
                          SizedBox(width: context.w(0.5)),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            // أيقونة X
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(2)),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Midterm Exam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4),
                            ),
                          ),
                          SizedBox(width: context.w(0.5)),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            // أيقونة X
                            onPressed: () {},
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8)),
          child: NavigationBarPrimary(),
        ),
      ),
    );
  }
}
