import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/api/parent/controllers/attendance_parent_controller.dart';

class AttendancePage extends StatefulWidget {
  final int studentId;

  const AttendancePage({super.key, required this.studentId});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AttendanceParentController>(context, listen: false)
          .fetchParentAttendance(widget.studentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceParentController>(
      builder: (context, controller, _) {
        return Scaffold(
          backgroundColor: const Color(0xffF7F8FA),
          appBar: FeaturesAppBar(),
          body: controller.isLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          )
              : controller.attendanceModel?.parentAttendance == null
              ? const Center(child: Text("No attendance data found"))
              : _buildContent(context, controller),
        );
      },
    );
  }

  Widget _buildContent(
      BuildContext context, AttendanceParentController controller) {
    final data = controller.attendanceModel!.parentAttendance!;
    final percentage = data.attendancePercentage ?? 0;

    /// ===== تحديد اللون حسب النسبة =====
    Color progressColor;
    if (percentage >= 85) {
      progressColor = Colors.green;
    } else if (percentage >= 60) {
      progressColor = AppColors.primary;
    } else {
      progressColor = Colors.red;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.w(4)),
      child: Column(
        children: [

          /// ===== HEADER ORANGE CARD =====
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.w(6)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                ],
              ),
              borderRadius: BorderRadius.circular(context.w(6)),
            ),
            child: Column(
              children: [
                Text(
                  data.name ?? "",
                  style: TextStyle(
                    fontSize: context.w(5),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: context.h(3)),

                /// ===== CIRCULAR PROGRESS =====
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircularProgressIndicator(
                        value: (percentage.clamp(0, 100)) / 100,
                        strokeWidth: 10,
                        backgroundColor: Colors.white24,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(progressColor),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "$percentage%",
                          style: TextStyle(
                            fontSize: context.w(5),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Attendance",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: context.h(3)),

          /// ===== STATS CARDS =====
          Row(
            children: [
              _statCard("Total Days", data.totalDays),
              _statCard("Attended", data.attendedDays),
              _statCard("Absent", data.absencesCount),
            ],
          ),

          SizedBox(height: context.h(3)),

          /// ===== ABSENCE DETAILS =====
          if (data.absenceDetails != null &&
              data.absenceDetails!.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.absenceDetails!.length,
              itemBuilder: (context, index) {
                final absence = data.absenceDetails![index];

                final isExcused = absence.isExcused == 1;

                return Container(
                  margin: EdgeInsets.only(bottom: context.h(1.5)),
                  padding: EdgeInsets.all(context.w(4)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(context.w(5)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isExcused
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isExcused
                              ? Icons.check
                              : Icons.close,
                          color:
                          isExcused ? Colors.green : Colors.red,
                        ),
                      ),
                      SizedBox(width: context.w(3)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              absence.date ?? "-",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: context.h(0.5)),
                            Text(absence.notes ?? "-"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _statCard(String title, int? value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Text(
              value?.toString() ?? "0",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }
}