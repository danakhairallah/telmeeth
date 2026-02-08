import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/teacher_report_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/teacher_report_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class TeacherReportPage extends StatefulWidget {
  final int studentId;

  const TeacherReportPage({super.key, required this.studentId});

  @override
  State<TeacherReportPage> createState() => _TeacherReportPageState();
}

class _TeacherReportPageState extends State<TeacherReportPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TeacherReportController>().getReports(widget.studentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FeaturesAppBar(),
      body: Consumer<TeacherReportController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage != null) {
            return Center(
              child: Text(
                controller.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final reports = controller.reportModel?.data ?? [];

          if (reports.isEmpty) {
            return const Center(child: Text("No reports found"));
          }

          // Group by day
          final Map<String, List<Data>> dayMap = {};
          for (var item in reports) {
            if (item.day != null) {
              dayMap.putIfAbsent(item.day!, () => []).add(item);
            }
          }

          return ListView(
            padding: EdgeInsets.all(context.w(4)),
            children: dayMap.entries.map((entry) {
              final day = entry.key;
              final items = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.h(2)),

                  // Day title
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: context.w(4.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: context.h(1)),

                  ...items.map((report) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: context.h(1)),
                      padding: EdgeInsets.all(context.w(3)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(context.w(3)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Subject + time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                report.subject?.nameAr ?? "No subject",
                                style: TextStyle(
                                  fontSize: context.w(4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                report.classTime ?? "",
                                style: TextStyle(
                                  fontSize: context.w(3.2),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: context.h(1)),

                          // Teacher
                          Text(
                            "Teacher: ${report.teacher?.nameAr ?? ''}",
                            style: TextStyle(
                              fontSize: context.w(3.4),
                              color: Colors.grey[700],
                            ),
                          ),

                          SizedBox(height: context.h(1)),

                          // Report text
                          Text(
                            report.text ?? "",
                            style: TextStyle(
                              fontSize: context.w(3.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
