
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class StudyPlan extends StatelessWidget {
  const StudyPlan({super.key});

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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Study Plans',
                            style: TextStyle(
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.4)),
                          Icon(Icons.menu_book, color: Colors.black),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(context.w(2)),
                            width: context.w(28),
                            height: context.h(4.5),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(context.h(1.2))
                            ),
                            child: Text('Create New Plan +' , style: TextStyle(color: Colors.white , fontSize: context.w(2.8)),),
                          )
                        ],
                      ),
                      SizedBox(height: context.h(0.8)),
                      Text(
                        'Manage your AI-generated study schedules',
                        style: TextStyle(fontSize: context.w(3)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(2),),
                DottedBorder(
                  options: CircularDottedBorderOptions(
                    color: Colors.grey, // لون البوردر
                    strokeWidth: 1.5,
                    dashPattern: [6, 4], // طول النقطة والفرا
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB), // خلفية فاتحة مثل الصورة
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            const Icon(Icons.menu_book_outlined,
                size: 40, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              "No Study Plans Yet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Create your first AI-powered study plan\nto get personalized learning schedules",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // الزر
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Create Your First Plan",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
                  )
                )
              ]
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