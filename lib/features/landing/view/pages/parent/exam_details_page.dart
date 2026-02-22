import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/parent_exam_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class ExamDetailsPage extends StatelessWidget {
  final Data exam;

  const ExamDetailsPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FeaturesAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.w(4)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.w(5)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: context.w(2),
                    offset: Offset(0, context.h(0.3)),
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title ?? "-",
                    style: TextStyle(
                      fontSize: context.w(4.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.h(1.2)),

                  _infoRow(context, "Subject", exam.subjectNameAr),
                  _infoRow(context, "Teacher", exam.teacherNameAr),
                  _infoRow(context, "Date", exam.dateTime),
                  _infoRow(context, "Duration", "${exam.duration ?? 0} min"),
                ],
              ),
            ),

            SizedBox(height: context.h(2.5)),

            /// Status & Mark
            Row(
              children: [
                Expanded(
                  child: _smallCard(
                    context,
                    title: "Status",
                    value: exam.status ?? "-",
                  ),
                ),
                SizedBox(width: context.w(3)),
                Expanded(
                  child: _smallCard(
                    context,
                    title: "Mark",
                    value: "${exam.mark ?? 0}",
                  ),
                ),
              ],
            ),

            SizedBox(height: context.h(2.5)),

            /// Description
            Text(
              "Description",
              style: TextStyle(
                fontSize: context.w(4),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.h(1)),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.w(4)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(context.w(4)),
              ),
              child: Text(
                exam.description ?? "No description available",
                style: TextStyle(
                  fontSize: context.w(3.5),
                  height: 1.6,
                ),
              ),
            ),

            SizedBox(height: context.h(2.5)),

            /// Questions Count
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.w(4)),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(context.w(4)),
              ),
              child: Text(
                "Questions count: ${exam.questions?.length ?? 0}",
                style: TextStyle(
                  fontSize: context.w(3.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context, String title, String? value) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(0.7)),
      child: Row(
        children: [
          SizedBox(
            width: context.w(28),
            child: Text(
              "$title:",
              style: TextStyle(
                fontSize: context.w(3.5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? "-",
              style: TextStyle(fontSize: context.w(3.4)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallCard(BuildContext context,
      {required String title, required String value}) {
    return Container(
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.w(4)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.w(1.5),
            offset: Offset(0, context.h(0.3)),
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.w(3.3),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: context.h(1)),
          Text(
            value,
            style: TextStyle(
              fontSize: context.w(4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
