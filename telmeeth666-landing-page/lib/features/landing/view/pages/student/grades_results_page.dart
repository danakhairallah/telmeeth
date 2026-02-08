import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/average_controller.dart';
import 'package:telmeeth/core/api/student/controllers/mark_controller.dart';
import 'package:telmeeth/core/api/student/controllers/score_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/score&grade.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';


class GradesResults extends StatefulWidget {
  const GradesResults({super.key});

  @override
  State<GradesResults> createState() => _GradesResultsState();
}

class _GradesResultsState extends State<GradesResults> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ScoreController>().getScore();
      context.read<MarksController>().getMarks();
      context.read<AverageController>().getAverage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final averageCtrl = context.watch<AverageController>();
    final marksCtrl = context.watch<MarksController>();

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
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

                SizedBox(height: context.h(2)),

                /// ===== Average + Total Marks =====
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
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4),
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            averageCtrl.isLoading
                                ? "..."
                                : "${averageCtrl.averagModel?.data?.length ?? 0}%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.5),
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                    FilterContainer(
                      width: context.w(45),
                      height: context.h(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Score',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4),
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            marksCtrl.isLoading
                                ? "..."
                                : "${marksCtrl.marks?.data?.length ?? 0}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.5),
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.h(1.5)),

                /// ===== Tabs (Scores / Marks) =====
                const MarksScoresPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
