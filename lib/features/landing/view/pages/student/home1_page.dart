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
        padding: EdgeInsets.all(context.w(4)),
        child: SingleChildScrollView(
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
                        fontSize: context.w(5),
                      ),
                    ),
                    SizedBox(height: context.h(1.5),),
                    Text(
                      'Welcome back! Heres an overview of your educational journey.',
                      style: TextStyle(
                        fontSize: context.w(3.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(1.5)),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: context.w(1.2),
                  mainAxisSpacing: context.h(1.2),
                  childAspectRatio: 1.8,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                //scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return FilterContainer(
                    width: context.w(60),
                    height: context.h(65),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Materials' , style: TextStyle(fontSize: context.w(5)),),
                            Spacer(),
                            Icon(Icons.book, color: Colors.blue),
                          ],
                        ),
                        SizedBox(height: context.h(0.5)),
                        Text('1', style: TextStyle(fontWeight: FontWeight.bold , fontSize: context.w(3))),
                        SizedBox(height: context.h(0.5)),
                        Text('Active plans' , style: TextStyle(fontSize: context.w(2.4)),),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: context.h(1.5)),
              Row(
                children: [
                  FilterContainer(
                    width: context.w(45),
                    height: context.h(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🚀Fast actions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.w(5),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '📚View materials',
                            style: TextStyle(
                              fontSize: context.w(3.5),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '📝Submit an exam',
                            style: TextStyle(
                              fontSize: context.w(3.5),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '✍️View tasks',
                            style: TextStyle(
                              fontSize: context.w(3.5),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '🗓️Study plan',
                            style: TextStyle(
                              fontSize: context.w(3.5)),
                            ),
                          ),
                    ]
                    ),
                  ),
                  SizedBox(width: context.w(1.3),),
              FilterContainer(
                width: context.w(45),
                height:  context.h(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fast actions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.w(5),                          ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View materials',
                        style: TextStyle(
                          fontSize: context.w(3.5),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Submit an exam',
                        style: TextStyle(
                          fontSize: context.w(3.5),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View tasks',
                        style: TextStyle(
                          fontSize: context.w(3.5),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Study plan',
                        style: TextStyle(
                          fontSize: context.w(3.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                ],
              ),
            ]
                ),
        )
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
