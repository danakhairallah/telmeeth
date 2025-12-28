import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class WorkSheets extends StatelessWidget {
  const WorkSheets({super.key});

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
                  backgroundColor: Color(0xFFF39F5F),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📑 Worksheets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Practice with assigned worksheets',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Worksheets',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: 180,
                      height: 80,
                      color: Color(0xFFEFF6FF),
                      child: Column(
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '📋Available',
                            style: TextStyle(color: Color(0xFF1D4ED8)),
                          ),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: 180,
                      height: 80,
                      color: Color(0xFFF0FDF4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '✅Completed',
                            style: TextStyle(color: Color(0xFF16A34A)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  color: Color(0xFFEFF6FF),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Worksheet Test',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveValues.font(context, 20),
                            ),
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20, // حجم الدائرة
                            backgroundColor: Color(0xFFEFEFEF), // لون الدائرة
                            child: IconButton(
                              icon: Icon(Icons.pages, color: Colors.blue),
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
