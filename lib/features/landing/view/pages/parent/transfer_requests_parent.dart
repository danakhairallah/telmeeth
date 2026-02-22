import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/transfer_controller.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_model.dart' as transfer;

class TransferRequestsParent extends StatefulWidget {
  const TransferRequestsParent({super.key});

  @override
  State<TransferRequestsParent> createState() => _TransferRequestsParentState();
}

class _TransferRequestsParentState extends State<TransferRequestsParent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransferController>().getTransfers();
    });
  }

  // Dialog controllers
  final _childCtrl = TextEditingController();
  final _typeCtrl = TextEditingController(text: "Internal (Class/Section)");
  final _targetCtrl = TextEditingController();
  DateTime? _selectedDate;

  void _openCreateDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.radius(18)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.w(6),
            vertical: context.h(4),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Transfer Request",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.font(15.8),
                    color: AppColors.petrolGreen,
                  ),
                ),
                SizedBox(height: context.h(0.8)),
                Text(
                  "Submit a new transfer request for your child.",
                  style: TextStyle(
                    fontSize: context.font(11.2),
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: context.h(3)),

                Text("Student Id", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                TextField(
                  controller: _childCtrl,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: context.font(12)),
                  decoration: _dialogInputDecoration(context, "Enter student id"),
                ),
                SizedBox(height: context.h(2)),

                Text("Transfer Type", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                DropdownButtonFormField<String>(
                  value: _typeCtrl.text,
                  items: const [
                    "Internal (Class/Section)",
                    "External (School)",
                  ]
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _typeCtrl.text = val);
                  },
                  decoration: _dialogInputDecoration(context, "Select type"),
                ),
                SizedBox(height: context.h(2)),

                Text("Target Branch Id", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                TextField(
                  controller: _targetCtrl,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: context.font(12)),
                  decoration: _dialogInputDecoration(context, "Enter branch id"),
                ),
                SizedBox(height: context.h(2)),

                Text("Date", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                InkWell(
                  borderRadius: BorderRadius.circular(context.radius(12)),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) setState(() => _selectedDate = picked);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: context.h(1.2),
                      horizontal: context.w(3.2),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(context.radius(12)),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: context.icon(18),
                            color: AppColors.primary),
                        SizedBox(width: context.w(2)),
                        Text(
                          _selectedDate == null
                              ? "Pick Date"
                              : "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: context.font(12),
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: context.h(3)),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: context.h(1.4)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.radius(12)),
                      ),
                    ),
                    onPressed: () async {
                      if (_childCtrl.text.isEmpty ||
                          _typeCtrl.text.isEmpty ||
                          _targetCtrl.text.isEmpty ||
                          _selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill all fields.")),
                        );
                        return;
                      }

                      final studentId = int.tryParse(_childCtrl.text) ?? 0;
                      final branchId = int.tryParse(_targetCtrl.text) ?? 0;

                      final dateStr =
                          "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}";

                      final ctrl =
                      Provider.of<TransferController>(context, listen: false);

                      final success = await ctrl.addTransferRequest(
                        studentId: studentId,
                        branchId: branchId,
                        type: _typeCtrl.text,
                        date: dateStr,
                      );

                      if (success) {
                        Navigator.pop(context);
                        _childCtrl.clear();
                        _typeCtrl.text = "Internal (Class/Section)";
                        _targetCtrl.clear();
                        setState(() => _selectedDate = null);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Request failed. Try again.")),
                        );
                      }
                    },
                    child: Text(
                      "Submit Request",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.font(12.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<TransferController>();
    final requests = ctrl.transferModel?.data ?? [];

    final pendingCount = requests.where((e) => (e.status ?? '').toLowerCase() == 'pending').length;
    final completedCount = requests.where((e) => (e.status ?? '').toLowerCase() == 'completed').length;

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: const Color(0xffF7F8FA),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Create", style: TextStyle(color: Colors.white)),
        onPressed: _openCreateDialog,
      ),
      body: ctrl.isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : ctrl.error != null
          ? Center(child: Text(ctrl.error!, textAlign: TextAlign.center))
          : SingleChildScrollView(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderCard(
              title: "Transfer Requests",
              subtitle: "Manage student transfer requests.",
              icon: Icons.swap_horiz,
            ),
            SizedBox(height: context.h(2.5)),

            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: "Total",
                    value: "${requests.length}",
                    icon: Icons.list_alt,
                    accentColor: AppColors.primary, // Orange
                  ),
                ),
                SizedBox(width: context.w(2.5)),
                Expanded(
                  child: _StatCard(
                    title: "Pending",
                    value: "$pendingCount",
                    icon: Icons.hourglass_top,
                    accentColor: const Color(0xFFF59E0B), // Amber
                  ),
                ),
                SizedBox(width: context.w(2.5)),
                Expanded(
                  child: _StatCard(
                    title: "Completed",
                    value: "$completedCount",
                    icon: Icons.check_circle_outline,
                    accentColor: const Color(0xFF16A34A), // Green
                  ),
                ),
              ],
            ),
            SizedBox(height: context.h(3)),

            _SectionCard(
              title: "Requests List",
              subtitle: "View and manage transfer requests.",
              child: requests.isEmpty
                  ? Padding(
                padding: EdgeInsets.all(context.w(5)),
                child: Center(
                  child: Text(
                    "No requests yet.",
                    style: TextStyle(
                      fontSize: context.font(12.5),
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              )
                  : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: context.w(140), // مساحة كافية للجدول
                  child: Column(
                    children: [
                      _tableHeader(context),
                      Divider(color: Colors.grey.shade300),
                      ...requests.map((r) => _tableRow(context, r)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== Table =====
  Widget _tableHeader(BuildContext context) {
    return Row(
      children: [
        _tableHeaderCell("Student", flex: 2),
        _tableHeaderCell("Type", flex: 3),
        _tableHeaderCell("Branch", flex: 2),
        _tableHeaderCell("Date", flex: 2),
        _tableHeaderCell("Status", flex: 2),
      ],
    );
  }

  Widget _tableHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: context.font(11),
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _tableRow(BuildContext context, transfer.Data req) {
    final status = (req.status ?? '').toLowerCase();
    Color statusColor;
    String statusText;

    if (status == 'completed') {
      statusColor = const Color(0xFF16A34A);
      statusText = 'completed';
    } else if (status == 'pending') {
      statusColor = const Color(0xFFF59E0B);
      statusText = 'pending';
    } else {
      statusColor = const Color(0xFFEF4444);
      statusText = status.isEmpty ? 'rejected' : status;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(1.2)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              req.studentId?.toString() ?? "-",
              style: TextStyle(fontSize: context.font(12)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(Icons.school, size: context.icon(18), color: AppColors.petrolGreen),
                SizedBox(width: context.w(2)),
                Flexible(
                  child: Text(
                    req.type ?? "-",
                    style: TextStyle(fontSize: context.font(12)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              req.branchId?.toString() ?? "-",
              style: TextStyle(fontSize: context.font(12)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              req.date ?? "-",
              style: TextStyle(fontSize: context.font(12)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(3),
                  vertical: context.h(0.7),
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(context.radius(999)),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: context.font(11.5),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===== Dialog Styles =====
  TextStyle _dialogLabelStyle(BuildContext context) => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: context.font(12.5),
    color: AppColors.petrolGreen,
  );

  InputDecoration _dialogInputDecoration(BuildContext context, String hint) =>
      InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: context.h(1.4), horizontal: context.w(3.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.radius(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.radius(12)),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.radius(12)),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.3),
        ),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
      );

  @override
  void dispose() {
    _childCtrl.dispose();
    _typeCtrl.dispose();
    _targetCtrl.dispose();
    super.dispose();
  }
}

// ===== Reusable UI (same style as your other pages) =====

class _HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _HeaderCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
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
        children: [
          CircleAvatar(
            radius: context.w(7),
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(icon, color: Colors.white, size: context.icon(26)),
          ),
          SizedBox(width: context.w(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.font(17),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.h(0.5)),
                Text(
                  subtitle,
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
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color accentColor;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row: icon + title
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(context.w(2.8)),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: context.icon(18),
                ),
              ),
              SizedBox(width: context.w(3)),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.font(12),
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: context.h(1.6)),

          // big value
          Text(
            value,
            style: TextStyle(
              fontSize: context.font(20),
              fontWeight: FontWeight.bold,
              color: AppColors.petrolGreen,
              letterSpacing: 0.3,
            ),
          ),

          SizedBox(height: context.h(0.8)),

          // subtle hint
          Text(
            "Records",
            style: TextStyle(
              fontSize: context.font(10.5),
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: context.h(1.2)),

          // bottom accent line
          Container(
            height: context.h(0.6),
            width: double.infinity,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.85),
              borderRadius: BorderRadius.circular(context.radius(999)),
            ),
          ),
        ],
      ),
    );
  }
}
class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.font(14.5),
              fontWeight: FontWeight.bold,
              color: AppColors.petrolGreen,
            ),
          ),
          SizedBox(height: context.h(0.6)),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: context.font(11.5),
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: context.h(2)),
          child,
        ],
      ),
    );
  }
}