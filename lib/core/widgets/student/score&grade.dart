import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/mark_controller.dart';
import 'package:telmeeth/core/api/student/controllers/score_controller.dart';
import 'package:telmeeth/core/api/student/model/response/score_model.dart';
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
    // ربط الكنترولر
    final scoreCtrl = context.watch<ScoreController>();
    final List<ScoreData> scores = scoreCtrl.scoreModel?.data ?? [];

    if (scoreCtrl.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (scores.isEmpty) {
      return Center(
        child: Text(
          "No scores available.",
          style: TextStyle(fontSize: context.w(4), color: Colors.grey),
        ),
      );
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
        final s = scores[index];
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
              Text(
                s.subjectNameEn ?? "No name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(3.6)),
              ),
              SizedBox(height: context.h(0.8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Score", style: TextStyle(fontSize: context.w(2.5))),
                      Text(
                        "${s.totalMark ?? 0}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.w(3.8),
                            color: Colors.orange),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Percentage", style: TextStyle(fontSize: context.w(2.5))),
                      Text(
                        "${(s.percentage ?? 0).toStringAsFixed(2)}%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.w(3.8)),
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
    final marksCtrl = context.watch<MarksController>();
    final marksData = marksCtrl.marks?.data ?? [];

    if (marksCtrl.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (marksData.isEmpty) {
      return Center(
        child: Text(
          "No marks available.",
          style: TextStyle(fontSize: context.w(4), color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: marksData.length,
      separatorBuilder: (_, __) => SizedBox(height: context.h(1)),
      itemBuilder: (context, idx) {
        final m = marksData[idx];
        return Container(
          padding: EdgeInsets.all(context.h(1.2)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.h(1.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                m.subjectNameEn ?? "No name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.w(3.6),
                    color: Colors.blueGrey[800]),
              ),
              SizedBox(height: context.h(0.7)),
              ...(m.marks ?? []).map((mark) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mark.source ?? "Source",
                    style: TextStyle(fontSize: context.w(3), color: Colors.grey[700]),
                  ),
                  Text(
                    "${mark.mark ?? '-'} / ${mark.fullMark ?? '-'}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.w(3.3),
                        color: Colors.orange),
                  ),
                ],
              )),
            ],
          ),
        );
      },
    );
  }
}


