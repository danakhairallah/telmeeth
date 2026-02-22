import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/fees_controllers.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
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
  void initState() {
    super.initState();
    Future.microtask(() async {
      final c = context.read<FeesController>();
      await c.fetchTotalFees(widget.studentId);
      await c.fetchRemainingFees(widget.studentId);
      await c.fetchFeesPaid(widget.studentId);
    });
  }

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<FeesController>();

    final total = int.tryParse(
        controller.totalFeesModel?.totalFees?.toString() ?? "0"
    ) ?? 0;

    final remaining =
        controller.remainingFeesModel?.remaining ?? 0;

    final payments =
        controller.feesPaidModel?.payments ?? [];

    final paid = (total - remaining).clamp(0, total);

    final progress =
    total == 0 ? 0.0 : (paid / total).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: FeaturesAppBar(),
      body: controller.isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          children: [

            /// HEADER
            _buildHeader(progress, total, paid, remaining),

            SizedBox(height: context.h(3)),

            /// TABS
            _tabs(context),

            SizedBox(height: context.h(2)),

            /// CONTENT
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: selected == "paid"
                  ? _buildPayments(context, payments)
                  : selected == "total"
                  ? _buildTotalCard(context, total)
                  : _buildRemainingCard(context, remaining),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double progress, int total, int paid, int remaining) {
    return Container(
      padding: EdgeInsets.all(context.w(6)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(context.w(6)),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: context.w(20),
                height: context.w(20),
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                ),
              ),
              Text(
                "${(progress * 100).toStringAsFixed(0)}%",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(width: context.w(6)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Fees Overview",
                    style: TextStyle(color: Colors.white70)),
                SizedBox(height: context.h(1)),
                _money("Total", total),
                _money("Paid", paid),
                _money("Remaining", remaining),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _money(String title, int amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text("$amount JD",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _tabs(BuildContext context) {
    return Row(
      children: [
        _tab(context, "Paid", "paid"),
        _tab(context, "Total", "total"),
        _tab(context, "Remaining", "remaining"),
      ],
    );
  }

  Widget _tab(BuildContext context, String title, String value) {
    final active = selected == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selected = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: context.h(1.4)),
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(context.w(4)),
            boxShadow: active
                ? [
              BoxShadow(
                  color: AppColors.primary.withOpacity(.4),
                  blurRadius: 8)
            ]
                : [],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPayments(BuildContext context, List payments) {

    if (payments.isEmpty) {
      return Container(
        key: const ValueKey("empty"),
        padding: EdgeInsets.all(context.w(6)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.w(5)),
        ),
        child: const Center(
          child: Text(
            "No payments yet",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return Column(
      key: const ValueKey("paid"),
      children: payments.map((p) {
        return _card(
          context,
          title: "${p.amount} JD",
          lines: [
            "Date: ${p.paymentDate}",
            "Method: ${p.paymentMethod}"
          ],
          icon: Icons.payments,
        );
      }).toList(),
    );
  }

  Widget _buildTotalCard(BuildContext context, int total) {
    return _card(
      context,
      title: "Total Fees",
      lines: ["$total JD"],
      icon: Icons.account_balance_wallet,
    );
  }

  Widget _buildRemainingCard(BuildContext context, int remaining) {
    return _card(
      context,
      title: "Remaining Fees",
      lines: ["$remaining JD"],
      icon: Icons.warning_amber_rounded,
    );
  }

  Widget _card(BuildContext context,
      {required String title,
        required List<String> lines,
        required IconData icon}) {

    return Container(
      key: ValueKey(title),
      margin: EdgeInsets.only(bottom: context.h(2)),
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.w(5)),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8)
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.w(3)),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(context.w(4)),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          SizedBox(width: context.w(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.w(4))),
                SizedBox(height: context.h(0.6)),
                ...lines.map((e) => Text(e)),
              ],
            ),
          )
        ],
      ),
    );
  }
}