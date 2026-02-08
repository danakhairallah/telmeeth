import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/bus_details_controller.dart';
import 'package:telmeeth/core/api/student/model/response/bus_details_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class BusDetailsPage extends StatelessWidget {
  const BusDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BusDetailsController()..getBusDetails(),
      child: Consumer<BusDetailsController>(
        builder: (context, controller, _) {
          final isLoading = controller.isLoading;
          final busData = controller.busDetails?.data;

          return Scaffold(
            appBar: StudentFeaturesAppBar(),
            body: SafeArea(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : busData == null || busData.isEmpty
                      ? Center(child: Text(controller.errorMessage ?? "No Bus Data"))
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.w(4),
                            vertical: context.h(2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: busData
                                .map(
                                  (bus) => _busCard(context, bus),
                                )
                                .toList(),
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }

  Widget _busCard(BuildContext context, BusData bus) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(2)),
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: context.shadowBlur(8),
            offset: Offset(0, context.shadowOffsetY(2)),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(context, "Area", bus.area ?? "-", Icons.location_city, Colors.blue),
          _infoRow(context, "Round", bus.round ?? "-", Icons.repeat, Colors.orange),
          _infoRow(context, "Start Time", bus.startTime ?? "-", Icons.access_time, Colors.green),
          _infoRow(context, "End Time", bus.endTime ?? "-", Icons.access_time, Colors.red),
          _infoRow(context, "Seat Number", bus.seatNumber?.toString() ?? "-", Icons.event_seat, Colors.purple),
          _infoRow(context, "Driver", bus.driver?.nameAr ?? "-", Icons.person, Colors.teal),
          _infoRow(context, "Driver Phone", bus.driver?.phone ?? "-", Icons.phone, Colors.teal),
          if (bus.attendant != null) ...[
            _infoRow(context, "Attendant", bus.attendant?.nameAr ?? "-", Icons.person_outline, Colors.brown),
            _infoRow(context, "Attendant Phone", bus.attendant?.phone ?? "-", Icons.phone_android, Colors.brown),
          ]
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context, String label, String value, IconData icon, Color iconColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(0.5)),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: context.icon(5)),
          SizedBox(width: context.w(2)),
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.font(3.5),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: context.font(3.3)),
            ),
          ),
        ],
      ),
    );
  }
}
