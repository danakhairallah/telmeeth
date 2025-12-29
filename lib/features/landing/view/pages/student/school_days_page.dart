import 'package:flutter/material.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

class SchoolDays extends StatelessWidget {
  const SchoolDays({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;
    final cardSpacing = isMobile ? 7.0 : 13.0;

    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: const StudentDrawer(),
      backgroundColor: const Color(0xFFF6F2EC),
      bottomNavigationBar: NavigationBarPrimary(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 18, vertical: isMobile ? 5 : 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 18, vertical: isMobile ? 9 : 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.10),
                      blurRadius: 9,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Color(0xFF345C8A), size: 23),
                        const SizedBox(width: 7),
                        Text(
                          "School Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 16 : 23,
                            color: const Color(0xFF264566),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "View school schedule, working days, and attendance policies",
                      style: TextStyle(
                        fontSize: isMobile ? 8.5 : 13,
                        color: Colors.blueGrey[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 6 : 12),
              // Stats Cards (Top)
              isMobile
                  ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _statCard("5", "Working Days", Icons.calendar_today, Color(0xFF17b26a), isMobile)),
                      SizedBox(width: cardSpacing),
                      Expanded(child: _statCard("2", "Weekend Days", Icons.celebration, Color(0xFFea580c), isMobile)),
                    ],
                  ),
                  SizedBox(height: cardSpacing),
                  Row(
                    children: [
                      Expanded(child: _statCard("8", "Allowed Absences", Icons.warning_amber_rounded, Color(0xFFeab308), isMobile)),
                      SizedBox(width: cardSpacing),
                      Expanded(child: _statCard("9", "Allowed Lates", Icons.alarm, Color(0xFFa21caf), isMobile)),
                    ],
                  ),
                ],
              )
                  : Row(
                children: [
                  Expanded(child: _statCard("5", "Working Days", Icons.calendar_today, Color(0xFF17b26a), isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard("2", "Weekend Days", Icons.celebration, Color(0xFFea580c), isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard("8", "Allowed Absences", Icons.warning_amber_rounded, Color(0xFFeab308), isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard("9", "Allowed Lates", Icons.alarm, Color(0xFFa21caf), isMobile)),
                ],
              ),
              SizedBox(height: isMobile ? 7 : 13),
              // School Timings & Attendance Policy
              isMobile
                  ? Column(
                children: [
                  _timingsBox(isMobile),
                  SizedBox(height: cardSpacing),
                  _attendancePolicyBox(isMobile),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _timingsBox(isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _attendancePolicyBox(isMobile)),
                ],
              ),
              SizedBox(height: isMobile ? 7 : 13),
              // Working Days & Off Days
              isMobile
                  ? Column(
                children: [
                  _workingDaysBox(isMobile),
                  SizedBox(height: cardSpacing),
                  _weekendBox(isMobile),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _workingDaysBox(isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _weekendBox(isMobile)),
                ],
              ),
              SizedBox(height: isMobile ? 10 : 16),
            ],
          ),
        ),
      ),
    );
  }

  // Card widget for stats (numbers)
  Widget _statCard(String value, String label, IconData icon, Color color, bool isMobile) {
    return Container(
      height: isMobile ? 55 : 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.09),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 5 : 11, horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: TextStyle(color: color, fontSize: isMobile ? 14.5 : 20, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: isMobile ? 12 : 15, color: color.withOpacity(0.7)),
              const SizedBox(width: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: isMobile ? 8.5 : 11,
                  color: Colors.blueGrey[700],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Timings Card
  Widget _timingsBox(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFF337DFF), Color(0xFF265AE2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.only(bottom: isMobile ? 0 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 11 : 16, vertical: isMobile ? 8 : 12),
            child: Row(
              children: const [
                Icon(Icons.access_time, color: Colors.white, size: 17),
                SizedBox(width: 6),
                Text("School Timings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 11.5)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                _timingRow("Start Time", "07:30 AM", Icons.wb_sunny, Color(0xFF16a34a), isMobile),
                _timingRow("End Time", "02:30 PM", Icons.location_city, Color(0xFFea580c), isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Attendance Policy Card
  Widget _attendancePolicyBox(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFFa21caf), Color(0xFF9333ea)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.only(bottom: isMobile ? 0 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 11 : 16, vertical: isMobile ? 8 : 12),
            child: Row(
              children: const [
                Icon(Icons.groups_2, color: Colors.white, size: 17),
                SizedBox(width: 6),
                Text("Attendance Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 11.5)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                _attendanceItem("Allowed Absences", "8 days", Icons.warning_amber_rounded, Color(0xFFeab308), Color(0xFFfef3c7), Color(0xFFbe6e0e), isMobile),
                _attendanceItem("Allowed Lates", "9 times", Icons.alarm, Color(0xFFa21caf), Color(0xFFf5e1fa), Color(0xFFa21caf), isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Working Days Card
  Widget _workingDaysBox(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFF17b26a), Color(0xFF19b57a)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.only(bottom: isMobile ? 0 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 11 : 16, vertical: isMobile ? 8 : 12),
            child: Row(
              children: const [
                Icon(Icons.calendar_month, color: Colors.white, size: 17),
                SizedBox(width: 6),
                Text("Working Days",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 11.5)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  _dayChip("Monday", Color(0xFF16a34a), size: isMobile ? 10 : 12),
                  _dayChip("Tuesday", Color(0xFF16a34a), size: isMobile ? 10 : 12),
                  _dayChip("Wednesday", Color(0xFF16a34a), size: isMobile ? 10 : 12),
                  _dayChip("Thursday", Color(0xFF16a34a), size: isMobile ? 10 : 12),
                  _dayChip("Friday", Color(0xFF16a34a), size: isMobile ? 10 : 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Weekend/Off Days Card
  Widget _weekendBox(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFFef4444), Color(0xFFdc2626)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.only(bottom: isMobile ? 0 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 11 : 16, vertical: isMobile ? 8 : 12),
            child: Row(
              children: const [
                Icon(Icons.cancel, color: Colors.white, size: 17),
                SizedBox(width: 6),
                Text("Weekend / Off Days",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 11.5)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Weekly Off Days:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xFFb91c1c),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 5,
                    children: [
                      _dayChip("Saturday", Color(0xFFdc2626), bg: Color(0xFFf9cccc), size: isMobile ? 10 : 12),
                      _dayChip("Sunday", Color(0xFFdc2626), bg: Color(0xFFf9cccc), size: isMobile ? 10 : 12),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "Semester Off Days:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xFFb91c1c),
                    ),
                  ),
                  const SizedBox(height: 4),
                  _dayChip("Day 3", Color(0xFFb45309), bg: Color(0xFFfef3c7), size: isMobile ? 10 : 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Timing Row
  static Widget _timingRow(String label, String time, IconData icon, Color iconColor, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 13, vertical: isMobile ? 6 : 8),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: isMobile ? 13 : 16),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: isMobile ? 9 : 12, color: Color(0xFF222f41))),
          const Spacer(),
          Text(
            time,
            style: TextStyle(
                color: iconColor,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 11 : 15,
                letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }

  // Attendance Row
  static Widget _attendanceItem(String label, String value, IconData icon, Color iconColor, Color bg, Color textColor, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 13, vertical: isMobile ? 6 : 8),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: isMobile ? 13 : 16),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: isMobile ? 9 : 12, color: Color(0xFF222f41))),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 11 : 14,
              letterSpacing: 0.7,
            ),
          ),
        ],
      ),
    );
  }

  // Day Chip
  static Widget _dayChip(String text, Color borderColor, {Color? bg, double size = 12}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: size * 0.6),
      decoration: BoxDecoration(
        color: bg ?? borderColor.withOpacity(0.08),
        border: Border.all(color: borderColor.withOpacity(0.8), width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: borderColor,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
