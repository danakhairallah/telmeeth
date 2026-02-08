import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/streak_controller.dart';
import 'package:telmeeth/core/api/student/model/response/streak_model.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';


class StreakLeaderboardScreen extends StatefulWidget {
  const StreakLeaderboardScreen({super.key});

  @override
  State<StreakLeaderboardScreen> createState() =>
      _StreakLeaderboardScreenState();
}

class _StreakLeaderboardScreenState extends State<StreakLeaderboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StreakController>().getLeaderboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:StudentFeaturesAppBar(),
      body: Consumer<StreakController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.leaderboard == null ||
              controller.leaderboard!.leaderboard == null ||
              controller.leaderboard!.leaderboard!.isEmpty) {
            return const Center(child: Text("No leaderboard data"));
          }

          final grades = controller.leaderboard!.leaderboard!;

          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: ListView.builder(
              padding: EdgeInsets.all(
                ResponsiveValues.padding(context, 16),
              ),
              itemCount: grades.length,
              itemBuilder: (context, index) {
                return _gradeSection(context, grades[index]);
              },
            ),
          );
        },
      ),
    );
  }

  /// ================= Grade Section =================
  Widget _gradeSection(BuildContext context, Leaderboard grade) {
    return Container(
      margin: EdgeInsets.only(
        bottom: ResponsiveValues.padding(context, 20),
      ),
      padding: EdgeInsets.all(
        ResponsiveValues.padding(context, 16),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(ResponsiveValues.radius(context, 18)),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🏫 Grade name
          Text(
            grade.gradeName ?? "Grade",
            style: TextStyle(
              fontSize: ResponsiveValues.font(context, 18),
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: ResponsiveValues.h(context, 2)),

          /// 👩‍🎓 Students
          if (grade.students != null)
            ...grade.students!.asMap().entries.map((entry) {
              final index = entry.key;
              final student = entry.value;
              return _studentRow(context, student, index);
            }).toList(),
        ],
      ),
    );
  }

  /// ================= Student Row =================
  /// ================= Student Row =================
  Widget _studentRow(
      BuildContext context, Students data, int index) {
    final student = data.student;

    return Container(
      margin: EdgeInsets.only(
        bottom: ResponsiveValues.padding(context, 10),
      ),
      padding: EdgeInsets.all(
        ResponsiveValues.padding(context, 12),
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius:
        BorderRadius.circular(ResponsiveValues.radius(context, 12)),
      ),
      child: Row(
        children: [
          // Rank
          CircleAvatar(
            radius: ResponsiveValues.icon(context, 16),
            backgroundColor: Colors.orange,
            child: Text(
              "#${index + 1}",
              style: const TextStyle(color: Colors.white),
            ),
          ),

          SizedBox(width: ResponsiveValues.w(context, 4)),

          // Name
          Expanded(
            child: Text(
              student?.nameAr ??
                  student?.nameEn ??
                  "Student",
              style: TextStyle(
                fontSize: ResponsiveValues.font(context, 15),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // 🔥 Streak
          Row(
            children: [
              const Icon(Icons.local_fire_department, color: Colors.deepOrange),
              SizedBox(width: ResponsiveValues.w(context, 1)),
              Text(
                "${data.currentStreak ?? 0}",
                style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 14),
                ),
              ),
            ],
          ),

          // زر تحديث (Refresh)
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.blueGrey, size: 23),
            tooltip: "تحديث الستريك",
            onPressed: student?.id == null
                ? null
                : () async {
              final controller = Provider.of<StreakController>(context, listen: false);
              final result = await controller.updateStudentStreak(student!.id!);

              // عرض نتيجة التحديث في SnackBar
              if (result != null && result.streak != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("تم تحديث الستريك: ${result.streak}"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("فشل التحديث!"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              // إعادة تحميل الليدربورد
              await controller.refresh();
            },
          ),
        ],
      ),
    );
  }

}