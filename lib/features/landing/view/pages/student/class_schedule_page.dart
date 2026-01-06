import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class ClassSchedule extends StatelessWidget {
  ClassSchedule({super.key});

  final List<String> days = [
    'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'
  ];
  final List<String> slots = [
    '1:30-2:15', // new slot 1
    '2:30-3:15', // new slot 2
    '3:30-4:15',
    '4:15-5:00',
    '5:15-6:00',
    '6:15-7:00',
    '7:15-8:00',
  ];
  final Map<String, List<String>> scheduleVertical = {
    'Sunday':    ['History', 'Math', '', '', '', '', ''],
    'Monday':    ['Math', 'Science', '', 'Math', '', 'English', ''],
    'Tuesday':   ['Physics', '', 'Physics', '', '', '', ''],
    'Wednesday': ['Biology', '', '', '', '', '', ''],
    'Thursday':  ['', '', '', '', '', '', 'Break'],
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF6F2EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(1.7) : context.w(5), vertical: isMobile ? context.h(0.7) : context.h(1.4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.4) : context.w(4.3), vertical: isMobile ? context.h(0.9) : context.h(1.4)),
                margin: EdgeInsets.only(bottom: context.h(1)),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFB375), Color(0xFFFFA962)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(context.h(1.4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(context.w(1.4)),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFF6E0),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.calendar_month, color: Color(0xFFFFA962), size: context.w(4.3)),
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
                          ],
                        ),
                        SizedBox(height: context.h(0.6)),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.white, size: context.w(3.1)),
                            SizedBox(width: context.w(1.2)),
                            Text(
                              "Mohammad Ahmad Ali",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? context.w(2.5) : context.w(2.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Total Classes",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: isMobile ? context.w(2) : context.w(2.6),
                          ),
                        ),
                        SizedBox(height: context.h(0.6)),
                        Container(
                          width: isMobile ? context.w(5.5) : context.w(8.7),
                          height: isMobile ? context.h(2.5) : context.h(3.9),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(context.h(1.2)),
                          ),
                          child: Center(
                            child: Text(
                              '7',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? context.w(3) : context.w(4.3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Timetable Box
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: context.h(0.2), bottom: context.h(1.5)),
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
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: _buildTimetableTable(isMobile , context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarPrimary(),
    );
  }

  Widget _buildTimetableTable(bool isMobile , BuildContext context) {
    double cellFontSize = isMobile ? context.w(2.2) : context.w(2.7);
    double headerFontSize = isMobile ? context.w(1.9) : context.w(3);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: const Color(0xFFE2E8F0), width: context.w(0.4)),
        defaultColumnWidth: FixedColumnWidth(isMobile ? context.w(13.8) : context.w(19.4)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          // Header row: Time + Days
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFFFF6E0)),
            children: [
              Padding(
                padding: EdgeInsets.all(context.w(3.6)),
                child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: headerFontSize)),
              ),
              ...days.map((d) => Padding(
                padding: EdgeInsets.all(context.w(1.2)),
                child: Text(
                  d,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: headerFontSize),
                ),
              )),
            ],
          ),
          // Table rows
          ...List.generate(slots.length, (rowIdx) {
            return TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(context.w(1.4)),
                  child: Text(slots[rowIdx], style: TextStyle(fontWeight: FontWeight.bold, fontSize: cellFontSize)),
                ),
                ...days.map((d) {
                  String val = scheduleVertical[d]![rowIdx];
                  return Container(
                    height: isMobile ? context.h(4.5) : context.h(3.6),
                    alignment: Alignment.center,
                    child: Text(
                      val.isEmpty ? '-' : val,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: val == 'Break' ? Colors.orange[600] : const Color(0xFF264566),
                        fontWeight: val == 'Break' ? FontWeight.bold : FontWeight.normal,
                        fontSize: cellFontSize,
                      ),
                    ),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}