import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/average_controller.dart';
import 'package:telmeeth/core/api/student/controllers/mark_controller.dart';
import 'package:telmeeth/core/api/student/controllers/score_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
class MarksScoresPage extends StatefulWidget {
  const MarksScoresPage({super.key});

  @override
  State<MarksScoresPage> createState() => _MarksScoresPageState();
}

class _MarksScoresPageState extends State<MarksScoresPage> {
  String currentTab = "Scores";

  @override
  void initState() {
    super.initState();

    /// تحميل البيانات مرة وحدة
    Future.microtask(() {
      context.read<ScoreController>().getScore();
      context.read<MarksController>().getMarks();
      context.read<AverageController>().getAverage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ================= Tabs =================
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
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(8),
                  vertical: context.h(1),
                ),
                decoration: BoxDecoration(
                  color: currentTab == "Marks" ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.2)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 246, 200, 131),
                    width: context.w(0.4),
                  ),
                ),
                child: Text(
                  "Marks",
                  style: TextStyle(
                    color: currentTab == "Marks"
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
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
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(8),
                  vertical: context.h(1),
                ),
                decoration: BoxDecoration(
                  color: currentTab == "Scores" ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.2)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 246, 200, 131),
                    width: context.w(0.4),
                  ),
                ),
                child: Text(
                  "Scores",
                  style: TextStyle(
                    color: currentTab == "Scores"
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: context.h(2)),

        // ================= Content =================
        currentTab == "Scores"
            ? _buildScoresGrid(context)
            : _buildMarksContent(context),
      ],
    );
  }

  // ================= Scores =================
  Widget _buildScoresGrid(BuildContext context) {
    final scoreCtrl = context.watch<ScoreController>();
    final averageCtrl = context.watch<AverageController>();

    if (scoreCtrl.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final scores = scoreCtrl.scoreModel?.data ?? [];
    final average = averageCtrl.averagModel?.data ?? [];

    if (scores.isEmpty) {
      return const Center(child: Text("No Scores Available"));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(context.w(4)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: context.h(1.3),
        crossAxisSpacing: context.w(2.9),
        childAspectRatio: 1.4,
      ),
      itemCount: scores.length,
      itemBuilder: (context, index) {
        final item = scores[index];

        return Container(
          padding: EdgeInsets.all(context.w(1.8)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.h(2)),
            boxShadow: const [
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
              Text(
                item.subjectNameEn ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.w(3.6),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Score", style: TextStyle(fontSize: context.w(2.5))),
                      Text(
                        "${item.percentage ?? 0}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(3.8),
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Percentage",
                          style: TextStyle(fontSize: context.w(2.5))),
                      Text(
                        "${item.percentage ?? 0}%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(3.8),
                        ),
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

  // ================= Marks =================
  Widget _buildMarksContent(BuildContext context) {
    final marksCtrl = context.watch<MarksController>();

    if (marksCtrl.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final marks = marksCtrl.marks?.data ?? [];

    if (marks.isEmpty) {
      return const Center(child: Text("No Marks Available"));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: marks.length,
      itemBuilder: (context, index) {
        final item = marks[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: context.h(0.6)),
          child: ListTile(
            title: Text(item.subjectNameEn ?? ''),
            trailing: Text(
              "${item.marks ?? 0}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}
