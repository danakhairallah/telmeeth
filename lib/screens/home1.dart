import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';
import 'package:telmeeth1/widget/app_bar.dart';
import 'package:telmeeth1/widget/container.dart';
import 'package:telmeeth1/widget/custom_container1.dart';
import 'package:telmeeth1/widget/drawer.dart';
import 'package:telmeeth1/widget/navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.padding(context, 16)),
        child: Column(
          children: [
            CustomContainer(backgroundColor: Colors.white, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Control panel' ,
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: ResponsiveValues.font(context, 22),),),
                SizedBox(height: 8,),
                Text('Welcome back! Heres an overview of your educational journey.' ,
                style: TextStyle(fontSize: ResponsiveValues.font(context, 12)),)
              ],
            )),
            SizedBox(height: 12,),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 , crossAxisSpacing: 10 , mainAxisSpacing: 10 , childAspectRatio: 1.8),
              shrinkWrap: true,
              itemCount: 4,
              //scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return FilterContainer(child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Materials'),
                    Spacer(),
                    Icon(Icons.book , color: Colors.blue,)
                  ],),
                  SizedBox(height: 6,),
                  Text('1' , style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text('Active plans')
                ],
              ));
              },
            ),
            SizedBox(height: 16,),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    height: 250,
                    child: AspectRatio(
                      aspectRatio: 0.8,
                      child: FilterContainer(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('🚀Fast actions' , 
                          style: TextStyle(fontWeight: FontWeight.bold , fontSize: ResponsiveValues.font(context, 18)),),
                          TextButton(onPressed: (){}, child: Text('📚View materials' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                          TextButton(onPressed: (){}, child: Text('📝Submit an exam' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                          TextButton(onPressed: (){}, child: Text('✍️View tasks' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                          TextButton(onPressed: (){}, child: Text('🗓️Study plan' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                        ],
                      )),
                    ),
                  ),
                  SizedBox(width: 10,),
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: FilterContainer(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fast actions' , 
                        style: TextStyle(fontWeight: FontWeight.bold , fontSize: ResponsiveValues.font(context, 18)),),
                        TextButton(onPressed: (){}, child: Text('View materials' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                        TextButton(onPressed: (){}, child: Text('Submit an exam' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                        TextButton(onPressed: (){}, child: Text('View tasks' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                        TextButton(onPressed: (){}, child: Text('Study plan' , style: TextStyle(fontSize: ResponsiveValues.font(context, 14)),)),
                      ],
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: NavigationBarPrimary()),
    );
  }
}