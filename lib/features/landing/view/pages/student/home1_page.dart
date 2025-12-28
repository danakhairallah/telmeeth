import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.padding(context, 16)),
        child: Column(
          children: [
            CustomContainer(
              backgroundColor: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Control panel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveValues.font(context, 22),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Welcome back! Heres an overview of your educational journey.',
                    style: TextStyle(
                      fontSize: ResponsiveValues.font(context, 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.8,
              ),
              shrinkWrap: true,
              itemCount: 4,
              //scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return FilterContainer(
                  width: 250,
                  height: 250,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Materials'),
                          Spacer(),
                          Icon(Icons.book, color: Colors.blue),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text('Active plans'),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterContainer(
                    width: 180,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🚀Fast actions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveValues.font(context, 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '📚View materials',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '📝Submit an exam',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '✍️View tasks',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '🗓️Study plan',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  FilterContainer(
                    width: 180,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fast actions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveValues.font(context, 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View materials',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Submit an exam',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View tasks',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Study plan',
                            style: TextStyle(
                              fontSize: ResponsiveValues.font(context, 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: NavigationBarPrimary()),
    );
  }
}
