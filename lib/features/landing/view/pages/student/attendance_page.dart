import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/controllers/attendance_controller.dart';
import 'package:telmeeth/core/api/controllers/website_activity_controller.dart';
import 'package:telmeeth/core/api/model/response/interactive.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';

import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

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

  // أول مرة جلب بيانات الموقع أو الحضور حسب القيمة الافتراضية
  fetchDataForSelected();

  // الاستماع لأي تغيير على selector
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
      appBar: const StudentAppBar(),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Attendance Records',
                          style: TextStyle(
                            fontSize: context.w(5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: context.w(0.9)),
                        const Icon(Icons.video_camera_back, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: context.h(1)),
                    Text(
                      'Track your attendance in classes and your activity on the website',
                      style: TextStyle(fontSize: context.w(3)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(2)),

              // --- Selector: نشاط الموقع / حضور الفصل ---
              attendanceSelector(context, selected),
              SizedBox(height: context.h(2)),

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
      return Text("No website activity found");
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

        return FilterContainer(
          width: width,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(act["type"], style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("Total: ${actData.total}"),
              Text("Attended: ${actData.attended}"),
              Text("Rate: ${actData.attendanceRate}%"),
            ],
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
                            height: context.h(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('📅', style: TextStyle(fontSize: context.w(5))),
                                SizedBox(height: context.h(1)),
                                Text(
                                  'No attendance records were found for the classes.',
                                  style: TextStyle(fontSize: context.w(3)),
                                ),
                              ],
                            ),
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _attendanceBox(context, "Total Days", attendanceData.totalDays ?? 0),
                            _attendanceBox(context, "Attended", attendanceData.attendedDays ?? 0),
                            _attendanceBox(context, "Absent", attendanceData.absencesCount ?? 0),
                          ],
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8)),
          child: const NavigationBarPrimary(),
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: context.w(8), vertical: context.h(2)),
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : Colors.white,
              borderRadius: BorderRadius.circular(context.h(1.5)),
              border: Border.all(color: Colors.orangeAccent, width: 2),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  // --- كرت فردي للحضور ---
  Widget _attendanceBox(BuildContext context, String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: context.w(4),
            fontWeight: FontWeight.bold,
            color: const Color(0xFF264566),
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget buildActivityCard(String type, Interactive data) {
  return FilterContainer(
    width: MediaQuery.sizeOf(context).width,
    height: context.h(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Total: ${data.total}"),
        Text("Attended: ${data.attended}"),
        Text("Rate: ${data.attendanceRate}%"),
      ],
    ),
  );
}

}
