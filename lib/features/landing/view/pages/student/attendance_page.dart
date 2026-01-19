import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/student/controllers/attendance_controller.dart';
import 'package:telmeeth/core/api/student/controllers/website_activity_controller.dart';
import 'package:telmeeth/core/api/student/model/response/interactive.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';


class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final ValueNotifier<String> selected = ValueNotifier("نشاط الموقع");

  @override
  void initState() {
    super.initState();
    fetchDataForSelected();
    selected.addListener(() {
      fetchDataForSelected();
    });
  }

  void fetchDataForSelected() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    if (token.isEmpty) return;

    if (selected.value == "نشاط الموقع") {
      await context.read<WebsiteActivityController>().getWebsiteActivity();
    } else {
      await context.read<AttendanceController>().getAttendance();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(
                backgroundColor: const Color(0xFFF39F5F),
                padding: EdgeInsets.symmetric(
                    vertical: context.h(1.5), horizontal: context.w(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Attendance Records',
                          style: TextStyle(
                            fontSize: context.w(5.2),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: context.w(1.2)),
                        const Icon(Icons.video_camera_back, color: Colors.white70),
                      ],
                    ),
                    SizedBox(height: context.h(1)),
                    Text(
                      'Track your attendance in classes and your activity on the website',
                      style: TextStyle(fontSize: context.w(3), color: Colors.white.withOpacity(0.93)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(2.2)),

              // --- Selector: نشاط الموقع / حضور الفصل ---
              attendanceSelector(context, selected),
              SizedBox(height: context.h(2.3)),

              // --- بيانات الحضور أو نشاط الموقع ---
              ValueListenableBuilder<String>(
                valueListenable: selected,
                builder: (context, value, _) {
                  if (value == "نشاط الموقع") {
                    // نشاط الموقع
                    return Consumer<WebsiteActivityController>(
                      builder: (context, controller, _) {
                        if (controller.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final activity = controller.websiteActivity?.data;
                        if (activity == null) {
                          return Padding(
                            padding: EdgeInsets.only(top: context.h(4)),
                            child: Text(
                              "No website activity found",
                              style: TextStyle(color: Colors.orange.shade400),
                            ),
                          );
                        }

                        final width = MediaQuery.of(context).size.width;

                        final activities = <Map<String, dynamic>>[
                          {"type": "Interactive", "data": activity.interactive},
                          {"type": "Recorded", "data": activity.recorded},
                          {"type": "Live", "data": activity.live},
                          {"type": "Overall", "data": activity.overall},
                        ];

                        return Column(
                          children: activities.map((act) {
                            final actData = act["data"] as Interactive?;
                            if (actData == null) return const SizedBox.shrink();

                            return Padding(
                              padding: EdgeInsets.only(bottom: context.h(1.3)),
                              child: FilterContainer(
                                width: width,
                                height: context.h(13),
                                color: const Color(0xFFFFF7ED),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            act["type"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange.shade800,
                                                fontSize: context.w(4)),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 6),
                                          Icon(Icons.check_circle_outline,
                                              color: Colors.orange.shade300, size: context.w(5)),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _attendanceStatBox(context, "Total", actData.total ?? 0, Colors.orange.shade200),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _attendanceStatBox(context, "Attended", actData.attended ?? 0, Colors.green.shade100),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _attendanceStatBox(context, "Rate", "${actData.attendanceRate ?? 0}%", Colors.blue.shade50),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    );
                  } else {
                    // حضور الفصل
                    return Consumer<AttendanceController>(
                      builder: (context, controller, _) {
                        if (controller.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final attendanceData = controller.attendance?.data;

                        if (attendanceData == null) {
                          return FilterContainer(
                            width: MediaQuery.sizeOf(context).width,
                            height: context.h(17),
                            color: Colors.blue.shade50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('📅', style: TextStyle(fontSize: context.w(6))),
                                SizedBox(height: context.h(1)),
                                Text(
                                  'No attendance records were found for the classes.',
                                  style: TextStyle(fontSize: context.w(3.5)),
                                ),
                              ],
                            ),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: context.h(0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _attendanceStatBox(
                                context,
                                "Total Days",
                                attendanceData.totalDays ?? 0,
                                Colors.orange.shade200,
                              ),
                              _attendanceStatBox(
                                context,
                                "Attended",
                                attendanceData.attendedDays ?? 0,
                                Colors.green.shade100,
                              ),
                              _attendanceStatBox(
                                context,
                                "Absent",
                                attendanceData.absencesCount ?? 0,
                                Colors.red.shade100,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Selector Widget ---
  Widget attendanceSelector(BuildContext context, ValueNotifier<String> selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOption(context, "نشاط الموقع", selected),
        const SizedBox(width: 10),
        _buildOption(context, "حضور الفصل", selected),
      ],
    );
  }

  Widget _buildOption(BuildContext context, String text, ValueNotifier<String> selected) {
    return ValueListenableBuilder<String>(
      valueListenable: selected,
      builder: (context, value, _) {
        final isSelected = value == text;
        return GestureDetector(
          onTap: () => selected.value = text,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: context.w(8), vertical: context.h(1.5)),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF39F5F) : Colors.white,
              borderRadius: BorderRadius.circular(context.h(1.5)),
              border: Border.all(color: Colors.orangeAccent, width: 2),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.12),
                    blurRadius: 6,
                  )
              ],
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: context.w(3.7),
              ),
            ),
          ),
        );
      },
    );
  }

  /// ---- Box خاص بعرض رقم (متعدد الاستخدام) ----
  Widget _attendanceStatBox(BuildContext context, String label, dynamic value, Color bg) {
    return Container(
      // width: context.w(23), // شيل هذا السطر
      padding: EdgeInsets.symmetric(vertical: context.h(1.3)),
      margin: EdgeInsets.symmetric(horizontal: context.w(0.7)),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: bg.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: bg.withOpacity(0.09),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: TextStyle(
              fontSize: context.w(4.3),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF264566),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: context.h(0.3)),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: context.w(3),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
