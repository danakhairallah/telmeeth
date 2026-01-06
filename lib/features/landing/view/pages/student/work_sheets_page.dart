import 'package:flutter/material.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class WorkSheets extends StatefulWidget {
  const WorkSheets({super.key});

  @override
  State<WorkSheets> createState() => _WorkSheetsState();
}

class _WorkSheetsState extends State<WorkSheets> {
  List<dynamic> allWorksheets = []; // كل الداتا من API
  List<dynamic> pagedWorksheets = []; // الداتا للصفحة الحالية
  int currentPage = 1;
  final int perPage = 2; // عدد الورقات لكل صفحة
  int totalPages = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchWorksheets();
  }

  Future<void> fetchWorksheets() async {
    setState(() {
      isLoading = true;
    });

    // مثال Response وهمي
    final response = [
      {"id": 1, "title": "Worksheet Test 1"},
      {"id": 2, "title": "Worksheet Test 2"},
      {"id": 3, "title": "Worksheet Test 3"},
      {"id": 4, "title": "Worksheet Test 4"},
    ];

    allWorksheets = response;
    totalPages = (allWorksheets.length / perPage).ceil();
    applyPagination();

    setState(() {
      isLoading = false;
    });
  }

  void applyPagination() {
    final start = (currentPage - 1) * perPage;
    final end = start + perPage;
    pagedWorksheets = allWorksheets.sublist(
      start,
      end > allWorksheets.length ? allWorksheets.length : end,
    );
  }

  void goToPage(int page) {
    setState(() {
      currentPage = page;
      applyPagination();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(5)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ********** كل شيء فوق يبقى كما هو **********
                CustomContainer(
                  backgroundColor: Color(0xFFF39F5F),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📑 Worksheets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            'Practice with assigned worksheets',
                            style: TextStyle(color: Colors.white, fontSize: context.w(3)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Worksheets',
                            style: TextStyle(color: Colors.white , fontSize: context.w(3.2)),
                          ),
                          SizedBox(height: context.h(0.6)),
                          Container(
                            width: context.w(9.7),
                            height: context.h(4.3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: context.w(0.4)),
                              borderRadius: BorderRadius.circular(context.h(0.7)),
                            ),
                            child: Center(
                              child: Text(
                                '${allWorksheets.length}',
                                style: TextStyle(color: Colors.white , fontSize: context.w(3)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(1.6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: context.w(43.7),
                      height: context.h(10),
                      color: Color(0xFFEFF6FF),
                      child: Column(
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2)
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '📋Available',
                            style: TextStyle(color: Color(0xFF1D4ED8) , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: context.w(43.7),
                      height: context.h(10),
                      color: Color(0xFFF0FDF4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2)
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            '✅Completed',
                            style: TextStyle(color: Color(0xFF16A34A) , fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(1.7)),

                // ********** عرض Worksheets مع pagination **********
                ...pagedWorksheets.map((worksheet) {
                  return FilterContainer(
                    width: MediaQuery.sizeOf(context).width,
                    height: context.h(22),
                    color: Color(0xFFEFF6FF),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              worksheet["title"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.w(4.8),
                              ),
                            ),
                            SizedBox(width: context.w(1.9)),
                            IconButton(
                              icon: Icon(Icons.pages, color: Colors.blue),
                              onPressed: () {
                                // فتح تفاصيل worksheet أو start
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),

                SizedBox(height: context.h(1)),

                // ********** pagination الدائري **********
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(totalPages, (index) {
                    final pageNumber = index + 1;
                    return GestureDetector(
                      onTap: () => goToPage(pageNumber),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: context.w(1)),
                        width: context.w(8),
                        height: context.w(8),
                        decoration: BoxDecoration(
                          color: currentPage == pageNumber ? Colors.blue : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Center(
                          child: Text(
                            '$pageNumber',
                            style: TextStyle(
                              color: currentPage == pageNumber ? Colors.white : Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: context.h(2)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8)),
          child: NavigationBarPrimary(),
        ),
      ),
    );
  }
}
