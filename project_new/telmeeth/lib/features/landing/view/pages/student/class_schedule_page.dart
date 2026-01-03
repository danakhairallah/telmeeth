import 'package:flutter/material.dart';
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
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 7 : 20, vertical: isMobile ? 7 : 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 18, vertical: isMobile ? 9 : 13),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFB375), Color(0xFFFFA962)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(13),
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
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFF6E0),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.calendar_month, color: Color(0xFFFFA962), size: 18),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'My Timetable',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 13.5 : 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.white, size: 13),
                            const SizedBox(width: 5),
                            Text(
                              "Mohammad Ahmad Ali",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? 10.5 : 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Total Classes",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: isMobile ? 8.5 : 11,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: isMobile ? 23 : 36,
                          height: isMobile ? 23 : 36,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Center(
                            child: Text(
                              '7',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? 12.5 : 18,
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
                margin: const EdgeInsets.only(top: 2, bottom: 14),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 2 : 8,
                  vertical: isMobile ? 6 : 13,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: _buildTimetableTable(isMobile),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarPrimary(),
    );
  }

  Widget _buildTimetableTable(bool isMobile) {
    double cellFontSize = isMobile ? 9.2 : 11.2;
    double headerFontSize = isMobile ? 8.0 : 12.4;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: const Color(0xFFE2E8F0), width: 2),
        defaultColumnWidth: FixedColumnWidth(isMobile ? 57 : 80),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          // Header row: Time + Days
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFFFF6E0)),
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: headerFontSize)),
              ),
              ...days.map((d) => Padding(
                padding: const EdgeInsets.all(5.0),
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
                  padding: const EdgeInsets.all(6.0),
                  child: Text(slots[rowIdx], style: TextStyle(fontWeight: FontWeight.bold, fontSize: cellFontSize)),
                ),
                ...days.map((d) {
                  String val = scheduleVertical[d]![rowIdx];
                  return Container(
                    height: isMobile ? 42 : 33,
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
