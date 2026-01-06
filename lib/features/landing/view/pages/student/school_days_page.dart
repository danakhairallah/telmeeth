import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class SchoolDays extends StatelessWidget {
  const SchoolDays({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;
    final cardSpacing = isMobile ? context.h(0.7) : context.h(1.4);

    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: AppDrawer(),
      backgroundColor: const Color(0xFFF6F2EC),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: NavigationBarPrimary(),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(0.9) : context.w(4.3), vertical: isMobile ? context.h(0.5) : context.h(1.3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.4) : context.w(4.3), vertical: isMobile ? context.h(0.9) : context.h(1.4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
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
                        Icon(Icons.calendar_month, color: Color(0xFF345C8A), size: context.w(5.5)),
                        SizedBox(width: context.w(1.7)),
                        Text(
                          "School Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? context.w(3.8) : context.w(5.5),
                            color: const Color(0xFF264566),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(0.3)),
                    Text(
                      "View school schedule, working days, and attendance policies",
                      style: TextStyle(
                        fontSize: isMobile ? context.w(2) : context.w(3.1),
                        color: Colors.blueGrey[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? context.h(0.6) : context.h(1.3)),
              // Stats Cards (Top)
              isMobile
                  ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _statCard("5", "Working Days", Icons.calendar_today, Color(0xFF17b26a), isMobile , context)),
                      SizedBox(width: cardSpacing),
                      Expanded(child: _statCard("2", "Weekend Days", Icons.celebration, Color(0xFFea580c), isMobile , context)),
                    ],
                  ),
                  SizedBox(height: cardSpacing),
                  Row(
                    children: [
                      Expanded(child: _statCard("8", "Allowed Absences", Icons.warning_amber_rounded, Color(0xFFeab308), isMobile , context)),
                      SizedBox(width: cardSpacing),
                      Expanded(child: _statCard("9", "Allowed Lates", Icons.alarm, Color(0xFFa21caf), isMobile , context)),
                    ],
                  ),
                ],
              )
                  : Row(
                children: [
                  Expanded(child: _statCard("5", "Working Days", Icons.calendar_today, Color(0xFF17b26a), isMobile , context)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard("2", "Weekend Days", Icons.celebration, Color(0xFFea580c), isMobile , context)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard("8", "Allowed Absences", Icons.warning_amber_rounded, Color(0xFFeab308), isMobile , context)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard("9", "Allowed Lates", Icons.alarm, Color(0xFFa21caf), isMobile , context)),
                ],
              ),
              SizedBox(height: isMobile ? context.h(0.7) : context.h(1.4)),
              // School Timings & Attendance Policy
              isMobile
                  ? Column(
                children: [
                  _timingsBox(isMobile , context),
                  SizedBox(height: cardSpacing),
                  _attendancePolicyBox(isMobile , context),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _timingsBox(isMobile , context)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _attendancePolicyBox(isMobile , context)),
                ],
              ),
              SizedBox(height: isMobile ? context.h(0.7) : context.h(1.4)),
              // Working Days & Off Days
              isMobile
                  ? Column(
                children: [
                  _workingDaysBox(isMobile , context),
                  SizedBox(height: cardSpacing),
                  _weekendBox(isMobile , context),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _workingDaysBox(isMobile , context)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _weekendBox(isMobile , context)),
                ],
              ),
              SizedBox(height: isMobile ? context.h(1) : context.h(1.7)),
            ],
          ),
        ),
      ),
    );
  }

  // Card widget for stats (numbers)
  Widget _statCard(String value, String label, IconData icon, Color color, bool isMobile , BuildContext context) {
    return Container(
      height: isMobile ? context.h(6) : context.h(7.6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.09),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(0.5) : context.h(1.2), horizontal: context.w(1.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: TextStyle(color: color, fontSize: isMobile ? context.w(3.5) : context.w(5), fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: isMobile ? context.w(2.9) : context.w(3.6), color: color.withOpacity(0.7)),
              SizedBox(width: context.w(0.7)),
              Text(
                label,
                style: TextStyle(
                  fontSize: isMobile ? context.w(2) : context.w(2.6),
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
  Widget _timingsBox(bool isMobile , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.h(1)),
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
            padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.6) : context.w(3.8), vertical: isMobile ? context.h(0.8) : context.h(1.3)),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.white, size: context.w(4.1)),
                SizedBox(width: context.w(1.4)),
                Text("School Timings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: context.w(2.7))),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.h(1)),
                bottomRight: Radius.circular(context.h(1)),
              ),
            ),
            child: Column(
              children: [
                _timingRow("Start Time", "07:30 AM", Icons.wb_sunny, Color(0xFF16a34a), isMobile , context),
                _timingRow("End Time", "02:30 PM", Icons.location_city, Color(0xFFea580c), isMobile , context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Attendance Policy Card
  Widget _attendancePolicyBox(bool isMobile , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.h(1)),
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
            padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.6) : context.w(3.8), vertical: isMobile ? context.h(0.8) : context.h(1.3)),
            child: Row(
              children: [
                Icon(Icons.groups_2, color: Colors.white, size: context.w(4.1)),
                SizedBox(width: context.w(1.4)),
                Text("Attendance Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: context.w(2.7))),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.h(1)),
                bottomRight: Radius.circular(context.h(1)),
              ),
            ),
            child: Column(
              children: [
                _attendanceItem("Allowed Absences", "8 days", Icons.warning_amber_rounded, Color(0xFFeab308), Color(0xFFfef3c7), Color(0xFFbe6e0e), isMobile , context),
                _attendanceItem("Allowed Lates", "9 times", Icons.alarm, Color(0xFFa21caf), Color(0xFFf5e1fa), Color(0xFFa21caf), isMobile , context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Working Days Card
  Widget _workingDaysBox(bool isMobile , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.h(1)),
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
            padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.6) : context.w(3.8), vertical: isMobile ? context.h(0.8) : context.h(1.3)),
            child: Row(
              children: [
                Icon(Icons.calendar_month, color: Colors.white, size: context.w(4.1)),
                SizedBox(width: context.w(1.4)),
                Text("Working Days",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: context.w(2.7))),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.h(1)),
                bottomRight: Radius.circular(context.h(1)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(context.w(1.9)),
              child: Wrap(
                spacing: context.h(6),
                runSpacing: context.w(0.9),
                children: [
                  _dayChip("Monday", Color(0xFF16a34a),context, size: isMobile ? context.w(2.4) : context.w(2.9)),
                  _dayChip("Tuesday", Color(0xFF16a34a),context, size: isMobile ? context.w(2.4) : context.w(2.9)),
                  _dayChip("Wednesday", Color(0xFF16a34a),context, size: isMobile ? context.w(2.4) : context.w(2.9)),
                  _dayChip("Thursday", Color(0xFF16a34a),context, size: isMobile ? context.w(2.4) : context.w(2.9)),
                  _dayChip("Friday", Color(0xFF16a34a),context, size: isMobile ? context.w(2.4) : context.w(2.9)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Weekend/Off Days Card
  Widget _weekendBox(bool isMobile , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.h(1)),
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
            padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.6) : context.w(3.8), vertical: isMobile ? context.h(0.8) : context.h(1.3)),
            child: Row(
              children: [
                Icon(Icons.cancel, color: Colors.white, size: context.w(4.1)),
                SizedBox(width: context.w(1.4)),
                Text("Weekend / Off Days",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: context.w(2.7))),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.h(1)),
                bottomRight: Radius.circular(context.h(1)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(context.w(1.9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weekly Off Days:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: context.w(2.4),
                      color: Color(0xFFb91c1c),
                    ),
                  ),
                  SizedBox(height: context.h(0.4)),
                  Wrap(
                    spacing: context.h(0.5),
                    children: [
                      _dayChip("Saturday", Color(0xFFdc2626),context, bg: Color(0xFFf9cccc), size: isMobile ? context.w(2.4) : context.w(2.9)),
                      _dayChip("Sunday", Color(0xFFdc2626),context, bg: Color(0xFFf9cccc), size: isMobile ? context.w(2.4) : context.w(2.9)),
                    ],
                  ),
                  SizedBox(height: context.h(0.7)),
                  Text(
                    "Semester Off Days:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: context.w(2.4),
                      color: Color(0xFFb91c1c),
                    ),
                  ),
                  SizedBox(height: context.h(0.4)),
                  _dayChip("Day 3", Color(0xFFb45309),context, bg: Color(0xFFfef3c7), size: isMobile ? context.w(2.4) : context.w(2.9)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Timing Row
  static Widget _timingRow(String label, String time, IconData icon, Color iconColor, bool isMobile , BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(1.9) : context.w(3.1), vertical: isMobile ? context.h(0.6) : context.h(0.8)),
      margin: EdgeInsets.symmetric(vertical: context.h(0.2)),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(context.h(0.9)),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: isMobile ? context.w(3.1) : context.w(3.8)),
          SizedBox(width: context.w(1.2)),
          Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: isMobile ? context.w(2.1) : context.w(2.9), color: Color(0xFF222f41))),
          Spacer(),
          Text(
            time,
            style: TextStyle(
                color: iconColor,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? context.w(2.6) : context.w(3.6),
                letterSpacing: context.w(0.2)),
          ),
        ],
      ),
    );
  }

  // Attendance Row
  static Widget _attendanceItem(String label, String value, IconData icon, Color iconColor, Color bg, Color textColor, bool isMobile , BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(1.9) : context.w(3.1), vertical: isMobile ? context.h(0.6) : context.h(0.8)),
      margin: EdgeInsets.symmetric(vertical: context.h(0.2)),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(context.h(0.9)),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: isMobile ? context.w(3.1) : context.w(3.8)),
          SizedBox(width: context.w(1.2)),
          Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: isMobile ? context.w(2.1) : context.w(2.9), color: Color(0xFF222f41))),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? context.w(2.6) : context.w(3.4),
              letterSpacing: context.w(0.17),
            ),
          ),
        ],
      ),
    );
  }

  // Day Chip
  static Widget _dayChip(String text, Color borderColor, BuildContext context, {Color? bg, double size = 12}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: size * 0.6),
      decoration: BoxDecoration(
        color: bg ?? borderColor.withOpacity(0.08),
        border: Border.all(color: borderColor.withOpacity(0.8), width: context.w(0.2)),
        borderRadius: BorderRadius.circular(context.h(1.5)),
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