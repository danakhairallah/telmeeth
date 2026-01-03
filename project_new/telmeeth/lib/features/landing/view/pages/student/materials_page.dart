import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Materials extends StatelessWidget {
  const Materials({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            '📚 My Subjects',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '👤Muhammad Ahmed Ali',
                            style: TextStyle(color: Colors.white, fontSize: context.w(3)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Subjects',
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
                                style: TextStyle(color: Colors.white , fontSize: context.w(3)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(2)),
                FilterContainer(
                  width: MediaQuery.sizeOf(context).width,
                  height: context.h(38),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: context.h(14),
                        padding: EdgeInsets.all(context.w(3.4)),
                        decoration: BoxDecoration(
                          color: Color(0xFF1E8FFF), // الأزرق
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(context.h(4)),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.menu_book_rounded,
                              size: context.w(6),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            SizedBox(height: context.h(0.6)),
                            Text(
                              "اللغة العربية",
                              style: TextStyle(
                                fontSize: context.w(4.3),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Arabic Language",
                              style: TextStyle(
                                fontSize: context.w(3.4),
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // معلومات المعلم
                      Container(
                        padding: EdgeInsets.all(context.w(3.8)),
                        width: MediaQuery.sizeOf(context).width,
                        height: context.h(10.9),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F2E9),
                          borderRadius: BorderRadius.circular(context.h(3)),
                        ),
                        margin: EdgeInsets.all(context.w(1.9)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Teacher🎓",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontSize: context.w(3)
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "أحمد محمد",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: context.w(3),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Ahmed Mohamed",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: context.w(3),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: context.h(0.5)),

                      // زر عرض الوحدات
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.w(1.9)),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1E8FFF),
                            fixedSize: Size(
                              MediaQuery.sizeOf(context).width,
                              context.h(4.3),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            padding: EdgeInsets.symmetric(vertical: context.h(1.3)),
                          ),
                          icon: Icon(
                            Icons.menu_book_outlined,
                            color: Colors.white,
                          ),
                          label: Text(
                            "View Units",
                            style: TextStyle(fontSize: context.w(3.4), color: Colors.white),
                          ),
                        ),
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
