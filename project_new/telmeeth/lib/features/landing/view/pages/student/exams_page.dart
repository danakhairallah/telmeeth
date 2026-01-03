import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Exams extends StatelessWidget {
  const Exams({super.key});

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
                  backgroundColor: Color(0xFFF39F5F),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📝 Exams',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            'View and take your exams',
                            style: TextStyle(color: Colors.white, fontSize: context.w(3)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Exams',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: context.h(0.6)),
                          Container(
                            width: context.w(9.7),
                            height: context.h(4.3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: context.w(0.4)),
                              borderRadius: BorderRadius.circular(context.h(0.7)),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.white , fontSize: context.w(3)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(1.6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(9.6),
                      color: Color(0xFFEFF6FF),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '📋Not Started',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3)
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(9.6),
                      color: Color(0xFFFFF7ED),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFFEA580C),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '📋Not Started',
                            style: TextStyle(
                              color: Color(0xFFEA580C),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3)
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(9.6),
                      color: Color(0xFFF0FDF4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '📋Not Started',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(1.7)),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(22),
                  color: Color(0xFFFEF2F2),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Midterm Exam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
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
                  height: context.h(22),
                  color: Color(0xFFFEF2F2),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Midterm Exam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
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
