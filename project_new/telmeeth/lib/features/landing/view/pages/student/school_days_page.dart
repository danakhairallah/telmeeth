import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student_drawer.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class SchoolDays extends StatelessWidget {
  const SchoolDays({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final isMobile = width < 650;
    final cardSpacing = isMobile ? 7.0 : 13.0;

    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: AppDrawer(),
      backgroundColor: const Color(0xFFF6F2EC),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.all(context.h(0.8)),
        child: NavigationBarPrimary(),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 13 : 18, vertical: isMobile ? 13 : 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 18,
                    vertical: isMobile ? 15 : 13),
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
                        const Icon(
                            Icons.calendar_month, color: Color(0xFF345C8A),
                            size: 23),
                        const SizedBox(width: 2),
                        Text(
                          "School Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 18 : 23,
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
              SizedBox(height: isMobile ? 10 : 12),
              // Stats Cards (Top)
              isMobile
                  ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _statCard(
                          "5", "Working Days", Icons.calendar_today,
                          Color(0xFF17b26a), isMobile)),
                      SizedBox(width: cardSpacing),
                      Expanded(child: _statCard(
                          "2", "Weekend Days", Icons.celebration,
                          Color(0xFFea580c), isMobile)),
                    ],
                  ),
                  SizedBox(height: cardSpacing),
                  Row(
                    children: [
                      Expanded(child: _statCard(
                          "8", "Allowed Absences", Icons.warning_amber_rounded,
                          Color(0xFFeab308), isMobile)),
                      SizedBox(width: cardSpacing),
                      Expanded(child: _statCard(
                          "9", "Allowed Lates", Icons.alarm, Color(0xFFa21caf),
                          isMobile)),
                    ],
                  ),
                ],
              )
                  : Row(
                children: [
                  Expanded(child: _statCard(
                      "5", "Working Days", Icons.calendar_today,
                      Color(0xFF17b26a), isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard(
                      "2", "Weekend Days", Icons.celebration, Color(0xFFea580c),
                      isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard(
                      "8", "Allowed Absences", Icons.warning_amber_rounded,
                      Color(0xFFeab308), isMobile)),
                  SizedBox(width: cardSpacing),
                  Expanded(child: _statCard(
                      "9", "Allowed Lates", Icons.alarm, Color(0xFFa21caf),
                      isMobile)),
                ],
              ),
              SizedBox(height: isMobile ? 12 : 12),
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
              SizedBox(height: isMobile ? 12 : 13),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String value, String label, IconData icon, Color color,
      bool isMobile) {
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
          Text(value, style: TextStyle(color: color,
              fontSize: isMobile ? 18.5 : 20,
              fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: isMobile ? 12 : 15,
                  color: color.withOpacity(0.7)),
              const SizedBox(width: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: isMobile ? 9.5 : 11,
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
      margin: EdgeInsets.only(bottom: isMobile ? 12 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 11 : 16, vertical: isMobile ? 8 : 12),
            child: Row(
              children: const [
                Icon(Icons.access_time, color: Colors.white, size: 17),
                SizedBox(width: 6),
                Text("School Timings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13.5)),
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
                _timingRow(
                    "Start Time", "07:30 AM", Icons.wb_sunny, Color(0xFF16a34a),
                    isMobile),
                _timingRow("End Time", "02:30 PM", Icons.location_city,
                    Color(0xFFea580c), isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
      margin: EdgeInsets.only(bottom: isMobile ? 8 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 11 : 16, vertical: isMobile ? 8 : 12),
            child: Row(
              children: const [
                Icon(Icons.groups_2, color: Colors.white, size: 17),
                SizedBox(width: 6),
                Text("Attendance Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13.5)),
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
                _attendanceItem(
                    "Allowed Absences",
                    "8 days",
                    Icons.warning_amber_rounded,
                    Color(0xFFeab308),
                    Color(0xFFfef3c7),
                    Color(0xFFbe6e0e),
                    isMobile),
                _attendanceItem(
                    "Allowed Lates",
                    "9 times",
                    Icons.alarm,
                    Color(0xFFa21caf),
                    Color(0xFFf5e1fa),
                    Color(0xFFa21caf),
                    isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _workingDaysBox(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.09),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: isMobile ? 10 : 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF17b26a), Color(0xFF19b57a)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 11 : 15,
              vertical: isMobile ? 8 : 10,
            ),
            child: Row(
              children: const [
                Icon(Icons.calendar_month, color: Colors.white, size: 17),
                SizedBox(width: 7),
                Text(
                  "Working Days",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11),
                bottomRight: Radius.circular(11),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 11 : 13,
              horizontal: isMobile ? 9 : 14,
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 9,
              children: [
                _dayChip(
                    "Monday", Color(0xFF17b26a), size: isMobile ? 11.5 : 13),
                _dayChip(
                    "Tuesday", Color(0xFF17b26a), size: isMobile ? 11.5 : 13),
                _dayChip(
                    "Wednesday", Color(0xFF17b26a), size: isMobile ? 11.5 : 13),
                _dayChip(
                    "Thursday", Color(0xFF17b26a), size: isMobile ? 11.5 : 13),
                _dayChip(
                    "Friday", Color(0xFF17b26a), size: isMobile ? 11.5 : 13),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dayChip(String text, Color borderColor,
      {Color? bg, double size = 12}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: size * 0.48),
      decoration: BoxDecoration(
        color: bg ?? Colors.white,
        border: Border.all(color: borderColor.withOpacity(0.7), width: 1),
        borderRadius: BorderRadius.circular(15),
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

  Widget _weekendBox(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.09),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: isMobile ? 10 : 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان الأحمر مع الأيقونة
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
              gradient: LinearGradient(
                colors: [Color(0xFFef4444), Color(0xFFdc2626)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 11 : 15,
              vertical: isMobile ? 8 : 10,
            ),
            child: Row(
              children: const [
                Icon(Icons.cancel, color: Colors.white, size: 17),
                SizedBox(width: 7),
                Text(
                  "Weekend / Off Days",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          // البوكس الأبيض مع أيام العطل
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11),
                bottomRight: Radius.circular(11),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 11 : 13,
              horizontal: isMobile ? 9 : 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weekly Off Days
                const Text(
                  "Weekly Off Days:",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: Color(0xFFb91c1c),
                  ),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: 9,
                  children: [
                    _dayChip("Saturday", Color(0xFFdc2626), bg: Color(0xFFf9cccc), size: isMobile ? 11.5 : 13),
                    _dayChip("Sunday", Color(0xFFdc2626), bg: Color(0xFFf9cccc), size: isMobile ? 11.5 : 13),
                  ],
                ),
                const SizedBox(height: 10),
                // Semester Off Days
                const Text(
                  "Semester Off Days:",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: Color(0xFFb91c1c),
                  ),
                ),
                const SizedBox(height: 5),
                _dayChip("Day 3", Color(0xFFb45309), bg: Color(0xFFfef3c7), size: isMobile ? 11.5 : 13),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _timingRow(String label, String time, IconData icon,
      Color iconColor, bool isMobile) {
    return Row(
      children: [
        Container(
          //width: isMobile ? 165 : 190,
          constraints: BoxConstraints(
            maxWidth: isMobile ? 315 : 210,),
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 15 : 13, vertical: isMobile ? 9 : 8),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: isMobile ? 13 : 16),
              const SizedBox(width: 5),
              Text(label, style: TextStyle(fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 10 : 12,
                  color: Color(0xFF222f41))),
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
        ),
      ],
    );
  }

  static Widget _attendanceItem(String label, String value, IconData icon,
      Color iconColor, Color bg, Color textColor, bool isMobile) {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 315 : 210,),


          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 15 : 13, vertical: isMobile ? 9 : 8),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: isMobile ? 13 : 16),
              const SizedBox(width: 5),
              Text(label, style: TextStyle(fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 10 : 12,
                  color: Color(0xFF222f41))),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 11 : 15,
                  letterSpacing: 0.7,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}