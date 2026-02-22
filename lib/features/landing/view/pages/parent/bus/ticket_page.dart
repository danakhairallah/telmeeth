import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/ticket_controller.dart';
import 'package:telmeeth/core/api/parent/model/request/first_ticket_request_model.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class TicketPage extends StatelessWidget {
  final int studentId;
  const TicketPage({super.key, required this.studentId});

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

            _header(context, "Bus Tickets",
                "Create and manage bus tickets",
                Icons.confirmation_number),

            SizedBox(height: context.h(4)),

            Consumer<TicketController>(
              builder: (context, controller, _) {
                return Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize:
                        Size(double.infinity, context.h(6)),
                      ),
                      onPressed: () {
                        controller.createFirstTicket(
                          FirstTicketRequestModel(
                              studentId: studentId),
                        );
                      },
                      child: Text("Create First Ticket",
                          style: TextStyle(
                              fontSize: context.font(14),
                          color: Colors.white)),
                    ),

                    SizedBox(height: context.h(2)),

                    if (controller.isLoading)
                      CircularProgressIndicator(
                          color: AppColors.primary),

                    if (controller.error != null)
                      Padding(
                        padding:
                        EdgeInsets.only(top: context.h(2)),
                        child: Text(controller.error!,
                            style: TextStyle(
                                color: Colors.red)),
                      ),
                  ],
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