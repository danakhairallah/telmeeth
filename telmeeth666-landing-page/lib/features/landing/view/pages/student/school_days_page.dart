import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/controllers/school_days_controller.dart';
import 'package:telmeeth/core/api/student/model/response/school_days_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:provider/provider.dart';

class SchoolDays extends StatefulWidget {
  const SchoolDays({super.key});

  @override
  State<SchoolDays> createState() => _SchoolDaysState();
}

class _SchoolDaysState extends State<SchoolDays> {

  @override
  void initState() {
    super.initState();

    /// استدعاء API أول ما تفتح الصفحة
    Future.microtask(() {
      context.read<SchoolDaysController>().getSchoolDays();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;
    final double boxSpacing =
        isMobile ? context.h(1.7) : context.h(2.7);

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF6F2EC),

      body: Consumer<SchoolDaysController>(
        builder: (context, controller, _) {

          /// ================= Loading =================
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          /// ================= Error =================
          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }

          final data = controller.schoolDays?.data;

          if (data == null) {
            return const Center(child: Text("No data available"));
          }

          /// ================= UI =================
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? context.w(2.7) : context.w(5.8),
                vertical: isMobile ? context.h(1.3) : context.h(2.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// ================= Header =================
                  _header(context, isMobile),

                  SizedBox(height: boxSpacing),

                  /// ================= Stats =================
                  isMobile
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _statCard(
                                      "${data.workingDays?.length ?? 0}",
                                      "Working Days",
                                      Icons.calendar_today,
                                      const Color(0xFF17b26a),
                                      isMobile,
                                      context),
                                ),
                                SizedBox(width: boxSpacing),
                                Expanded(
                                  child: _statCard(
                                      "${data.weeklyOffDays?.length ?? 0}",
                                      "Weekend Days",
                                      Icons.celebration,
                                      const Color(0xFFea580c),
                                      isMobile,
                                      context),
                                ),
                              ],
                            ),
                            SizedBox(height: boxSpacing),
                            Row(
                              children: [
                                Expanded(
                                  child: _statCard(
                                      "${data.allowedAbsences ?? 0}",
                                      "Allowed Absences",
                                      Icons.warning_amber_rounded,
                                      const Color(0xFFeab308),
                                      isMobile,
                                      context),
                                ),
                                SizedBox(width: boxSpacing),
                                Expanded(
                                  child: _statCard(
                                      "${data.allowedLates ?? 0}",
                                      "Allowed Lates",
                                      Icons.alarm,
                                      const Color(0xFFa21caf),
                                      isMobile,
                                      context),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                                child: _statCard(
                                    "${data.workingDays?.length ?? 0}",
                                    "Working Days",
                                    Icons.calendar_today,
                                    const Color(0xFF17b26a),
                                    isMobile,
                                    context)),
                            SizedBox(width: boxSpacing),
                            Expanded(
                                child: _statCard(
                                    "${data.weeklyOffDays?.length ?? 0}",
                                    "Weekend Days",
                                    Icons.celebration,
                                    const Color(0xFFea580c),
                                    isMobile,
                                    context)),
                            SizedBox(width: boxSpacing),
                            Expanded(
                                child: _statCard(
                                    "${data.allowedAbsences ?? 0}",
                                    "Allowed Absences",
                                    Icons.warning_amber_rounded,
                                    const Color(0xFFeab308),
                                    isMobile,
                                    context)),
                            SizedBox(width: boxSpacing),
                            Expanded(
                                child: _statCard(
                                    "${data.allowedLates ?? 0}",
                                    "Allowed Lates",
                                    Icons.alarm,
                                    const Color(0xFFa21caf),
                                    isMobile,
                                    context)),
                          ],
                        ),

                  SizedBox(height: boxSpacing),

                  /// ================= Timings & Attendance =================
                  isMobile
                      ? Column(
                          children: [
                            _timingsBox(isMobile, context, data),
                            SizedBox(height: boxSpacing),
                            _attendancePolicyBox(isMobile, context, data),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                                child:
                                    _timingsBox(isMobile, context, data)),
                            SizedBox(width: boxSpacing),
                            Expanded(
                                child: _attendancePolicyBox(
                                    isMobile, context, data)),
                          ],
                        ),

                  SizedBox(height: boxSpacing),

                  /// ================= Working & Off Days =================
                  isMobile
                      ? Column(
                          children: [
                            _workingDaysBox(isMobile, context, data),
                            SizedBox(height: boxSpacing),
                            _weekendBox(isMobile, context, data),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                                child: _workingDaysBox(
                                    isMobile, context, data)),
                            SizedBox(width: boxSpacing),
                            Expanded(
                                child:
                                    _weekendBox(isMobile, context, data)),
                          ],
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= Header =================
  Widget _header(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.7)),
      ),
      child: const Text(
        "School Information",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  // ================= Stat Card =================
  Widget _statCard(String value, String label, IconData icon,
      Color color, bool isMobile, BuildContext context) {
    return Container(
      height: isMobile ? context.h(6) : context.h(7.6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style: TextStyle(
                  color: color,
                  fontSize: context.w(4),
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: context.w(3), color: color),
              SizedBox(width: context.w(1)),
              Text(label),
            ],
          )
        ],
      ),
    );
  }

  // ================= Timings =================
  Widget _timingsBox(bool isMobile, BuildContext context, SchoolDaysData data) {
    return Column(
      children: [
        _timingRow("Start Time", data.startTime ?? "-", context),
        _timingRow("End Time", data.endTime ?? "-", context),
      ],
    );
  }

  Widget _timingRow(String title, String value, BuildContext context) {
    return ListTile(title: Text(title), trailing: Text(value));
  }

  // ================= Attendance =================
  Widget _attendancePolicyBox(bool isMobile, BuildContext context, SchoolDaysData data) {
    return Column(
      children: [
        _timingRow("Allowed Absences", "${data.allowedAbsences ?? 0}", context),
        _timingRow("Allowed Lates", "${data.allowedLates ?? 0}", context),
      ],
    );
  }

  // ================= Working Days =================
  Widget _workingDaysBox(bool isMobile, BuildContext context, SchoolDaysData data) {
    return Wrap(
      spacing: 8,
      children:
          (data.workingDays ?? []).map((e) => Chip(label: Text(e))).toList(),
    );
  }

  // ================= Weekend =================
  Widget _weekendBox(bool isMobile, BuildContext context, SchoolDaysData data) {
    return Wrap(
      spacing: 8,
      children:
          (data.weeklyOffDays ?? []).map((e) => Chip(label: Text(e))).toList(),
    );
  }
}

