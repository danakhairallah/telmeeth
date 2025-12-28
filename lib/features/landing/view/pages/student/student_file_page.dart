import 'package:flutter/material.dart';

class StudentFilePage extends StatelessWidget {
  const StudentFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;
          return Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(child: _ProfileInfoCard()),
              if (!isMobile) const SizedBox(width: 25),
              Expanded(child: _DocumentsListCard()),
            ],
          );
        },
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const SizedBox(height: 2),
            const Text(
              "Your official school record details.",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 24),
            _profileRow("Name", "Ahmed Al-Mansouri", bold: true),
            const SizedBox(height: 10),
            _profileRow("Student ID", "ST-2023-001", grey: true),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _profileRow("Grade", "Grade 10", grey: true)),
                Expanded(child: _profileRow("Section", "Section A", grey: true)),
              ],
            ),
            const SizedBox(height: 10),
            _profileRow("Birth Date", "2008-05-15"),
            const SizedBox(height: 10),
            _profileRow("Nationality", "Emirati"),
            const SizedBox(height: 10),
            _profileRow("Contact", "ahmed.student@school.ae\n+971 50 123 4567", grey: true),
          ],
        ),
      ),
    );
  }

  Widget _profileRow(String title, String value, {bool bold = false, bool grey = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
            color: grey ? Colors.blueGrey[600] : Colors.black,
            height: 1.33,
          ),
        ),
      ],
    );
  }
}

class _DocumentsListCard extends StatelessWidget {
  final List<Map<String, dynamic>> docs = const [
    {
      "name": "Birth Certificate.pdf",
      "type": "Official Document",
      "date": "2023-08-15",
      "status": "Verified",
      "icon": Icons.insert_drive_file_outlined,
    },
    {
      "name": "Previous School Report.pdf",
      "type": "Academic Record",
      "date": "2023-08-20",
      "status": "Pending",
      "icon": Icons.insert_drive_file_outlined,
    },
    {
      "name": "Medical Record.pdf",
      "type": "Health Record",
      "date": "2023-09-01",
      "status": "Verified",
      "icon": Icons.insert_drive_file_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Documents List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const SizedBox(height: 2),
            const Text(
              "View and manage your uploaded documents.",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 16),
            // Table Head
            Row(
              children: const [
                Expanded(flex: 4, child: Text("Document Name", style: _thStyle)),
                Expanded(flex: 3, child: Text("Type", style: _thStyle)),
                Expanded(flex: 2, child: Text("Date", style: _thStyle)),
                Expanded(flex: 2, child: Text("Status", style: _thStyle)),
                SizedBox(width: 28),
              ],
            ),
            const Divider(height: 18, color: Color(0xFFE6E8EB), thickness: 1.2),
            // Table Rows
            ...docs.map((doc) => _docRow(context, doc)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _docRow(BuildContext context, Map<String, dynamic> doc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        children: [
          // Document Name
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Icon(doc["icon"], size: 20, color: Colors.grey[700]),
                const SizedBox(width: 5),
                Text(
                  doc["name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
          // Type
          Expanded(
            flex: 3,
            child: Text(doc["type"], style: const TextStyle(fontSize: 14)),
          ),
          // Date
          Expanded(
            flex: 2,
            child: Text(doc["date"], style: const TextStyle(fontSize: 14)),
          ),
          // Status
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _statusBadge(doc["status"]),
            ),
          ),
          // View Icon
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_red_eye_outlined, color: Colors.grey, size: 20),
            tooltip: "View",
          ),
          // Delete Icon
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
            tooltip: "Delete",
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String status) {
    if (status == "Verified") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF36C268).withOpacity(.15),
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Text(
          "Verified",
          style: TextStyle(
              color: Color(0xFF24A043),
              fontSize: 13.5,
              fontWeight: FontWeight.bold),
        ),
      );
    }
    if (status == "Pending") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFB5BFE2).withOpacity(.15),
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Text(
          "Pending",
          style: TextStyle(
              color: Color(0xFF53627C),
              fontSize: 13.5,
              fontWeight: FontWeight.bold),
        ),
      );
    }
    return const SizedBox();
  }
}

const _thStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black87,
  fontSize: 14.5,
);
