import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/controllers/transfer_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:provider/provider.dart';
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
      Provider.of<TransferController>(context, listen: false).getTransfers();
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.w(6), vertical: context.h(4)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Transfer Request",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.font(15.4)),
                ),
                SizedBox(height: context.h(1)),
                Text(
                  "Submit a new transfer request for your child.",
                  style: TextStyle(fontSize: context.font(10.5), color: Colors.grey[600]),
                ),
                SizedBox(height: context.h(3)),

                // Select Child
                Text("Select Child", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                TextField(
                  controller: _childCtrl,
                  style: TextStyle(fontSize: context.font(11.7)),
                  decoration: _dialogInputDecoration("Select Child"),
                ),
                SizedBox(height: context.h(2)),

                // Transfer Type
                Text("Transfer Type", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                DropdownButtonFormField<String>(
                  value: _typeCtrl.text, // Use value (not initialValue) with TextEditingController
                  items: [
                    "Internal (Class/Section)",
                    "External (School)",
                  ].map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(fontSize: context.font(11))))).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _typeCtrl.text = val);
                  },
                  decoration: _dialogInputDecoration("Select Type"),
                ),
                SizedBox(height: context.h(2)),

                // Target School
                Text("Target School", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                TextField(
                  controller: _targetCtrl,
                  style: TextStyle(fontSize: context.font(11.7)),
                  decoration: _dialogInputDecoration("Enter Target School / branchId"),
                ),
                SizedBox(height: context.h(2)),

                // Date
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date", style: _dialogLabelStyle(context)),
                          SizedBox(height: context.h(0.7)),
                          GestureDetector(
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
                              padding: EdgeInsets.symmetric(
                                  vertical: context.h(1.2),
                                  horizontal: context.w(2.5)),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Text(
                                _selectedDate == null
                                    ? "Pick Date"
                                    : "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}",
                                style: TextStyle(fontSize: context.font(11), color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(3)),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF8C00), // Orange!
                      padding: EdgeInsets.symmetric(
                        vertical: context.h(1.4),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      if (_childCtrl.text.isNotEmpty &&
                          _typeCtrl.text.isNotEmpty &&
                          _targetCtrl.text.isNotEmpty &&
                          _selectedDate != null) {
                        // مثال: تحويل النصوص لأرقام حسب المطلوب من الـAPI
                        int studentId = int.tryParse(_childCtrl.text) ?? 0; // غيّر حسب المطلوب
                        int branchId = int.tryParse(_targetCtrl.text) ?? 0; // غيّر حسب المطلوب

                        // فورمات التاريخ
                        String dateStr = "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}";

                        final transferController = Provider.of<TransferController>(context, listen: false);

                        bool success = await transferController.addTransferRequest(
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
                          _selectedDate = null;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("فشل إرسال الطلب. حاول مجددًا.")),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Submit Request",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.font(12),
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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final transferController = Provider.of<TransferController>(context);
    final requests = transferController.transferModel?.data ?? [];

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: Colors.white,
      body: transferController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : transferController.error != null
          ? Center(child: Text(transferController.error!))
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? context.w(4) : context.w(8),
            vertical: context.h(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transfer Requests",
                          style: TextStyle(
                            fontSize: isMobile ? context.font(22) : context.font(9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.h(0.7)),
                        Text(
                          "Manage student transfer requests.",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: isMobile ? context.font(14) : context.font(4.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _openCreateDialog,
                    icon: const Icon(Icons.add, size: 15,  color: Colors.white, ),
                    label: const Text("Create Request", style: TextStyle( color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C00),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(2.8),
                        vertical: context.h(1.5),

                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.h(3.5)),

              /// Stats Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _statCard(
                      context,
                      title: "Total Records",
                      value: "${requests.length}",
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Expanded(
                    child: _statCard(
                      context,
                      title: "Pending",
                      value: "${requests.where((e) => e.status == 'pending').length}",
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Expanded(
                    child: _statCard(
                      context,
                      title: "Completed",
                      value: "${requests.where((e) => e.status == 'completed').length}",
                    ),
                  ),
                ],
              ),


              SizedBox(height: context.h(4)),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.h(2.2)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color(0xFFE5E9F2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Requests List",
                      style: TextStyle(
                        fontSize: isMobile ? context.font(18) : context.font(7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.h(0.6)),
                    Text(
                      "View and manage transfer requests.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: isMobile ? context.font(12) : context.font(4.1),
                      ),
                    ),

                    SizedBox(height: context.h(3)),

                    Column(
                      children: [
                        _tableHeader(context),
                        Divider(color: Colors.grey.shade300),
                        ...requests.map((req) => _tableRow(context, req)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _statCard(BuildContext context, {
    required String title,
    required String value,
  }) {
    return Container(
      height: 88,
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFE5E9F2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11,
              color: Colors.blueGrey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(BuildContext context) {
    return Row(
      children: [
        _tableHeaderCell(" Name", flex: 2),
        _tableHeaderCell("Transfer Type", flex: 3),
        _tableHeaderCell("Target School", flex: 3),
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
          fontSize: 10,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _tableRow(BuildContext context, transfer.Data req) {
    Color statusColor;
    String statusText = req.status ?? '';
    if (statusText == 'completed') {
      statusColor = Color(0xFF16A34A);
    } else if (statusText == 'pending') {
      statusColor = Color(0xFFF59E0B);
    } else {
      statusColor = Color(0xFFEF4444);
      statusText = "rejected";
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(1.6)),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(req.studentId?.toString() ?? "-")),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(Icons.school, size: 20, color: Colors.blue[700]),
                SizedBox(width: 8),
                Flexible(child: Text(req.type ?? "", style: TextStyle(fontSize: 16))),
              ],
            ),
          ),
          Expanded(flex: 3, child: Text(req.branchId?.toString() ?? "", style: TextStyle(fontSize: 16))),
          Expanded(flex: 2, child: Text(req.date ?? "", style: TextStyle(fontSize: 16))),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.13),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                statusText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog Styles
  TextStyle _dialogLabelStyle(BuildContext context) => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: context.font(12.9),
  );

  InputDecoration _dialogInputDecoration(String hint) => InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    hintText: hint,
    filled: true,
    fillColor: Colors.grey[100],
    hintStyle: TextStyle(fontSize: 11, color: Colors.grey[500]),
  );

  @override
  void dispose() {
    _childCtrl.dispose();
    _typeCtrl.dispose();
    _targetCtrl.dispose();
    super.dispose();
  }
}


