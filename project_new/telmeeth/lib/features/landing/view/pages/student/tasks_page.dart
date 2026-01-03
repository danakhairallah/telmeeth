import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

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
                            '✍️ Tasks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            'View and complete your assignments',
                            style: TextStyle(color: Colors.white, fontSize: context.w(3)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Tasks',
                            style: TextStyle(color: Colors.white , fontSize: context.w(3.5)),
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
                                style: TextStyle(color: Colors.white),
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
                      height: context.h(10),
                      color: Color(0xFFEFF6FF),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4)
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '📋Pending',
                            style: TextStyle(color: Color(0xFF1D4ED8) , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(10),
                      color: Color(0xFFFFF7ED),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFFEA580C),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4)
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '⏳In Progress',
                            style: TextStyle(color: Color(0xFFEA580C) , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(10),
                      color: Color(0xFFF0FDF4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4)
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '✅Completed',
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
                SizedBox(height: context.h(1.6)),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(22),
                  color: Color(0xFFFEF2F2),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Math Quiz 1',
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
                            'Science Essay Assignment',
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
