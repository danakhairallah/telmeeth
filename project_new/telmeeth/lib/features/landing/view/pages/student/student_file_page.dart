import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student_drawer.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class StudentFilePage extends StatelessWidget {
  const StudentFilePage({super.key});

  final List<Map<String, String>> documents = const [
    {
      "name": "birth certificate",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "passport",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "identity card",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "personal photo",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "transfer paper",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "last certified degree",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "disease free",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Vaccine 1",
      "type": "Medical Record",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Vaccine 2",
      "type": "Medical Record",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Family Book 1",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Family Book 2",
      "type": "Official Document",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Extra File (1) - 1",
      "type": "Uploaded Resource",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Extra File (1) - 2",
      "type": "Uploaded Resource",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Extra File (2) - 1",
      "type": "Uploaded Resource",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Extra File (3) - 1",
      "type": "Uploaded Resource",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
    {
      "name": "Extra File (3) - 3",
      "type": "Uploaded Resource",
      "date": "2025-12-29",
      "status": "studentFile.approved",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: AppDrawer(),
      backgroundColor: const Color(0xFFF6F8FB),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.all(context.h(0.8)),
        child: NavigationBarPrimary(),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 5 : 30,
              vertical: isMobile ? 6 : 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الصندوق الرئيسي
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.10),
                        blurRadius: 14,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8 : 28,
                    vertical: isMobile ? 10 : 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // العنوان الرئيسي مع الزر
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Student File",
                              style: TextStyle(
                                fontSize: isMobile ? 25 : 36,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF14283A),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: isMobile ? 35 : 44,
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.upload,
                                color: Colors.white,
                                size: 16,
                              ),
                              label: const Text(
                                "Upload Document",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF132439),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Manage your official documents and records.",
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 14,
                          color: Colors.blueGrey.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // الصندوق الخاص بالجدول وعنوانه
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.11),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 7,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 8 : 18,
                          vertical: isMobile ? 10 : 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // عنوان القائمة
                            Text(
                              "Documents List",
                              style: TextStyle(
                                fontSize: isMobile ? 15 : 19,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF14283A),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "View and manage your uploaded documents.",
                              style: TextStyle(
                                fontSize: isMobile ? 10 : 12,
                                color: Colors.blueGrey.shade400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // الجدول
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  // رأس الجدول
                                  Row(
                                    children: [
                                      _headerCell(
                                        "Document Name",
                                        width: 120,
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        "Type",
                                        width: 100,
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        "Date",
                                        width: 80,
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        "Status",
                                        width: 95,
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        "",
                                        width: 62,
                                        isMobile: isMobile,
                                      ),
                                    ],
                                  ),
                                  // العناصر (الصفوف)
                                  ...documents.map(
                                    (doc) => Row(
                                      children: [
                                        _rowCell(
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.description_outlined,
                                                size: 15,
                                                color: Colors.blueGrey[300],
                                              ),
                                              const SizedBox(width: 5),
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  doc['name']!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: isMobile
                                                        ? 11.3
                                                        : 13.5,
                                                    color: const Color(
                                                      0xFF1F2937,
                                                    ),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          width: 120,
                                        ),
                                        _rowCell(
                                          Text(
                                            doc['type']!,
                                            style: TextStyle(
                                              fontSize: isMobile ? 10 : 12,
                                              color: Colors.blueGrey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          width: 100,
                                        ),
                                        _rowCell(
                                          Text(
                                            doc['date']!,
                                            style: TextStyle(
                                              fontSize: isMobile ? 10 : 12,
                                              color: Colors.blueGrey[500],
                                            ),
                                          ),
                                          width: 80,
                                        ),
                                        _rowCell(
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green.withOpacity(
                                                0.14,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 2,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.verified,
                                                  color: Colors.green,
                                                  size: 12,
                                                ),
                                                const SizedBox(width: 1),
                                                SizedBox(
                                                  width: 49,
                                                  child: Text(
                                                    doc['status']!,
                                                    style: TextStyle(
                                                      fontSize: isMobile
                                                          ? 8.5
                                                          : 10.5,
                                                      color: Colors.green[700],
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          width: 95,
                                        ),
                                        _rowCell(
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 26,
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.remove_red_eye,
                                                    size: 15,
                                                  ),
                                                  color: Colors.blueGrey[400],
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              SizedBox(
                                                width: 26,
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.download_rounded,
                                                    size: 15,
                                                  ),
                                                  color: Colors.blueGrey[600],
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                          width: 62,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerCell(
    String text, {
    required double width,
    required bool isMobile,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: isMobile ? 11 : 13,
          color: const Color(0xFF263442),
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _rowCell(Widget child, {required double width}) {
    return SizedBox(width: width, child: child);
  }
}
