import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';

import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Attendance extends StatelessWidget {
  Attendance({super.key});
  final ValueNotifier<String> selected = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // طباعة الأبعاد في الـ console مباشرة
    print("📱 عرض الشاشة: $width px");
    print("📱 ارتفاع الشاشة: $height px");
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(child: Padding(
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
                            'Attendance Records',
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
                        'Track your attendance in classes and your activity on the website',
                        style: TextStyle(fontSize: context.w(3)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilterContainer(
                      width: context.w(42),
                      height: context.h(10),
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
                            'Total chapter records',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(2.8)),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(42),
                      height: context.h(10),
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
                            'Number of attendance',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(2.8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilterContainer(
                      width: context.w(42),
                      height: context.h(10),
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
                            'Number of absences',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(2.8)),
                          ),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: context.w(42),
                      height: context.h(10),
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
                            'Site sessions',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(2.8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(2),),
                attendanceSelector(context, selected),
                SizedBox(height: context.h(1.5),),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('📅' , style: TextStyle(fontSize: context.w(5)),),
                    SizedBox(height: context.h(1),),
                    Text('No attendance records were found for the classes.' , style: TextStyle(fontSize: context.w(3)),)
                  ],
                ))
            ],
          ),
        ),)),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8)),
          child: NavigationBarPrimary(),
        ),
      ),
    );
  }

  Widget attendanceSelector(BuildContext context, ValueNotifier<String> selected) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildOption(context, "نشاط الموقع", selected),
      const SizedBox(width: 10),
      _buildOption(context, "حضور الفصل", selected),
    ],
  );
}

Widget _buildOption(
    BuildContext context, String text, ValueNotifier<String> selected) {
  return ValueListenableBuilder(
    valueListenable: selected,
    builder: (context, value, _) {
      final bool isSelected = value == text;

      return GestureDetector(
        onTap: () => selected.value = text,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: context.w(8) , vertical: context.h(2)),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(context.h(1.5)),
            border: Border.all(color: Colors.orangeAccent, width: 2),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    },
  );
}
}
