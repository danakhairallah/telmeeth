import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/attendance_teacher_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class AttendanceOfClassTeacherPage extends StatefulWidget {
  final int classId;
  const AttendanceOfClassTeacherPage({super.key, required this.classId});

  @override
  State<AttendanceOfClassTeacherPage> createState() => _AttendanceOfClassTeacherPageState();
}

class _AttendanceOfClassTeacherPageState extends State<AttendanceOfClassTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<AttendanceTeacherController>().fetchTeacherAttendances()
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<AttendanceTeacherController>();
    final allRecords = ctrl.attendanceList?.teacherAttendanceData ?? [];
    final records = allRecords.where((a) => a.lesson?.unit?.classId == widget.classId).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attendance",
          style: TextStyle(
            fontSize: ResponsiveValues.font(context, 20),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
      ),
      body: ctrl.isLoading
          ? const Center(child: CircularProgressIndicator())
          : records.isEmpty
          ? Center(
        child: Text(
          "No attendance records found",
          style: TextStyle(fontSize: ResponsiveValues.font(context, 15)),
        ),
      )
          : ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, i) {
          final att = records[i];
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: ResponsiveValues.w(context, 4),
              vertical: ResponsiveValues.h(context, 1),
            ),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.orange),
              title: Text(
                att.student?.nameAr ?? "Student",
                style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${att.date ?? '-'}",
                    style: TextStyle(fontSize: ResponsiveValues.font(context, 13)),
                  ),
                  Text(
                    "Status: ${att.isExcused == 1 ? 'Excused' : 'Not Excused'}",
                    style: TextStyle(
                      fontSize: ResponsiveValues.font(context, 13),
                      color: att.isExcused == 1 ? Colors.green : Colors.red,
                    ),
                  ),
                  if (att.notes != null && att.notes!.isNotEmpty)
                    Text(
                      "Notes: ${att.notes}",
                      style: TextStyle(
                        fontSize: ResponsiveValues.font(context, 12),
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
          );
        },
      ),
    );
  }
}
