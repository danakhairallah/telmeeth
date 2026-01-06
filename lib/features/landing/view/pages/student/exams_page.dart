import 'package:flutter/material.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  List<dynamic> allExams = []; // كل الداتا من API
  List<dynamic> pagedExams = []; // الداتا للصفحة الحالية
  int currentPage = 1;
  final int perPage = 2; // كم exam لكل صفحة
  int totalPages = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchExams();
  }

  Future<void> fetchExams() async {
    setState(() {
      isLoading = true;
    });

    // Response وهمي من API
    final response = [
      {"id": 1, "title": "Math Midterm Exam"},
      {"id": 2, "title": "Science Final Exam"},
      {"id": 3, "title": "History Quiz"},
      {"id": 4, "title": "English Exam"},
      {"id": 5, "title": "Arabic Exam"},
    ];

    allExams = response;
    totalPages = (allExams.length / perPage).ceil();
    applyPagination();

    setState(() {
      isLoading = false;
    });
  }

  void applyPagination() {
    final start = (currentPage - 1) * perPage;
    final end = start + perPage;
    pagedExams = allExams.sublist(
      start,
      end > allExams.length ? allExams.length : end,
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
          padding: EdgeInsets.all(context.w(4)),
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
                            '📝 Exams',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            'View and take your exams',
                            style: TextStyle(color: Colors.white, fontSize: context.w(3)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Exams',
                            style: TextStyle(color: Colors.white),
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
                                '${allExams.length}',
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
                      width: context.w(29),
                      height: context.h(9.6),
                      color: Color(0xFFEFF6FF),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '📋Not Started',
                            style: TextStyle(
                              color: Color(0xFF1D4ED8),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3)
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(9.6),
                      color: Color(0xFFFFF7ED),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFFEA580C),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '📋Not Started',
                            style: TextStyle(
                              color: Color(0xFFEA580C),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3)
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(9.6),
                      color: Color(0xFFF0FDF4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.2),
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            '📋Not Started',
                            style: TextStyle(
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(1.7)),

                // ********** عرض الامتحانات **********
                ...pagedExams.map((exam) {
                  return FilterContainer(
                    width: MediaQuery.sizeOf(context).width,
                    height: context.h(22),
                    color: Color(0xFFFEF2F2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              exam["title"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.w(4.2),
                              ),
                            ),
                            SizedBox(width: context.w(0.5)),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/api/student/exam/${exam["id"]}/questions',
                                );
                              },
                              child: Text('Start Exam'),
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


