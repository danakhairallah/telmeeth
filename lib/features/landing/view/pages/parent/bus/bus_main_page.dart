import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'bus_tracking_page.dart';
import 'student_trips_page.dart';
import 'ticket_page.dart';
import 'walking_time_page.dart';

class BusMainPage extends StatelessWidget {
  final int studentId;
  const BusMainPage({super.key, required this.studentId});

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

            /// 🔥 Header Box
            Container(
              padding: EdgeInsets.all(context.w(5)),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primaryDark,
                  ],
                ),
                borderRadius:
                BorderRadius.circular(context.radius(25)),
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
                  Container(
                    padding: EdgeInsets.all(context.w(3)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.directions_bus,
                        color: Colors.white,
                        size: context.icon(28)),
                  ),
                  SizedBox(width: context.w(4)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text("Bus Services",
                            style: TextStyle(
                                fontSize:
                                context.font(18),
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: context.h(0.5)),
                        Text(
                            "Manage your child's transportation details",
                            style: TextStyle(
                                fontSize:
                                context.font(12),
                                color: Colors.white
                                    .withOpacity(0.9))),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: context.h(4)),

            /// Cards
            _menuCard(context, "Live Tracking",
                Icons.location_on, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              BusTrackingPage(
                                  studentId: studentId)));
                }),

            _menuCard(context, "Trips",
                Icons.directions_bus, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              StudentTripsPage(
                                  studentId: studentId)));
                }),

            _menuCard(context, "Tickets",
                Icons.confirmation_number, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              TicketPage(
                                  studentId: studentId)));
                }),

            _menuCard(context, "Walking Time",
                Icons.timer, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              WalkingTimePage(
                                  studentId: studentId)));
                }),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(2)),
      child: Material(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(context.radius(20)),
        child: InkWell(
          borderRadius:
          BorderRadius.circular(context.radius(20)),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(context.w(4)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                  AppColors.primary.withOpacity(0.1),
                  child: Icon(icon,
                      color: AppColors.primary),
                ),
                SizedBox(width: context.w(4)),
                Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontSize:
                          context.font(14),
                          fontWeight:
                          FontWeight.w600)),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: context.icon(16),
                    color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}