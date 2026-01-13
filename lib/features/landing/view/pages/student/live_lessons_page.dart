import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
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
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
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
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 0.2),
                          Icon(Icons.video_camera_back, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: context.h(1)),
                      Text(
                        'Join live interactive lessons with your teachers',
                        style: TextStyle(fontSize: context.w(3)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(1.6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: context.w(30),
                      height: context.h(9.5),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '🔴Live Now ',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(30),
                      height: context.h(9.5),
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
                            '📅Upcoming',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(30),
                      height: context.h(9.5),
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
                            '✅Ended',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(2)),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_camera_back,
                        color: Colors.grey,
                        size: context.w(28),
                      ),
                      Text('No live lessons scheduled at the moment' , style: TextStyle(fontSize: context.w(3.6)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
