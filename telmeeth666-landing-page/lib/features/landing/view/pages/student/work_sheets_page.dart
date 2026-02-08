import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/worksheet_controller.dart';
import 'package:telmeeth/core/api/student/model/response/worksheet_data.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/student/worksheet_detail_page.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';

// ... بقاء الاستيرادات كما هي

class WorkSheets extends StatefulWidget {
  const WorkSheets({super.key});

  @override
  State<WorkSheets> createState() => _WorkSheetsState();
}

class _WorkSheetsState extends State<WorkSheets> {
  int currentPage = 1;
  final int perPage = 2;
  List<WorksheetData> pagedWorksheets = [];

  @override
  void initState() {
    super.initState();
    final controller = context.read<WorksheetController>();
    controller.getWorksheets().then((_) {
      setState(() {
        applyPagination(controller.worksheets ?? []);
      });
    });
  }

  void applyPagination(List<WorksheetData> allWorksheets) {
    final start = (currentPage - 1) * perPage;
    final end = start + perPage;
    pagedWorksheets = allWorksheets.sublist(
      start,
      end > allWorksheets.length ? allWorksheets.length : end,
    );
  }

  void goToPage(int page) {
    final controller = context.read<WorksheetController>();
    final allWorksheets = controller.worksheets ?? [];
    setState(() {
      currentPage = page;
      applyPagination(allWorksheets);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: Consumer<WorksheetController>(
        builder: (context, controller, child) {
          final allWorksheets = controller.worksheets ?? [];
          final totalPages = (allWorksheets.length / perPage).ceil();

          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.all(context.w(4)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ********** Header **********
                  CustomContainer(
                    backgroundColor: const Color(0xFFF39F5F),
                    padding: EdgeInsets.symmetric(
                      vertical: context.h(2),
                      horizontal: context.w(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.assignment_turned_in,
                            color: Colors.white,
                            size: context.w(8)),
                        SizedBox(width: context.w(2)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Worksheets',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.w(6),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                            SizedBox(height: context.h(0.7)),
                            Text(
                              'Practice with assigned worksheets',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.93),
                                fontSize: context.w(3.2),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: context.w(3.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: context.h(0.7)),
                            Container(
                              width: context.w(10),
                              height: context.h(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                border: Border.all(
                                    color: Colors.white, width: context.w(0.3)),
                                borderRadius: BorderRadius.circular(context.h(1)),
                              ),
                              child: Center(
                                child: Text(
                                  '${allWorksheets.length}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.w(3.5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.h(2.3)),

                  // ********** Filters **********
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _FilterCard(
                        color: const Color(0xFFEFF6FF),
                        borderColor: const Color(0xFF1D4ED8).withOpacity(0.15),
                        title: '${allWorksheets.where((w) => w.worksheet != null).length}',
                        subtitle: 'Available',
                        icon: Icons.assignment,
                        iconColor: Color(0xFF1D4ED8),
                        valueColor: Color(0xFF1D4ED8),
                      ),
                      _FilterCard(
                        color: const Color(0xFFF0FDF4),
                        borderColor: const Color(0xFF16A34A).withOpacity(0.15),
                        title: '0',
                        subtitle: 'Completed',
                        icon: Icons.verified,
                        iconColor: Color(0xFF16A34A),
                        valueColor: Color(0xFF16A34A),
                      ),
                    ],
                  ),
                  SizedBox(height: context.h(2)),

                  // ********** Worksheets List **********
                  ...pagedWorksheets.map((data) {
                    final worksheet = data.worksheet;
                    if (worksheet == null) return const SizedBox();

                    return Container(
                      margin: EdgeInsets.only(bottom: context.h(1.5)),
                      padding: EdgeInsets.symmetric(
                        vertical: context.h(2),
                        horizontal: context.w(4.2),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5FAFE),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.07),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left: Title & Type
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  worksheet.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.w(4.8),
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                                SizedBox(height: context.h(1)),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    worksheet.type,
                                    style: TextStyle(
                                      fontSize: context.w(3.5),
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right: Start Button
                          SizedBox(width: context.w(2)),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      WorksheetDetailPage(worksheetId: worksheet.id),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(context.w(2.6)),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.09),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.play_arrow,
                                  color: Colors.blue.shade800,
                                  size: context.w(7.5)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  SizedBox(height: context.h(2)),

                  // ********** Pagination **********
// ... باقي الكود بدون تغيير

// ********** Pagination **********
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(totalPages, (index) {
                      return GestureDetector(
                        onTap: () => goToPage(index + 1),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: context.w(1.1)),
                          width: currentPage == (index + 1) ? context.w(5) : context.w(3.2),
                          height: context.w(3.2),
                          decoration: BoxDecoration(
                            color: currentPage == (index + 1)
                                ? Colors.blue.shade700
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              if (currentPage == (index + 1))
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.12),
                                  blurRadius: 6,
                                )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: context.h(2.5)),
                  SizedBox(height: context.h(2.5)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// -------------------- FilterCard ويدجت جديد ------------------------
class _FilterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final Color valueColor;

  const _FilterCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.iconColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(44),
      height: context.h(11),
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: context.h(1), horizontal: context.w(3)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.09),
            child: Icon(icon, color: iconColor, size: context.w(5.5)),
          ),
          SizedBox(width: context.w(3.2)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: valueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: context.w(4.5),
                ),
              ),
              SizedBox(height: context.h(0.6)),
              Text(
                subtitle,
                style: TextStyle(
                  color: valueColor.withOpacity(0.7),
                  fontSize: context.w(3.2),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
