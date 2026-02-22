import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/time_table_model_parent.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class TimeTablePage extends StatefulWidget {
  final int studentId;
  const TimeTablePage({super.key, required this.studentId});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TimeTableControllerParent>()
            .getTimeTable(widget.studentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 HEADER
            _header(context),

            SizedBox(height: context.h(3)),

            Expanded(
              child: Consumer<TimeTableControllerParent>(
                builder: (context, controller, _) {

                  if (controller.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  final table =
                      controller.tableModelParent?.data ?? [];

                  if (table.isEmpty) {
                    return Center(
                      child: Text(
                        "No timetable available",
                        style: TextStyle(
                          fontSize: context.font(14),
                        ),
                      ),
                    );
                  }

                  return _buildTable(context, table);
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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:
        BorderRadius.circular(context.radius(25)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.shadowBlur(18),
            offset:
            Offset(0, context.shadowOffsetY(6)),
            color:
            AppColors.primary.withOpacity(0.35),
          ),
        ],
      ),
      child: Row(
        children: [

          /// 🔹 ICON CIRCLE (نفس الستايل الموحد)
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.schedule,
              color: Colors.white,
              size: context.icon(28),
            ),
          ),

          SizedBox(width: context.w(4)),

          /// 🔹 TEXT SIDE
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  "Time Table",
                  style: TextStyle(
                    fontSize: context.font(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: context.h(0.5)),
                Text(
                  "Weekly class schedule overview",
                  style: TextStyle(
                    fontSize: context.font(12),
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTable(
      BuildContext context,
      List<ParentData> data) {

    final days = data.map((e) => e.day ?? "").toSet().toList();
    final times = data.map((e) => e.classTime ?? "").toSet().toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(
          color: Colors.grey.shade300,
        ),
        defaultColumnWidth:
        FixedColumnWidth(context.w(25)),
        children: [

          /// HEADER ROW
          TableRow(
            decoration: BoxDecoration(
              color: AppColors.primary
                  .withOpacity(.1),
            ),
            children: [
              _cell(context, "Time", isHeader: true),
              ...days.map((d) =>
                  _cell(context, d, isHeader: true)),
            ],
          ),

          /// DATA ROWS
          ...times.map((time) {
            return TableRow(
              children: [
                _cell(context, time),

                ...days.map((day) {
                  final lesson = data.firstWhere(
                        (e) =>
                    e.day == day &&
                        e.classTime == time,
                    orElse: () => ParentData(),
                  );

                  return _cell(
                      context,
                      lesson.subjectNameAr ?? "-");
                }),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _cell(BuildContext context,
      String text,
      {bool isHeader = false}) {
    return Container(
      padding: EdgeInsets.all(context.w(2.5)),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight:
          isHeader ? FontWeight.bold : null,
          fontSize: context.font(12),
        ),
      ),
    );
  }
}