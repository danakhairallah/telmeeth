import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/ai_report_controller.dart';
import 'package:telmeeth/core/api/student/controllers/report_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int selectedTab = 0;

  final Map<int, bool> _deleting = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ReportController>().loadReports();
      context.read<AiReportController>().fetchReports();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF8F3EE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.w(1.9),
            vertical: context.h(1),
          ),
          child: Column(
            children: [
              // HEADER
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(3.1),
                  vertical: context.h(0.7),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("📊", style: TextStyle(fontSize: context.w(6))),
                    SizedBox(width: context.w(2.1)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reports",
                            style: TextStyle(
                              fontSize: context.w(4.3),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF39566C),
                            ),
                          ),
                          SizedBox(height: context.h(0.2)),
                          Text(
                            "View your academic performance and teacher feedback",
                            style: TextStyle(
                              fontSize: context.w(2.4),
                              color: const Color(0xFF7C8A97),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.h(1)),

              // TABS
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(0.9)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      blurRadius: 7,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _tabButton(
                      context,
                      label:
                          "Teacher (${context.watch<ReportController>().teacherReports.length})",
                      icon: Icons.insert_drive_file_outlined,
                      index: 0,
                    ),
                    _tabButton(
                      context,
                      label:
                          "AI (${context.watch<AiReportController>().reports.length})",
                      icon: Icons.auto_awesome_outlined,
                      index: 1,
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.h(0.7)),

              // CONTENT
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.h(1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: selectedTab == 1
                      ? Consumer<AiReportController>(
                          builder: (context, controller, _) {
                            if (controller.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (controller.reports.isEmpty) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "✨",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(height: context.h(0.7)),
                                  Text(
                                    "No AI performance analysis is available at the moment.",
                                    style: TextStyle(
                                      fontSize: context.w(3.4),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF39566C),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.all(context.w(3)),
                              itemCount: controller.reports.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: context.h(0.7)),
                              itemBuilder: (context, index) {
                                final report = controller.reports[index];
                                final deleting = _deleting[report.id] == true;

                                return Container(
                                  padding: EdgeInsets.all(context.w(2.6)),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF5EC),
                                    borderRadius: BorderRadius.circular(
                                      context.h(0.9),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFFFE1C7),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.auto_awesome,
                                            color: const Color(0xFFFFA962),
                                            size: context.w(3.8),
                                          ),
                                          SizedBox(width: context.w(1.2)),
                                          const Expanded(
                                            child: Text(
                                              "AI Performance Report",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: deleting
                                                ? SizedBox(
                                                    width: 22,
                                                    height: 22,
                                                    child:
                                                        CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                        ),
                                                  )
                                                : Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.red[400],
                                                  ),
                                            onPressed: deleting
                                                ? null
                                                : () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) => AlertDialog(
                                                        title: const Text(
                                                          "Delete Report",
                                                        ),
                                                        content: const Text(
                                                          "Are you sure you want to delete this report?",
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                  context,
                                                                ),
                                                            child: const Text(
                                                              "Cancel",
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () async {
                                                              Navigator.pop(
                                                                context,
                                                              ); // إغلاق الـ Alert
                                                              setState(
                                                                () =>
                                                                    _deleting[report
                                                                            .id] =
                                                                        true,
                                                              ); // بداية اللودينغ
                                                              await context
                                                                  .read<
                                                                    AiReportController
                                                                  >()
                                                                  .deleteReport(
                                                                    report.id,
                                                                  );
                                                              setState(
                                                                () => _deleting
                                                                    .remove(
                                                                      report.id,
                                                                    ),
                                                              ); // نهاية اللودينغ
                                                            },
                                                            child: const Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: context.h(0.4)),
                                      Text(
                                        report.report,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      SizedBox(height: context.h(0.3)),
                                      Text(
                                        report.createdAt.toString().substring(
                                          0,
                                          10,
                                        ),
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : Consumer<ReportController>(
                          builder: (context, controller, _) {
                            if (controller.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (controller.teacherReports.isEmpty) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("📄", style: TextStyle(fontSize: 25)),
                                  SizedBox(height: 8),
                                  Text("No teacher reports found"),
                                ],
                              );
                            }
                            return ListView.separated(
                              padding: EdgeInsets.all(context.w(3)),
                              itemCount: controller.teacherReports.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: context.h(0.7)),
                              itemBuilder: (context, index) {
                                final report = controller.teacherReports[index];
                                return Container(
                                  padding: EdgeInsets.all(context.w(2.6)),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F1FF),
                                    borderRadius: BorderRadius.circular(
                                      context.h(0.9),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFD1E6FF),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.insert_drive_file_outlined,
                                            color: Color(0xFF296CF3),
                                            size: context.w(3.8),
                                          ),
                                          SizedBox(width: context.w(1.2)),
                                          Expanded(
                                            child: Text(
                                              "${report.subject?.nameEn ?? 'Subject'} - ${report.teacher?.nameEn ?? ''}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: context.h(0.4)),
                                      Text(
                                        report.text ?? '',
                                        textDirection: TextDirection.ltr,
                                      ),
                                      SizedBox(height: context.h(0.3)),
                                      Text(
                                        report.createdAt.toString(),
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      if (report.attachments != null &&
                                          report.attachments!.isNotEmpty)
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: context.h(0.5),
                                          ),
                                          child: Wrap(
                                            spacing: 10,
                                            children: report.attachments!
                                                .map(
                                                  (file) => Chip(
                                                    label: Text(file),
                                                    avatar: Icon(
                                                      Icons.attachment,
                                                      size: 16,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= TAB BUTTON =================
  Widget _tabButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required int index,
  }) {
    bool selected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFFFF5EC) : Colors.white,
            border: Border(
              bottom: BorderSide(
                color: selected ? const Color(0xFFFFA962) : Colors.transparent,
                width: context.w(0.4),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? const Color(0xFFFFA962) : Colors.blueGrey,
              ),
              SizedBox(width: context.w(0.9)),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }

}
