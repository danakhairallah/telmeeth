import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Notes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Create and manage your personal study notes',
                        style: TextStyle(fontSize: 12),
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
