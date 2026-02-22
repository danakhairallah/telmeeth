import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/bus_controller.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class BusTrackingPage extends StatefulWidget {
  final int studentId;
  const BusTrackingPage({super.key, required this.studentId});

  @override
  State<BusTrackingPage> createState() => _BusTrackingPageState();
}

class _BusTrackingPageState extends State<BusTrackingPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<BusController>().fetchBusTracking(widget.studentId));
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

            _header(context, "Live Bus Tracking",
                "Track your child's bus in real time",
                Icons.location_on),

            SizedBox(height: context.h(4)),

            Consumer<BusController>(
              builder: (context, controller, _) {

                if (controller.isTrackingLoading) {
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
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: context.font(13),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                return Center(
                  child: Text(
                    controller.trackingModel?.message ??
                        "No tracking data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.font(14),
                    ),
                  ),
                );
              },
            ),          ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.font(16))),
                SizedBox(height: context.h(0.5)),
                Text(subtitle,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: context.font(12))),
              ],
            ),
          )
        ],
      ),
    );
  }
}