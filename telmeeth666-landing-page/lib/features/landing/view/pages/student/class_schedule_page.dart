import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/controllers/time_table_controller.dart';
import 'package:telmeeth/core/api/student/model/response/time_table_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:provider/provider.dart';

class ClassSchedule extends StatefulWidget {
  const ClassSchedule({super.key});

  @override
  State<ClassSchedule> createState() => _ClassScheduleState();
}

class _ClassScheduleState extends State<ClassSchedule> {
  // ========== Days & Times ==========
  final Map<String, String> dayMap = {
    'sun': 'Sunday',
    'mon': 'Monday',
    'tue': 'Tuesday',
    'wed': 'Wednesday',
    'thu': 'Thursday',
  };

  final Map<String, String> timeMap = {
    '08:00:00': '1:30-2:15',
    '08:45:00': '2:30-3:15',
    '09:30:00': '3:30-4:15',
  };

  // مفاتيح البيانات من السيرفر
  List<String> get dayKeys => dayMap.keys.toList();      // ["sun", "mon", ...]
  List<String> get timeKeys => timeMap.keys.toList();    // ["08:00:00", ...]

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TimeTableController>().getTimeTable();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF6F2EC),
      body: Consumer<TimeTableController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final model = controller.tableModel;
          final scheduleMap = _buildScheduleMap(model?.data ?? []);

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? context.w(1.7) : context.w(5),
                vertical: isMobile ? context.h(0.7) : context.h(1.4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(context, isMobile, model?.student),
                  SizedBox(height: context.h(1.2)),
                  _tableBox(context, isMobile, scheduleMap),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= HEADER =================
  Widget _header(BuildContext context, bool isMobile, String? student) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? context.w(2.4) : context.w(4.3),
        vertical: isMobile ? context.h(0.9) : context.h(1.4),
      ),
      margin: EdgeInsets.only(bottom: context.h(1)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFB375), Color(0xFFFFA962)],
        ),
        borderRadius: BorderRadius.circular(context.h(1.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                padding: EdgeInsets.all(context.w(1.4)),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF6E0),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.calendar_month,
                    color: const Color(0xFFFFA962), size: context.w(4.3)),
              ),
              SizedBox(width: context.w(1.9)),
              Text(
                'My Timetable',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? context.w(3.2) : context.w(4.1),
                  color: Colors.white,
                ),
              ),
            ]),
            SizedBox(height: context.h(0.6)),
            Text(
              student ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: context.w(2.6),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  // ================= TABLE BOX =================
  Widget _tableBox(BuildContext context, bool isMobile,
      Map<String, Map<String, Data>> scheduleMap) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? context.w(0.4) : context.w(1.9),
        vertical: isMobile ? context.h(0.6) : context.h(1.4),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: _buildTimetable(context, isMobile, scheduleMap),
    );
  }

  // ================= TABLE =================
  Widget _buildTimetable(BuildContext context, bool isMobile,
      Map<String, Map<String, Data>> scheduleMap) {
    final cellFontSize = isMobile ? context.w(2.8) : context.w(2.8);
    final headerFontSize = isMobile ? context.w(2.8) : context.w(3.6);
    final cellHeight = isMobile ? context.h(6) : context.h(5);
    final minCellWidth = isMobile ? context.w(22) : context.w(15); // <<< مريح لكل حجم شاشة

    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minCellWidth * (dayKeys.length + 1),
            // +1 للعمود الأول (الوقت)
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(color: const Color(0xFFE2E8F0), width: 1),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                for (int i = 0; i <= dayKeys.length; i++)
                  i: FixedColumnWidth(minCellWidth)
              },
              children: [
                // Header Row
                TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFFFF6E0)),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(context.w(2.5)),
                      child: Text('Time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: headerFontSize)),
                    ),
                    ...dayKeys.map(
                          (d) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.h(1), horizontal: context.w(1.2)),
                        child: Text(
                          dayMap[d] ?? d,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: headerFontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                // Data Rows
                ...timeKeys.map((timeKey) {
                  return TableRow(
                    children: [
                      // Time Column
                      Padding(
                        padding: EdgeInsets.all(context.w(2)),
                        child: Text(
                          timeMap[timeKey] ?? timeKey,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: cellFontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Day Columns
                      ...dayKeys.map((dayKey) {
                        final item = scheduleMap[dayKey]?[timeKey];
                        return GestureDetector(
                          onTap: item == null ? null : () => _showDetails(context, item),
                          child: Container(
                            height: cellHeight,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: context.w(1.2)),
                            child: Text(
                              item?.subjectNameAr ?? '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: cellFontSize,
                                color: item == null
                                    ? Colors.grey
                                    : const Color(0xFF264566),
                                fontWeight: item == null
                                    ? FontWeight.normal
                                    : FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // ================= DETAILS DIALOG =================
  void _showDetails(BuildContext context, Data d) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Class Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info("Day", d.day),
            _info("Time", d.classTime),
            _info("Subject", d.subjectNameAr),
            _info("Teacher", d.teacherNameAr),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("Close")),
        ],
      ),
    );
  }

  Widget _info(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value ?? '-')),
        ],
      ),
    );
  }

  // ================= MAP BUILDER =================
 Map<String, Map<String, Data>> _buildScheduleMap(List<Data> list) {
  final map = <String, Map<String, Data>>{};
  for (final d in list) {
    map.putIfAbsent(d.day!, () => {});
    map[d.day]![d.classTime!] = d;
  }
  return map;
}

}
