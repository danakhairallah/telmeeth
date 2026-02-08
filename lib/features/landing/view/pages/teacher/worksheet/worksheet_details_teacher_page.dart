import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_model.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/worksheet/add_essay_question_teacher_page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/worksheet/add_multi_question_teacher_page.dart';

class WorksheetDetailsTeacherPage extends StatefulWidget {
  final int worksheetId;

  const WorksheetDetailsTeacherPage({
    Key? key,
    required this.worksheetId,
  }) : super(key: key);

  @override
  State<WorksheetDetailsTeacherPage> createState() =>
      _WorksheetDetailsTeacherPageState();
}

class _WorksheetDetailsTeacherPageState
    extends State<WorksheetDetailsTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<WorksheetTeacherController>()
          .fetchWorksheetDetails(widget.worksheetId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Worksheet Details"),
        backgroundColor: Colors.orange.shade700,
      ),
      body: Consumer<WorksheetTeacherController>(
        builder: (context, ctrl, _) {
          if (ctrl.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final WorksheetDataT? worksheet =
              ctrl.worksheetDetails?.worksheetDataT;

          if (worksheet == null) {
            return const Center(child: Text("No details found."));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  worksheet.title ?? "-",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Text("Type: ${worksheet.type ?? '-'}"),
                if (worksheet.unitId != null)
                  Text("Unit ID: ${worksheet.unitId}"),
                if (worksheet.lessonId != null)
                  Text("Lesson ID: ${worksheet.lessonId}"),

                const SizedBox(height: 24),

                /// ===== ACTIONS =====
                Row(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Add Multi Question'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddMultiQuestionTeacherPage(worksheetId: worksheet.id!),
                          ),
                        );
                      },

                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Add Essay Question'),
                      onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (_) =>
                                 AddEssayQuestionTeacherPage(
                                   worksheetId: worksheet.id!,
                                 ),
                           ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
