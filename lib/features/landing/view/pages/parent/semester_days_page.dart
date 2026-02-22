import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/branches_controllers.dart';
import 'package:telmeeth/core/api/parent/controllers/semester_days_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/semester_days_model.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class SemesterDaysPage extends StatefulWidget {
  final int studentId;

  const SemesterDaysPage({
    super.key,
    required this.studentId,
  });

  @override
  State<SemesterDaysPage> createState() =>
      _SemesterDaysPageState();
}

class _SemesterDaysPageState extends State<SemesterDaysPage> {

  @override
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<SemesterDaysController>()
          .fetchSemesterDays(widget.studentId); // ✅ الصح
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 HEADER
            _header(context),

            SizedBox(height: context.h(3)),

            Expanded(
              child: Consumer<SemesterDaysController>(
                builder: (context, controller, _) {

                  if (controller.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (controller.error != null) {
                    return Center(
                      child: Text(
                        controller.error!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: context.font(13),
                        ),
                      ),
                    );
                  }

                  final data = controller.semesterDaysModel?.data;

                  if (data == null) {
                    return _emptyState(context);
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [

                        _infoCard(
                          context,
                          icon: Icons.school,
                          title: data.school?.nameAr ?? "School",
                          subtitle: data.branch?.nameAr ?? "",
                        ),

                        SizedBox(height: context.h(2)),

                        _semesterCard(context, data.semester),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================

  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(context.radius(25)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.shadowBlur(18),
            offset: Offset(0, context.shadowOffsetY(6)),
            color: AppColors.primary.withOpacity(0.35),
          ),
        ],
      ),
      child: Row(
        children: [

          /// ICON CIRCLE
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: context.icon(28),
            ),
          ),

          SizedBox(width: context.w(4)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Semester Overview",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(18),
                  ),
                ),
                SizedBox(height: context.h(0.5)),
                Text(
                  "Track semester duration and off days",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: context.font(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= SCHOOL CARD =================

  Widget _infoCard(BuildContext context,
      {required IconData icon,
        required String title,
        required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          SizedBox(width: context.w(3)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.font(14))),
                Text(subtitle,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: context.font(12))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= SEMESTER CARD =================

  Widget _semesterCard(BuildContext context, Semester? semester) {

    if (semester == null) {
      return _emptyState(context);
    }

    return Container(
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _row(context, "Start Date",
              semester.startDate?.toLocal().toString().split(" ")[0]),

          SizedBox(height: context.h(1.5)),

          _row(context, "End Date",
              semester.endDate?.toLocal().toString().split(" ")[0]),

          SizedBox(height: context.h(1.5)),

          _row(context, "Off Days",
              semester.offDays?.toString()),

        ],
      ),
    );
  }

  Widget _row(BuildContext context, String title, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: context.font(13))),
        Text(value ?? "-",
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: context.font(13))),
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            size: 60,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: context.h(2)),
          Text(
            "Semester has not been set yet",
            style: TextStyle(
              fontSize: context.font(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.h(1)),
          Text(
            "Please contact school administration",
            style: TextStyle(
              fontSize: context.font(11),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }}