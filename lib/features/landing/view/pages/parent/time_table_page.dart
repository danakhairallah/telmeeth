import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/time_table_model_parent.dart';
import 'package:telmeeth/core/constants/responsive.dart';

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
    // نستدعي ال API مباشرة
    context.read<TimeTableControllerParent>().getTimeTable(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time Table",
          style: TextStyle(fontSize: context.w(4.5)),
        ),
        centerTitle: true,
      ),
      body: Consumer<TimeTableControllerParent>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final table = controller.tableModelParent?.data ?? [];

          if (table.isEmpty) {
            return Center(
              child: Text(
                "No timetable available",
                style: TextStyle(fontSize: context.w(4)),
              ),
            );
          }

          // Group by day
          final Map<String, List<ParentData>> dayMap = {};
for (var item in table) {
  if (item.day != null) {
    dayMap.putIfAbsent(item.day!, () => []).add(item); // نوعه ParentData ✅
  }
}


          return ListView(
            padding: EdgeInsets.all(context.w(4)),
            children: dayMap.entries.map((entry) {
              final day = entry.key;
              final classes = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Day header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: context.h(1),
                      horizontal: context.w(3),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(context.w(2)),
                    ),
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: context.w(4),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),

                  SizedBox(height: context.h(1)),

                  // Classes for the day
                  ...classes.map((cls) => _classCard(context, cls)).toList(),

                  SizedBox(height: context.h(2)),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _classCard(BuildContext context, ParentData cls) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(1.5)),
      padding: EdgeInsets.all(context.w(3.5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.w(4)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.w(1.5),
            offset: Offset(0, context.h(0.3)),
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subject & Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cls.subjectNameAr ?? "-",
                style: TextStyle(
                  fontSize: context.w(4),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cls.classTime ?? "-",
                style: TextStyle(
                  fontSize: context.w(3.5),
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),

          SizedBox(height: context.h(0.8)),

          // Grade & Section
          Text(
            "Grade: ${cls.gradeNameAr ?? "-"} | Section: ${cls.sectionNameAr ?? "-"}",
            style: TextStyle(fontSize: context.w(3.4), color: Colors.grey.shade800),
          ),

          SizedBox(height: context.h(0.5)),

          // Teacher
          Text(
            "Teacher: ${cls.teacherNameAr ?? "-"}",
            style: TextStyle(fontSize: context.w(3.3), color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
