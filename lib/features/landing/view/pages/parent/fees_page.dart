import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/fees_controllers.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class FeesPage extends StatefulWidget {
  final int studentId;
  const FeesPage({super.key, required this.studentId});

  @override
  State<FeesPage> createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPage> {
  String selected = "paid";

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeesController>();

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -------- Tabs ----------
            Container(
              padding: EdgeInsets.all(context.w(1)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.w(4)),
              ),
              child: Row(
                children: [
                  _tab(context, "Paid", "paid"),
                  _tab(context, "Total", "total"),
                  _tab(context, "Remaining", "remaining"),
                ],
              ),
            ),

            SizedBox(height: context.h(2)),

            /// -------- Load Button ----------
            SizedBox(
              width: double.infinity,
              height: context.h(6),
              child: ElevatedButton(
                onPressed: () async {
                  if (selected == "paid") {
                    await controller.fetchFeesPaid(widget.studentId);
                  } else if (selected == "total") {
                    await controller.fetchTotalFees(widget.studentId);
                  } else {
                    await controller.fetchRemainingFees(widget.studentId);
                  }
                },
                child: controller.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Load Data",
                        style: TextStyle(fontSize: context.w(4)),
                      ),
              ),
            ),

            SizedBox(height: context.h(2.5)),

            /// -------- Content ----------
            Expanded(child: _buildContent(context, controller)),
          ],
        ),
      ),
    );
  }

  Widget _tab(BuildContext context, String title, String value) {
    final active = selected == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selected = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: context.h(1.3)),
          decoration: BoxDecoration(
            color: active ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(context.w(3)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: context.w(3.6),
                color: active ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, FeesController controller) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    /// -------- Paid ----------
    if (selected == "paid") {
      final model = controller.feesPaidModel;
      if (model == null || model.payments == null) {
        return const Center(child: Text("No Data"));
      }

      return ListView.builder(
        itemCount: model.payments!.length,
        itemBuilder: (context, index) {
          final p = model.payments![index];
          return Container(
            margin: EdgeInsets.only(bottom: context.h(1.5)),
            padding: EdgeInsets.all(context.w(4)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.w(4)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: context.w(12),
                  height: context.w(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(context.w(3)),
                  ),
                  child: const Icon(Icons.payments, color: Colors.blue),
                ),
                SizedBox(width: context.w(4)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Amount: ${p.amount}",
                          style: TextStyle(
                              fontSize: context.w(4),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: context.h(0.6)),
                      Text("Date: ${p.paymentDate}",
                          style: TextStyle(fontSize: context.w(3.3))),
                      Text("Method: ${p.paymentMethod}",
                          style: TextStyle(fontSize: context.w(3.3))),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    /// -------- Total ----------
    if (selected == "total") {
      final model = controller.totalFeesModel;
      if (model == null) return const Center(child: Text("No Data"));

      return _infoCard(
        context,
        title: model.student?.nameAr ?? "",
        lines: [
          "Grade: ${model.grade?.nameAr}",
          "Total Fees: ${model.totalFees}",
        ],
      );
    }

    /// -------- Remaining ----------
    final model = controller.remainingFeesModel;
    if (model == null) return const Center(child: Text("No Data"));

    return _infoCard(
      context,
      title: model.student?.nameAr ?? "",
      lines: [
        "Total: ${model.totalFees}",
        "Paid: ${model.paid}",
        "Remaining: ${model.remaining}",
      ],
    );
  }

  Widget _infoCard(BuildContext context,
      {required String title, required List<String> lines}) {
    return Container(
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.w(5)),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: context.w(4.5), fontWeight: FontWeight.bold)),
          SizedBox(height: context.h(1.5)),
          ...lines.map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: context.h(0.8)),
              child: Text(e, style: TextStyle(fontSize: context.w(3.7))),
            ),
          )
        ],
      ),
    );
  }
}
