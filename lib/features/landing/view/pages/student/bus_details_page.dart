import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/bus_details_controller.dart';


class BusDetailsPage extends StatefulWidget {
  const BusDetailsPage({super.key});

  @override
  State<BusDetailsPage> createState() => _BusDetailsPageState();
}

class _BusDetailsPageState extends State<BusDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BusDetailsController>().loadBusDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusDetailsController>(
      builder: (context, controller, _) {
        if (controller.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (controller.error != null) {
          return Scaffold(
            body: Center(child: Text(controller.error!)),
          );
        }

        final data = controller.response?.data ?? [];

        return Scaffold(
          appBar: AppBar(title: const Text("بيانات باص الطالب")),
          body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final detail = data[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.directions_bus, color: Colors.orange),
                          const SizedBox(width: 10),
                          Text(
                            "جولة: ${detail.round} / المنطقة: ${detail.area}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const Divider(),
                      Text("رقم المقعد: ${detail.seatNumber}"),
                      Text("من: ${detail.startTime}  إلى: ${detail.endTime}"),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.person, color: Colors.blueGrey),
                          const SizedBox(width: 4),
                          Text("السائق: ${detail.driver.nameAr}"),
                          const SizedBox(width: 12),
                          Text("(${detail.driver.phone})"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person_pin_circle, color: Colors.green),
                          const SizedBox(width: 4),
                          Text("المرافق: ${detail.attendant.nameAr}"),
                          const SizedBox(width: 12),
                          Text("(${detail.attendant.phone})"),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
