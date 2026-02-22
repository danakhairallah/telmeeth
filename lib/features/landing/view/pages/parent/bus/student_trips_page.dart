import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/bus_controller.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class StudentTripsPage extends StatefulWidget {
  final int studentId;
  const StudentTripsPage({super.key, required this.studentId});

  @override
  State<StudentTripsPage> createState() => _StudentTripsPageState();
}

class _StudentTripsPageState extends State<StudentTripsPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<BusController>().fetchStudentTrips(widget.studentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(5)),
        child: Column(
          children: [

            /// Header
            _header(context),

            SizedBox(height: context.h(3)),

            Expanded(
              child: Consumer<BusController>(
                builder: (context, controller, _) {
                  if (controller.isTripsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  final trips = controller.tripsModel?.trips ?? [];

                  if (trips.isEmpty) {
                    return Center(
                      child: Text("No Trips Available",
                          style: TextStyle(
                              fontSize: context.font(14))),
                    );
                  }

                  return ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: context.h(2)),
                        padding: EdgeInsets.all(context.w(4)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(
                              context.radius(20)),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(trip.area ?? "",
                                style: TextStyle(
                                    fontSize:
                                    context.font(14),
                                    fontWeight:
                                    FontWeight.bold)),
                            SizedBox(height: context.h(1)),
                            Text("Start: ${trip.startTime}"),
                            Text("Seat: ${trip.seatNumber}"),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Icon
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.directions_bus,
              color: Colors.white,
              size: context.icon(26),
            ),
          ),

          SizedBox(width: context.w(4)),

          /// Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Student Trips",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(17),
                  ),
                ),

                SizedBox(height: context.h(0.6)),

                Text(
                  "View assigned bus trips, pickup areas, and seat details",
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
  }}