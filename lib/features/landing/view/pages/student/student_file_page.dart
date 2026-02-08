import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:telmeeth/core/api/student/controllers/student_file_controller.dart';
import 'package:telmeeth/core/api/student/model/response/student_file_model.dart';

class StudentFilePage extends StatefulWidget {
  const StudentFilePage({super.key});

  @override
  State<StudentFilePage> createState() => _StudentFilePageState();
}

class _StudentFilePageState extends State<StudentFilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<StudentFileController>().fetchStudentFiles());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: Consumer<StudentFileController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.errorMsg != null) {
              return Center(child: Text(controller.errorMsg!));
            }
            final StudentFileModel? fileData =
            (controller.studentFiles != null && controller.studentFiles!.isNotEmpty)
                ? controller.studentFiles!.first
                : null;

            if (fileData == null) {
              return const Center(child: Text("No file data found."));
            }

            // ====== تحويل البيانات لعرض مناسب للجدول ======
            final List<_FileRowData> filesList = [];

            // وثائق رسمية ثابتة
            filesList.add(_FileRowData("Birth Certificate", "Official Document", fileData.birthCertificate));
            filesList.add(_FileRowData("Passport", "Official Document", fileData.passport));
            filesList.add(_FileRowData("Identity Card", "Official Document", fileData.identityCard));
            filesList.add(_FileRowData("Personal Photo", "Official Document", fileData.personalPhoto));
            filesList.add(_FileRowData("Transfer Paper", "Official Document", fileData.transferPaper));
            filesList.add(_FileRowData("Last Certified Degree", "Official Document", fileData.lastCertifiedDegree));
            filesList.add(_FileRowData("Disease Free", "Official Document", fileData.diseaseFree));

            // لقاحات
            if (fileData.vaccines != null) {
              for (var vaccine in fileData.vaccines!) {
                filesList.add(_FileRowData(vaccine, "Medical Record", null));
              }
            }
            // Family Book
            if (fileData.familyBook != null) {
              for (var member in fileData.familyBook!) {
                filesList.add(_FileRowData("Family Book - $member", "Official Document", null));
              }
            }
            // Uploads 1
            if (fileData.upload1 != null) {
              for (int i = 0; i < fileData.upload1!.length; i++) {
                var upload = fileData.upload1![i];
                filesList.add(_FileRowData("Extra File (1) - ${i + 1}", "Uploaded Resource", upload));
              }
            }
            // Uploads 2
            if (fileData.upload2 != null) {
              for (int i = 0; i < fileData.upload2!.length; i++) {
                var upload = fileData.upload2![i];
                filesList.add(_FileRowData("Extra File (2) - ${i + 1}", "Uploaded Resource", upload));
              }
            }
            // Uploads 3
            if (fileData.upload3 != null) {
              for (int i = 0; i < fileData.upload3!.length; i++) {
                var upload = fileData.upload3![i];
                filesList.add(_FileRowData("Extra File (3) - ${i + 1}", "Uploaded Resource", upload));
              }
            }

            return SingleChildScrollView(
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
                                  onPressed: () {
                                    // إضافة رفع ملف هنا
                                  },
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

                          // جدول الملفات
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

                                // الجدول (رؤوس الأعمدة)
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          _headerCell(
                                            context, "Document Name",
                                            width: context.w(29.1),
                                            isMobile: isMobile,
                                          ),
                                          _headerCell(
                                            context, "Type",
                                            width: context.w(24.3),
                                            isMobile: isMobile,
                                          ),
                                          _headerCell(
                                            context, "Status",
                                            width: context.w(18),
                                            isMobile: isMobile,
                                          ),
                                          _headerCell(
                                            context, "",
                                            width: context.w(15),
                                            isMobile: isMobile,
                                          ),
                                        ],
                                      ),
                                      ...filesList.map(
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
                                                      doc.name,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: isMobile
                                                            ? context.w(2.7)
                                                            : context.w(3.2),
                                                        color: const Color(0xFF1F2937),
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              width: context.w(29.1),
                                            ),
                                            _rowCell(
                                              Text(
                                                doc.type,
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: doc.path != null
                                                      ? Colors.green.withOpacity(0.14)
                                                      : Colors.red.withOpacity(0.13),
                                                  borderRadius: BorderRadius.circular(context.h(1.6)),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: context.w(1.2),
                                                  vertical: context.h(0.2),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      doc.path != null ? Icons.verified : Icons.close,
                                                      color: doc.path != null ? Colors.green : Colors.red,
                                                      size: context.w(2.9),
                                                    ),
                                                    SizedBox(width: context.w(0.2)),
                                                    Text(
                                                      doc.path != null ? "Available" : "Missing",
                                                      style: TextStyle(
                                                        fontSize: isMobile ? context.w(2) : context.w(2.5),
                                                        color: doc.path != null
                                                            ? Colors.green[700]
                                                            : Colors.red[700],
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              width: context.w(18),
                                            ),
                                            _rowCell(
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  if (doc.path != null) ...[
                                                    SizedBox(
                                                      width: context.w(6.3),
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          size: context.w(3.6),
                                                        ),
                                                        color: Colors.blueGrey[400],
                                                        padding: EdgeInsets.zero,
                                                        constraints: const BoxConstraints(),
                                                        onPressed: () {
                                                          // فتح الملف (pdf viewer, image viewer...)
                                                        },
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
                                                        constraints: const BoxConstraints(),
                                                        onPressed: () {
                                                          // تحميل الملف
                                                        },
                                                      ),
                                                    ),
                                                  ]
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
            );
          },
        ),
      ),
    );
  }

  Widget _headerCell(BuildContext context, String text,
      {required double width, required bool isMobile}) {
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

// ===== Helper Class لترتيب كل ملف =====
class _FileRowData {
  final String name;
  final String type;
  final String? path;

  _FileRowData(this.name, this.type, this.path);
}
