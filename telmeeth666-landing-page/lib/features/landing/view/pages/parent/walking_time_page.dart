import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/walking_time_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class WalkingTimePage extends StatefulWidget {
  final int studentId;

  const WalkingTimePage({super.key, required this.studentId});

  @override
  State<WalkingTimePage> createState() => _WalkingTimePageState();
}

class _WalkingTimePageState extends State<WalkingTimePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<WalkingTimeController>()
          .fetchWalkingTime(widget.studentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Walking Time",
          style: TextStyle(fontSize: context.w(4.5)),
        ),
        centerTitle: true,
      ),
      body: Consumer<WalkingTimeController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final list = controller.walkingTimeModel?.data ?? [];

          if (list.isEmpty) {
            return Center(
              child: Text(
                "No data available",
                style: TextStyle(fontSize: context.w(4)),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(context.w(4)),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];

              return Container(
                margin: EdgeInsets.only(bottom: context.h(2)),
                padding: EdgeInsets.all(context.w(4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.w(4)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: context.w(1.5),
                      offset: Offset(0, context.h(0.3)),
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Student Name
                    Text(
                      item.studentName ?? "Student",
                      style: TextStyle(
                        fontSize: context.w(4.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: context.h(1)),

                    /// Student ID
                    Text(
                      "ID: ${item.studentId ?? '-'}",
                      style: TextStyle(fontSize: context.w(3.5)),
                    ),

                    SizedBox(height: context.h(1)),

                    /// Error from API (if exists)
                    if (item.error != null)
                      Container(
                        padding: EdgeInsets.all(context.w(3)),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(context.w(3)),
                        ),
                        child: Text(
                          item.error!,
                          style: TextStyle(
                            fontSize: context.w(3.4),
                            color: Colors.red,
                          ),
                        ),
                      ),

                    /// Details Error (if exists)
                    if (item.details?.error != null) ...[
                      SizedBox(height: context.h(1)),
                      Container(
                        padding: EdgeInsets.all(context.w(3)),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(context.w(3)),
                        ),
                        child: Text(
                          item.details!.error!,
                          style: TextStyle(
                            fontSize: context.w(3.4),
                            color: Colors.orange.shade800,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
