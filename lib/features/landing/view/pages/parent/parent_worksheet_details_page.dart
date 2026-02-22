import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/worksheet_parent_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/worksheet_parent_model.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class ParentWorksheetDetailsPage extends StatefulWidget {
  final int studentId;
  final int worksheetId;

  const ParentWorksheetDetailsPage({
    super.key,
    required this.studentId,
    required this.worksheetId,
  });

  @override
  State<ParentWorksheetDetailsPage> createState() =>
      _ParentWorksheetDetailsPageState();
}

class _ParentWorksheetDetailsPageState
    extends State<ParentWorksheetDetailsPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<WorksheetParentController>()
            .fetchParentWorksheet(
          widget.studentId,
          widget.worksheetId,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Consumer<WorksheetParentController>(
          builder: (context, controller, _) {

            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            final worksheet =
                controller.worksheetParentModel?.worksheet;

            if (worksheet == null) {
              return Center(
                child: Text("No worksheet found"),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  _header(context, worksheet),

                  SizedBox(height: context.h(3)),

                  _infoCards(context, worksheet),

                  SizedBox(height: context.h(3)),

                  if (worksheet.multipleChoice != null &&
                      worksheet.multipleChoice!.isNotEmpty)
                    _multipleChoiceSection(
                        context,
                        worksheet.multipleChoice!),

                  if (worksheet.essayQuestions != null &&
                      worksheet.essayQuestions!.isNotEmpty)
                    _essaySection(
                        context,
                        worksheet.essayQuestions!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ================= HEADER =================

  Widget _header(BuildContext context,
      Worksheet worksheet) {
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
            blurRadius:
            context.shadowBlur(18),
            offset:
            Offset(0,
                context.shadowOffsetY(6)),
            color: AppColors.primary
                .withOpacity(.35),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            padding:
            EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.assignment,
              color: Colors.white,
              size: context.icon(28),
            ),
          ),

          SizedBox(width: context.w(4)),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  worksheet.title ?? "-",
                  style: TextStyle(
                    fontSize:
                    context.font(16),
                    fontWeight:
                    FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    height:
                    context.h(.5)),
                Text(
                  worksheet.subject?.toString() ??
                      "",
                  style: TextStyle(
                    fontSize:
                    context.font(12),
                    color: Colors.white
                        .withOpacity(.9),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ================= INFO CARDS =================

  Widget _infoCards(BuildContext context,
      Worksheet worksheet) {
    return Row(
      children: [
        Expanded(
          child: _smallCard(
            context,
            "Status",
            worksheet.isSubmitted == true
                ? "Submitted"
                : "Pending",
          ),
        ),
        SizedBox(width: context.w(3)),
        Expanded(
          child: _smallCard(
            context,
            "Mark",
            "${worksheet.studentMark ?? 0} / ${worksheet.totalMark ?? 0}",
          ),
        ),
      ],
    );
  }

  Widget _smallCard(BuildContext context,
      String title,
      String value) {
    return Container(
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
            context.radius(18)),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: Colors.black
                .withOpacity(.05),
          )
        ],
      ),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(
                fontSize:
                context.font(12),
                color: Colors.grey,
              )),
          SizedBox(height: context.h(1)),
          Text(value,
              style: TextStyle(
                fontSize:
                context.font(14),
                fontWeight:
                FontWeight.bold,
                color:
                AppColors.primary,
              )),
        ],
      ),
    );
  }

  // ================= MULTIPLE CHOICE =================

  Widget _multipleChoiceSection(
      BuildContext context,
      List<MultipleChoice> list) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text("Multiple Choice",
            style: TextStyle(
                fontSize:
                context.font(15),
                fontWeight:
                FontWeight.bold)),
        SizedBox(height: context.h(2)),

        ...list.map((q) =>
            _questionCard(
                context,
                q.question ?? "",
                q.studentAnswer,
                q.correctAnswer,
                q.isCorrect == 1)),
      ],
    );
  }

  // ================= ESSAY =================

  Widget _essaySection(
      BuildContext context,
      List<EssayQuestion> list) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.h(3)),
        Text("Essay Questions",
            style: TextStyle(
                fontSize:
                context.font(15),
                fontWeight:
                FontWeight.bold)),
        SizedBox(height: context.h(2)),

        ...list.map((q) =>
            _questionCard(
                context,
                q.question ?? "",
                q.studentAnswer,
                null,
                null)),
      ],
    );
  }

  Widget _questionCard(
      BuildContext context,
      String question,
      String? studentAnswer,
      String? correctAnswer,
      bool? isCorrect) {

    return Container(
      margin: EdgeInsets.only(
          bottom: context.h(2)),
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
            context.radius(18)),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(question,
              style: TextStyle(
                  fontWeight:
                  FontWeight.bold)),

          SizedBox(height: context.h(1)),

          Text("Student: ${studentAnswer ?? '-'}"),

          if (correctAnswer != null)
            Text("Correct: $correctAnswer"),

          if (isCorrect != null)
            Text(
              isCorrect ? "Correct ✔" : "Wrong ✘",
              style: TextStyle(
                  color: isCorrect
                      ? Colors.green
                      : Colors.red),
            ),
        ],
      ),
    );
  }
}