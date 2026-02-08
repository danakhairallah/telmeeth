import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';

class TransferRequestsParent extends StatefulWidget {
  const TransferRequestsParent({super.key});

  @override
  State<TransferRequestsParent> createState() => _TransferRequestsParentState();
}

class _TransferRequestsParentState extends State<TransferRequestsParent> {
  List<Map<String, dynamic>> requests = [
    {
      "student": "2",
      "type": "Internal (Class/Section)",
      "target": "transferRequests.branchId: 3",
      "date": "2025-12-21",
      "status": "rejected",
    },
  ];

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
                  style: TextStyle(fontSize: context.font(3.7)),
                  decoration: _dialogInputDecoration("Select Child"),
                ),
                SizedBox(height: context.h(2)),

                // Transfer Type
                Text("Transfer Type", style: _dialogLabelStyle(context)),
                SizedBox(height: context.h(0.7)),
                DropdownButtonFormField<String>(
                  initialValue: _typeCtrl.text,
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
                  style: TextStyle(fontSize: context.font(3.7)),
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
                    onPressed: () {
                      if (_childCtrl.text.isNotEmpty &&
                          _typeCtrl.text.isNotEmpty &&
                          _targetCtrl.text.isNotEmpty &&
                          _selectedDate != null) {
                        setState(() {
                          requests.add({
                            "student": _childCtrl.text,
                            "type": _typeCtrl.text,
                            "target": _targetCtrl.text,
                            "date": "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}",
                            "status": "pending",
                          });
                        });
                        Navigator.pop(context);
                        // Reset fields
                        _childCtrl.clear();
                        _typeCtrl.text = "Internal (Class/Section)";
                        _targetCtrl.clear();
                        _selectedDate = null;
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

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                    icon: const Icon(Icons.add, size: 22,  color: Colors.white, ),
                    label: const Text("Create Request", style: TextStyle( color: Colors.white, fontWeight: FontWeight.w500),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C00),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(4.5),
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
              Wrap(
                spacing: context.w(3),
                runSpacing: context.h(2),
                children: [
                  _statCard(context, title: "Total Records", value: "${requests.length}"),
                  _statCard(context, title: "Pending", value: "${requests.where((e) => e['status'] == 'pending').length}",
                      badgeText: "Pending", badgeColor: Color(0xFFFFF7ED), badgeTextColor: Color(0xFFF59E0B)),
                  _statCard(context, title: "Completed", value: "${requests.where((e) => e['status'] == 'completed').length}",
                      badgeText: "Completed", badgeColor: Color(0xFFECFDF3), badgeTextColor: Color(0xFF16A34A)),
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

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 900, // min table width
                        child: Column(
                          children: [
                            _tableHeader(context),
                            Divider(color: Colors.grey.shade300),
                            ...requests.map((req) => _tableRow(context, req)),
                          ],
                        ),
                      ),
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
    String? badgeText,
    Color? badgeColor,
    Color? badgeTextColor,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: isMobile ? double.infinity : context.w(26),
      padding: EdgeInsets.all(context.h(2.2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFE5E9F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              if (badgeText != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badgeText,
                    style: TextStyle(
                      fontSize: 13,
                      color: badgeTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: context.h(1.6)),
          Text(
            value,
            style: TextStyle(
              fontSize: context.font(17),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  Widget _tableHeader(BuildContext context) {
    return Row(
      children: [
        _tableHeaderCell("Student Name", flex: 2),
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
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _tableRow(BuildContext context, Map<String, dynamic> req) {
    Color statusColor;
    String statusText = req['status'];
    if (statusText == 'completed') {
      statusColor = Color(0xFF16A34A);
      statusText = "completed";
    } else if (statusText == 'pending') {
      statusColor = Color(0xFFF59E0B);
      statusText = "pending";
    } else {
      statusColor = Color(0xFFEF4444);
      statusText = "rejected";
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(1.6)),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(req['student'].toString())),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(Icons.school, size: 20, color: Colors.blue[700]),
                SizedBox(width: 8),
                Flexible(child: Text(req['type'].toString(), style: TextStyle(fontSize: 16))),
              ],
            ),
          ),
          Expanded(flex: 3, child: Text(req['target'].toString(), style: TextStyle(fontSize: 16))),
          Expanded(flex: 2, child: Text(req['date'].toString(), style: TextStyle(fontSize: 16))),
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
}
