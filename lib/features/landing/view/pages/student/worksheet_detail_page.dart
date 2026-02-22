import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/worksheet_controller.dart';
import 'package:telmeeth/core/api/student/model/request/worksheet_request.dart';
import 'package:telmeeth/core/api/student/model/response/worksheet_data.dart';
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
  if (!mounted) return;

  setState(() {
    isLoading = true; // تفعيل الـ loading
  });

  try {
    // استدعاء الكنترولر من الـ Provider
    await context.read<WorksheetController>().getWorksheetById(widget.worksheetId);

    if (!mounted) return;

    // جلب الورقة المختارة من الكنترولر
    worksheetData = context.read<WorksheetController>().selectedWorksheet;
  } catch (e) {
    print("Error fetching worksheet detail: $e");
  } finally {
    if (!mounted) return;

    setState(() {
      isLoading = false; // إيقاف الـ loading
    });
  }
}


  void submitWorksheet() async {
  if (worksheetData?.worksheet == null) return;

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

  try {
    final response = await context
        .read<WorksheetController>()
        .submitWorksheet(worksheetData!.worksheet!.id, request);

    showResultDialog(
      context,
      success: true,
      message: response.message ?? "Submitted successfully",
      mark: response.totalMark,
    );
  } catch (e) {
    showResultDialog(
      context,
      success: false,
      message: "Failed to submit worksheet",
    );
  }
}


void showResultDialog(
  BuildContext context, {
  required String message,
  bool success = true,
  int? mark,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          success ? "🎉 Success" : "❌ Failed",
          style: TextStyle(
            color: success ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            if (mark != null) ...[
              const SizedBox(height: 12),
              Text(
                "Your Mark: $mark",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // يسكر الديالوك
              if (success) Navigator.pop(context); // يرجع للصفحة السابقة
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
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
                                  essayAnswers[q!.id!] = value;
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
