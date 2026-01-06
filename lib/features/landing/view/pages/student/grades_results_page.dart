import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/score&grade.dart';

import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class GradesResults extends StatelessWidget {
  const GradesResults({super.key});

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
                    'Marks & Scores',
                    style: TextStyle(
                      fontSize: context.w(5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: context.h(2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: context.w(45),
                      height: context.h(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overall Average',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4),
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '0.0%',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(4.5) , color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10,),
                    FilterContainer(
                      width: context.w(45),
                      height: context.h(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Score',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4),
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '8',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(4.5) , color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(1.5),),
                MarksScoresPage()
              ],
            ),
          ),
          ),
          ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8),),
          child: NavigationBarPrimary(),
        ),
      ),
    );
  }
}
