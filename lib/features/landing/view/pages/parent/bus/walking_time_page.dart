import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/walking_time_controller.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class WalkingTimePage extends StatefulWidget {
  final int studentId;
  const WalkingTimePage({super.key, required this.studentId});

  @override
  State<WalkingTimePage> createState() =>
      _WalkingTimePageState();
}

class _WalkingTimePageState
    extends State<WalkingTimePage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<WalkingTimeController>()
            .fetchWalkingTime(widget.studentId));
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

            _header(context, "Walking Time",
                "Check walking time details",
                Icons.timer),

            SizedBox(height: context.h(4)),

            Consumer<WalkingTimeController>(
              builder: (context, controller, _) {

                if (controller.isLoading) {
                  return CircularProgressIndicator(
                      color: AppColors.primary);
                }

                final list =
                    controller.walkingTimeModel?.data ?? [];

                if (list.isEmpty) {
                  return Text("No Data Available");
                }

                return Text(
                  list.first.studentName ?? "",
                  style: TextStyle(
                      fontSize: context.font(14)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context,
      String title, String subtitle, IconData icon) {
    return Container(
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(context.radius(25)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: context.w(3)),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.font(16))),
                SizedBox(height: context.h(0.5)),
                Text(subtitle,
                    style: TextStyle(
                        color: Colors.white
                            .withOpacity(0.9),
                        fontSize:
                        context.font(12))),
              ],
            ),
          )
        ],
      ),
    );
  }
}