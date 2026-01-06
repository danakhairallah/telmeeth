import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
class MarksScoresPage extends StatefulWidget {
  const MarksScoresPage({super.key});

  @override
  State<MarksScoresPage> createState() => _MarksScoresPageState();
}

class _MarksScoresPageState extends State<MarksScoresPage> {
  String currentTab = "Scores";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // التاب العلوي
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentTab = "Marks";
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: context.w(8), vertical: context.h(1)),
                decoration: BoxDecoration(
                  color: currentTab == "Marks" ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.2)),
                  border: Border.all(color:  Color.fromARGB(255, 246, 200, 131) , width: context.w(0.4)),
                ),
                child: Text(
                  "Marks",
                  style: TextStyle(
                      color: currentTab == "Marks" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: context.w(2.4)),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentTab = "Scores";
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: context.w(8), vertical: context.h(1)),
                decoration: BoxDecoration(
                  color: currentTab == "Scores" ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.2)),
                  border: Border.all(color: const Color.fromARGB(255, 246, 200, 131) , width: context.w(0.4))
                ),
                child: Text(
                  "Scores",
                  style: TextStyle(
                      color: currentTab == "Scores" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height:context.h(2) ),
        // المحتوى
        currentTab == "Scores" ? _buildScoresGrid() : _buildMarksContent(),
      ],
    );
  }

  Widget _buildScoresGrid() {
    final cards = [
      {"title": "Behavior", "score": 0, "percentage": "0%"},
      {"title": "Worksheet", "score": 8, "percentage": "100%"},
      {"title": "Questionbank", "score": 0, "percentage": "0%"},
      {"title": "Attendance", "score": 0, "percentage": "0%"},
      {"title": "Others", "score": 0, "percentage": "0%"},
    ];

    return GridView.builder(
      shrinkWrap: true, // مهم
      physics: const NeverScrollableScrollPhysics(), // مهم
      padding: EdgeInsets.all(context.w(4)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: context.h(1.3),
        crossAxisSpacing: context.w(2.9),
        childAspectRatio: 1.4,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return Container(
          padding: EdgeInsets.all(context.w(1.8)),
          width: context.w(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.h(2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(card["title"] as String,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: context.w(3.6))),
              SizedBox(height: context.h(0.8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Score", style: TextStyle(fontSize: context.w(2.5))),
                      Text(
                        (card["score"] as int).toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: context.w(3.8) , color: Colors.orange),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Percentage", style: TextStyle(fontSize: context.w(2.5))),
                      Text(
                        card["percentage"] as String,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: context.w(3.8)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMarksContent() {
    return Center(
      child: Text(
        "هنا يظهر محتوى الـ Marks",
        style: TextStyle(fontSize: context.w(5), color: Colors.blueGrey[700]),
      ),
    );
  }
}


