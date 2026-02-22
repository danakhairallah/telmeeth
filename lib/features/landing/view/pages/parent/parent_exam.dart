import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_exam_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/parent_exam_model.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'exam_details_page.dart';

class ParentExamPage extends StatefulWidget {
  final int studentId;
  const ParentExamPage({super.key, required this.studentId});

  @override
  State<ParentExamPage> createState() => _ParentExamPageState();
}

class _ParentExamPageState extends State<ParentExamPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<ParentExamController>()
            .getParentExams(widget.studentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Column(
          children: [

            _header(context),

            SizedBox(height: context.h(3)),

            Expanded(
              child: Consumer<ParentExamController>(
                builder: (context, controller, _) {

                  if (controller.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  final exams =
                      controller.parentExamModel?.data ?? [];

                  if (exams.isEmpty) {
                    return _emptyState(context);
                  }

                  return ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (context, index) =>
                        _examCard(context, exams[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
        borderRadius:
        BorderRadius.circular(context.radius(25)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.shadowBlur(18),
            offset:
            Offset(0, context.shadowOffsetY(6)),
            color:
            AppColors.primary.withOpacity(.35),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.quiz,
                color: Colors.white,
                size: context.icon(28)),
          ),
          SizedBox(width: context.w(4)),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text("Exams",
                    style: TextStyle(
                        fontSize: context.font(18),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text("Track academic assessments",
                    style: TextStyle(
                        fontSize: context.font(12),
                        color: Colors.white
                            .withOpacity(.9))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _examCard(BuildContext context, Data exam) {

    Color statusColor = exam.status == "completed"
        ? Colors.green
        : exam.status == "upcoming"
        ? Colors.blue
        : Colors.red;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                ExamDetailsPage(exam: exam)),
      ),
      child: Container(
        margin:
        EdgeInsets.only(bottom: context.h(2)),
        padding: EdgeInsets.all(context.w(4)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(
              context.radius(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [

                Expanded(
                  child: Text(
                    exam.title ?? "-",
                    style: TextStyle(
                      fontSize:
                      context.font(15),
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  padding:
                  EdgeInsets.symmetric(
                    horizontal:
                    context.w(3),
                    vertical:
                    context.h(.5),
                  ),
                  decoration:
                  BoxDecoration(
                    color: statusColor
                        .withOpacity(.1),
                    borderRadius:
                    BorderRadius
                        .circular(30),
                  ),
                  child: Text(
                    exam.status ?? "",
                    style: TextStyle(
                        color: statusColor,
                        fontSize:
                        context.font(
                            11)),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.h(1)),

            Text(
              exam.subjectNameAr ?? "",
              style: TextStyle(
                  fontSize:
                  context.font(12),
                  color:
                  Colors.grey[700]),
            ),

            SizedBox(height: context.h(1)),

            if (exam.submitted == true)
              Icon(Icons.check_circle,
                  color: Colors.green,
                  size: context.icon(18)),
          ],
        ),
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Text("No exams available",
          style:
          TextStyle(fontSize: context.font(14))),
    );
  }
}