import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/teacher_report_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/teacher_report_model.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class TeacherReportPage extends StatefulWidget {
  final int studentId;
  const TeacherReportPage({super.key, required this.studentId});

  @override
  State<TeacherReportPage> createState() =>
      _TeacherReportPageState();
}

class _TeacherReportPageState
    extends State<TeacherReportPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TeacherReportController>()
            .getReports(widget.studentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            /// 🔥 HEADER
            _header(context),

            SizedBox(height: context.h(3)),

            Expanded(
              child:
              Consumer<TeacherReportController>(
                builder: (context, controller, _) {

                  if (controller.isLoading) {
                    return Center(
                      child:
                      CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (controller.errorMessage !=
                      null) {
                    return _errorState(
                        context,
                        controller.errorMessage!);
                  }

                  final reports =
                      controller.reportModel?.data ??
                          [];

                  if (reports.isEmpty) {
                    return _emptyState(context);
                  }

                  return ListView.builder(
                    itemCount: reports.length,
                    itemBuilder:
                        (context, index) =>
                        _reportCard(
                            context,
                            reports[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= HEADER =================

  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:
        BorderRadius.circular(context.radius(25)),
        boxShadow: [
          BoxShadow(
            blurRadius: context.shadowBlur(18),
            offset:
            Offset(0, context.shadowOffsetY(6)),
            color:
            AppColors.primary.withOpacity(0.35),
          ),
        ],
      ),
      child: Row(
        children: [

          /// 🔹 ICON CIRCLE (نفس الباص)
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.description,
              color: Colors.white,
              size: context.icon(28),
            ),
          ),

          SizedBox(width: context.w(4)),

          /// 🔹 TEXT
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  "Teacher Reports",
                  style: TextStyle(
                    fontSize: context.font(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: context.h(0.5)),
                Text(
                  "Daily performance feedback",
                  style: TextStyle(
                    fontSize: context.font(12),
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  /// ================= CARD =================

  Widget _reportCard(
      BuildContext context, Data report) {
    return Container(
      margin: EdgeInsets.only(
          bottom: context.h(2)),
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
            context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(.04),
            blurRadius: 12,
            offset:
            const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// SUBJECT + TIME
          Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            children: [
              Text(
                report.subject?.nameEn ??
                    report.subject
                        ?.nameAr ??
                    "-",
                style: TextStyle(
                  fontSize:
                  context.font(15),
                  fontWeight:
                  FontWeight.bold,
                  color:
                  AppColors.primary,
                ),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(
                  horizontal:
                  context.w(3),
                  vertical:
                  context.h(.5),
                ),
                decoration:
                BoxDecoration(
                  color: AppColors
                      .primary
                      .withOpacity(.1),
                  borderRadius:
                  BorderRadius
                      .circular(
                      30),
                ),
                child: Text(
                  report.classTime ??
                      "",
                  style: TextStyle(
                    fontSize:
                    context
                        .font(
                        11),
                    color: AppColors
                        .primary,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height:
          context.h(1)),

          /// TEACHER
          Text(
            "Teacher: ${report.teacher?.nameEn ?? report.teacher?.nameAr ?? ''}",
            style: TextStyle(
              fontSize:
              context.font(12),
              color: Colors
                  .grey.shade600,
            ),
          ),

          SizedBox(height:
          context.h(1.2)),

          /// TEXT
          Text(
            report.text ?? "",
            style: TextStyle(
              fontSize:
              context.font(13),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= STATES =================

  Widget _emptyState(
      BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize:
        MainAxisSize.min,
        children: [
          Icon(Icons
              .assignment_outlined,
              size: 60,
              color: Colors
                  .grey.shade400),
          SizedBox(height:
          context.h(2)),
          Text(
            "No reports available",
            style: TextStyle(
                fontSize:
                context
                    .font(
                    14)),
          ),
        ],
      ),
    );
  }

  Widget _errorState(
      BuildContext context,
      String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: Colors.red,
          fontSize:
          context.font(13),
        ),
      ),
    );
  }
}