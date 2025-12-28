import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class LiveLessons extends StatelessWidget {
  const LiveLessons({super.key});

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Live Lessons',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.video_camera_back, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Join live interactive lessons with your teachers',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: 120,
                      height: 80,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '🔴Live Now ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: 120,
                      height: 80,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '📅Upcoming',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: 120,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '✅Ended',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_camera_back,
                        color: Colors.grey,
                        size: 60,
                      ),
                      Text('No live lessons scheduled at the moment'),
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
