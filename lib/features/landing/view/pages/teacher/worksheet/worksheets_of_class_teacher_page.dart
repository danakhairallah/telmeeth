import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/worksheet_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_model.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/worksheet/add_worksheet_teacher_page.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/worksheet/worksheet_details_teacher_page.dart';

class WorksheetsOfClassTeacherPage extends StatefulWidget {
  final int classId;

  const WorksheetsOfClassTeacherPage({super.key, required this.classId});

  @override
  State<WorksheetsOfClassTeacherPage> createState() => _WorksheetsOfClassTeacherPageState();
}

class _WorksheetsOfClassTeacherPageState extends State<WorksheetsOfClassTeacherPage> {
  @override
  void initState() {
    super.initState();
    // جلب البيانات أول ما تفتح الصفحة
    Future.microtask(() {
      context.read<WorksheetTeacherController>().fetchWorksheets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worksheets'),
        backgroundColor: Colors.orange.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<WorksheetTeacherController>(
        builder: (context, ctrl, _) {
          final List<WorksheetDataT> worksheets = (ctrl.worksheets?.worksheetDataT ?? [])
              .where((w) => w.classes?.any((c) => c.id == widget.classId) ?? false)
              .toList();

          if (ctrl.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (worksheets.isEmpty) {
            return const Center(child: Text('No worksheets found.'));
          }

          return ListView.separated(
            padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
            separatorBuilder: (_, __) => SizedBox(height: ResponsiveValues.h(context, 2)),
            itemCount: worksheets.length,
            itemBuilder: (context, i) {
              final w = worksheets[i];
              return Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ResponsiveValues.radius(context, 12)),
                ),
                child: ListTile(
                  title: Text(
                    w.title ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveValues.font(context, 17),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${w.type ?? "-"}'),
                      Text('Unit ID: ${w.unitId ?? "-"}'),
                      Text('Lesson ID: ${w.lessonId ?? "-"}'),
                      Text('Created: ${w.createdAt ?? "-"}'),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WorksheetDetailsTeacherPage(worksheetId: w.id!),
                      ),
                    );
                  },

                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade700,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddWorksheetTeacherPage(classId: widget.classId),
            ),
          );
        },
      ),

    );
  }
}
