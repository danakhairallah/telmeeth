import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/worksheet_controller.dart';
import 'package:telmeeth/core/api/model/request/answer_request.dart';
import 'package:telmeeth/core/api/model/request/worksheet_request.dart';
import 'package:telmeeth/core/api/model/response/worksheet.dart';
import 'package:telmeeth/core/api/model/response/worksheet_data.dart';
import 'package:telmeeth/core/api/model/response/worksheet_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/navigation.dart';
import 'package:telmeeth/core/widgets/student/student_app_bar.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class WorksheetDetailPage extends StatefulWidget {
  final int worksheetId;
  const WorksheetDetailPage({super.key, required this.worksheetId});

  @override
  State<WorksheetDetailPage> createState() => _WorksheetDetailPageState();
}

class _WorksheetDetailPageState extends State<WorksheetDetailPage> {
  bool isLoading = true;
  WorksheetData? worksheetData;
  Map<int, String> mcqAnswers = {}; // key: questionId, value: selectedOption
  Map<int, String> essayAnswers = {}; // key: questionId, value: essay text

  @override
  void initState() {
    super.initState();
    fetchWorksheetDetail();
  }

  Future<void> fetchWorksheetDetail() async {
    setState(() {
      isLoading = true;
    });
    await context.read<WorksheetController>().getWorksheetById(widget.worksheetId);
    worksheetData = context.read<WorksheetController>().selectedWorksheet;
    setState(() {
      isLoading = false;
    });
  }

  void submitWorksheet() async {
    if (worksheetData?.worksheet == null) return;

    // التحقق من أن كل سؤال نصي (essay) تمت الإجابة عليه
    final essayQuestions = worksheetData?.worksheet?.essayQuestions ?? [];
    final incompleteEssays = essayQuestions
        .where((q) => (essayAnswers[q.id] == null || essayAnswers[q.id]!.trim().isEmpty))
        .toList();

    // التحقق من أنه يوجد إجابة على الأقل لأي سؤال
    final hasAnswers = mcqAnswers.isNotEmpty || essayAnswers.isNotEmpty;

    if (!hasAnswers) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('جاوب على الأقل سؤال واحد قبل إرسال الورقة!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (incompleteEssays.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فيه أسئلة نصية غير مجاوب عليها!'),
          backgroundColor: Colors.red.shade600,
        ),
      );
      return;
    }

    final request = WorksheetSubmitRequest(
      answers: [
        ...mcqAnswers.entries.map((e) => Answer(
          type: 'mcq',
          questionId: e.key,
          answer: e.value,
        )),
        ...essayAnswers.entries.map((e) => Answer(
          type: 'essay',
          questionId: e.key,
          answer: e.value,
        )),
      ],
    );

    final success = await context
        .read<WorksheetController>()
        .submitWorksheet(worksheetData!.worksheet!.id, request);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال الورقة بنجاح ✅'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('فشل إرسال الورقة. حاول لاحقاً! ❌'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final worksheet = worksheetData?.worksheet;
    final mcqQuestions = worksheet?.multipleChoiceQuestions ?? [];
    final essayQuestions = worksheet?.essayQuestions ?? [];

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ********** Header **********
                CustomContainer(
                  backgroundColor: const Color(0xFFF39F5F),
                  child: Padding(
                    padding: EdgeInsets.all(context.w(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          worksheet?.title ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: context.h(0.8)),
                        Text(
                          'Solve the questions below',
                          style: TextStyle(
                              color: Colors.white, fontSize: context.w(3)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.h(1.5)),

                // ===== Multiple Choice =====
                // ... باقي الكود بدون تغيير

// ===== Multiple Choice =====
                if (mcqQuestions.isNotEmpty)
                  ...mcqQuestions.map((q) {
                    return Container(
                      margin: EdgeInsets.only(bottom: context.h(1.7)), // مسافة بين الأسئلة
                      child: FilterContainer(
                        width: MediaQuery.sizeOf(context).width,
                        color: const Color(0xFFEFF6FF),
                        child: Padding(
                          padding: EdgeInsets.all(context.w(3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                q.question ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.w(4)),
                              ),
                              SizedBox(height: context.h(1)),
                              ...q.options!.entries.map((entry) {
                                final optionKey = entry.key;
                                final optionValue = entry.value;
                                return RadioListTile<String>(
                                  value: optionKey,
                                  groupValue: mcqAnswers[q.id],
                                  title: Text(optionValue),
                                  onChanged: (value) {
                                    setState(() {
                                      mcqAnswers[q.id!] = value!;
                                    });
                                  },
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),

// ===== Essay Questions =====
                if (essayQuestions.isNotEmpty)
                  ...essayQuestions.map((q) {
                    return Container(
                      margin: EdgeInsets.only(bottom: context.h(1.7)), // مسافة بين الأسئلة
                      child: FilterContainer(
                        width: MediaQuery.sizeOf(context).width,
                        color: const Color(0xFFF0FDF4),
                        child: Padding(
                          padding: EdgeInsets.all(context.w(3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                q.question ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.w(4)),
                              ),
                              if (q.hint != null)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: context.h(0.5)),
                                  child: Text(
                                    'Hint: ${q.hint}',
                                    style: TextStyle(
                                        fontSize: context.w(3),
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              TextField(
                                maxLines: null,
                                onChanged: (value) {
                                  essayAnswers[q.id!] = value;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Write your answer here...',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                SizedBox(height: context.h(2.2)),

// ********** Submit Button **********
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submitWorksheet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF39F5F), // اللون البرتقالي
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: context.h(1.7),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 1.2,
                        textStyle: TextStyle(
                          fontSize: context.w(4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Submit Worksheet'),
                    ),
                  ),
                ),
                SizedBox(height: context.h(2.5)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
