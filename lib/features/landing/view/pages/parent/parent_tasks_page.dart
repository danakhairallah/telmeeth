import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/task_controller.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/parent/parent_worksheet_details_page.dart';

class ParentTasksPage extends StatefulWidget {
  final int studentId;
  const ParentTasksPage({super.key, required this.studentId});

  @override
  State<ParentTasksPage> createState() =>
      _ParentTasksPageState();
}

class _ParentTasksPageState
    extends State<ParentTasksPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TaskControllerParent>()
            .fetchTasks(widget.studentId));
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
              child: Consumer<TaskControllerParent>(
                builder: (context, controller, _) {

                  if (controller.isTasksLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  final tasks =
                      controller.tasksModel?.data ?? [];

                  if (tasks.isEmpty) {
                    return Center(
                        child: Text("No tasks"));
                  }

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder:
                        (context, index) {
                      final task =
                      tasks[index];

                      final isWorksheet =
                          task.type?.toLowerCase() == "worksheet";

                      return InkWell(
                        onTap: () {
                          if (isWorksheet) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ParentWorksheetDetailsPage(
                                  studentId: widget.studentId,
                                  worksheetId: task.id!,
                                ),
                              ),
                            );
                          } else {
                            // مستقبلاً TaskDetailsPage
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: context.h(2)),
                          padding: EdgeInsets.all(context.w(4)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(context.radius(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.05),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              /// TITLE + TYPE BADGE
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      task.title ?? "-",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: context.font(14),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.w(3),
                                      vertical: context.h(.5),
                                    ),
                                    decoration: BoxDecoration(
                                      color: isWorksheet
                                          ? Colors.purple.withOpacity(.1)
                                          : AppColors.primary.withOpacity(.1),
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      task.type ?? "",
                                      style: TextStyle(
                                        fontSize: context.font(10),
                                        color: isWorksheet
                                            ? Colors.purple
                                            : AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: context.h(1)),

                              Text(task.subjectNameAr ?? ""),

                              SizedBox(height: context.h(.5)),

                              Text(
                                "Deadline: ${task.deadline?.toLocal().toString().split(' ')[0] ?? ''}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: context.font(11),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );                    },
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
        borderRadius: BorderRadius.circular(context.radius(25)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.shadowBlur(18),
            offset: Offset(0, context.shadowOffsetY(6)),
            color: AppColors.primary.withOpacity(0.35),
          ),
        ],
      ),
      child: Row(
        children: [

          /// 🔥 ICON CIRCLE
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.assignment_outlined,
              color: Colors.white,
              size: context.icon(28),
            ),
          ),

          SizedBox(width: context.w(4)),

          /// 🔥 TEXT SIDE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(18),
                  ),
                ),

                SizedBox(height: context.h(0.5)),

                Text(
                  "Track your child's assignments and deadlines",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: context.font(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}