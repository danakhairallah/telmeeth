import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
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
      appBar: StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? context.w(1.2) : context.w(7.2),
              vertical: isMobile ? context.h(0.6) : context.h(2.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الصندوق الرئيسي
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.h(1.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.10),
                        blurRadius: 14,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? context.w(1.9) : context.w(6.8),
                    vertical: isMobile ? context.h(1) : context.h(1.9),
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
                                fontSize: isMobile ? context.w(6) : context.w(8.7),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF14283A),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: isMobile ? context.h(3.8) : context.h(4.8),
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.upload,
                                color: Colors.white,
                                size: context.w(3.8),
                              ),
                              label: Text(
                                "Upload Document",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.w(3.1),
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF132439),
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.w(2.4),
                                  vertical: 0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(context.h(0.8)),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(0.5)),
                      Text(
                        "Manage your official documents and records.",
                        style: TextStyle(
                          fontSize: isMobile ? context.w(2.6) : context.w(3.4),
                          color: Colors.blueGrey.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: context.h(1.7)),

                      // الصندوق الخاص بالجدول وعنوانه
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(context.h(1)),
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
                          horizontal: isMobile ? context.w(1.9) : context.w(4.3),
                          vertical: isMobile ? context.h(1) : context.h(1.6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // عنوان القائمة
                            Text(
                              "Documents List",
                              style: TextStyle(
                                fontSize: isMobile ? context.w(3.6) : context.h(4.6),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF14283A),
                              ),
                            ),
                            SizedBox(height: context.h(0.2)),
                            Text(
                              "View and manage your uploaded documents.",
                              style: TextStyle(
                                fontSize: isMobile ? context.w(2.4) : context.w(2.9),
                                color: Colors.blueGrey.shade400,
                              ),
                            ),
                            SizedBox(height: context.h(1)),
                            // الجدول
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  // رأس الجدول
                                  Row(
                                    children: [
                                      _headerCell(
                                        context,
                                        "Document Name",
                                        width: context.w(29.1),
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        context,
                                        "Type",
                                        width: context.w(24.3),
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        context,
                                        "Date",
                                        width: context.w(19.4),
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        context,
                                        "Status",
                                        width: context.w(23.1),
                                        isMobile: isMobile,
                                      ),
                                      _headerCell(
                                        context,
                                        "",
                                        width: context.w(15),
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
                                                size: context.w(3.6),
                                                color: Colors.blueGrey[300],
                                              ),
                                              SizedBox(width: context.w(1.2)),
                                              SizedBox(
                                                width: context.w(17),
                                                child: Text(
                                                  doc['name']!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: isMobile
                                                        ? context.w(2.7)
                                                        : context.w(3.2),
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
                                          width: context.w(29.1),
                                        ),
                                        _rowCell(
                                          Text(
                                            doc['type']!,
                                            style: TextStyle(
                                              fontSize: isMobile ? context.w(2.4) : context.w(2.9),
                                              color: Colors.blueGrey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          width: context.w(24.3),
                                        ),
                                        _rowCell(
                                          Text(
                                            doc['date']!,
                                            style: TextStyle(
                                              fontSize: isMobile ? context.w(2.4) : context.w(2.9),
                                              color: Colors.blueGrey[500],
                                            ),
                                          ),
                                          width: context.w(19.4),
                                        ),
                                        _rowCell(
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green.withOpacity(
                                                0.14,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(context.h(1.6)),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: context.w(1.2),
                                              vertical: context.h(0.2),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.verified,
                                                  color: Colors.green,
                                                  size: context.w(2.9),
                                                ),
                                                SizedBox(width: context.w(0.2)),
                                                SizedBox(
                                                  width: context.w(11.9),
                                                  child: Text(
                                                    doc['status']!,
                                                    style: TextStyle(
                                                      fontSize: isMobile
                                                          ? context.w(2)
                                                          : context.w(2.5),
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
                                          width: context.w(23.1),
                                        ),
                                        _rowCell(
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: context.w(6.3),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.remove_red_eye,
                                                    size: context.w(3.6),
                                                  ),
                                                  color: Colors.blueGrey[400],
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              SizedBox(
                                                width: context.w(6.3),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.download_rounded,
                                                    size: context.w(3.6),
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
                                          width: context.w(15),
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
                SizedBox(height: context.h(2.6)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerCell(
    BuildContext context,
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
          fontSize: isMobile ? context.w(2.6) : context.w(3.1),
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
