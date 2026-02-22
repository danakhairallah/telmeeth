import 'package:flutter/material.dart';
import 'package:telmeeth/features/landing/view/pages/student/task_details_page.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/student_features_app_bar.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Map<String, dynamic>> allTasks = [];
  List<Map<String, dynamic>> pagedTasks = [];

  int currentPage = 1;
  final int perPage = 2;
  int totalPages = 1;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  void fetchTasks() {
    allTasks = [
      {"id": 1, "title": "Math Quiz 1"},
      {"id": 2, "title": "Science Essay Assignment"},
      {"id": 3, "title": "English Homework"},
      {"id": 4, "title": "History Research"},
      {"id": 5, "title": "Physics Worksheet"},
    ];

    totalPages = (allTasks.length / perPage).ceil();
    applyPagination();
  }

  void applyPagination() {
    final start = (currentPage - 1) * perPage;
    final end = start + perPage;

    pagedTasks = allTasks.sublist(
      start,
      end > allTasks.length ? allTasks.length : end,
    );

    setState(() {});
  }

  void goToPage(int page) {
    currentPage = page;
    applyPagination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // الهيدر (كما هو)
                CustomContainer(
                  backgroundColor: const Color(0xFFF39F5F),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '✍️ Tasks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            'View and complete your assignments',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(3),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            'Total Tasks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.w(3.5),
                            ),
                          ),
                          SizedBox(height: context.h(0.6)),
                          Container(
                            width: context.w(9.7),
                            height: context.h(4.3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(context.h(0.7)),
                            ),
                            child: Center(
                              child: Text(
                                '${allTasks.length}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.h(1.6)),

                // الفلاتر (كما هي)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(10),
                      color: const Color(0xFFEFF6FF),
                      child: Column(
                        children: [
                          Text('0',
                              style: TextStyle(
                                  color: const Color(0xFF1D4ED8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.w(4))),
                          SizedBox(height: context.h(1)),
                          Text('📋Pending',
                              style: TextStyle(
                                  color: const Color(0xFF1D4ED8),
                                  fontSize: context.w(3))),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(10),
                      color: const Color(0xFFFFF7ED),
                      child: Column(
                        children: [
                          Text('0',
                              style: TextStyle(
                                  color: const Color(0xFFEA580C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.w(4))),
                          SizedBox(height: context.h(1)),
                          Text('⏳In Progress',
                              style: TextStyle(
                                  color: const Color(0xFFEA580C),
                                  fontSize: context.w(3))),
                        ],
                      ),
                    ),
                    FilterContainer(
                      width: context.w(29),
                      height: context.h(10),
                      color: const Color(0xFFF0FDF4),
                      child: Column(
                        children: [
                          Text('0',
                              style: TextStyle(
                                  color: const Color(0xFF16A34A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.w(4))),
                          SizedBox(height: context.h(1)),
                          Text('✅Completed',
                              style: TextStyle(
                                  color: const Color(0xFF16A34A),
                                  fontSize: context.w(3))),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.h(1.6)),

                // ********** كروت التاسكات مع زر التفاصيل البرتقالي **********
                ...pagedTasks.map((task) {
                  return Container(
                    margin: EdgeInsets.only(bottom: context.h(1.7)),
                    padding: EdgeInsets.symmetric(
                      vertical: context.h(2),
                      horizontal: context.w(4.2),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF2F2),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left: Title
                        Expanded(
                          child: Text(
                            task['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(4.3),
                              color: Colors.orange.shade800,
                            ),
                          ),
                        ),
                        // Right: Details Button (Orange)
                        SizedBox(width: context.w(1.5)),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF39F5F),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: context.h(1.1),
                              horizontal: context.w(2.7),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0.8,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3.2),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TaskDetailsPage(taskId: task['id']),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 17),
                          label: const Text('Details'),
                        ),
                      ],
                    ),
                  );
                }),

                // ********** Pagination Dots (رمادية وبرتقالية) **********
                SizedBox(height: context.h(1.5)),
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
                              ? const Color(0xFFF39F5F) // برتقالي للنقطة النشطة
                              : Colors.grey.shade400,   // رمادي للنقاط العادية
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            if (currentPage == (index + 1))
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.14),
                                blurRadius: 7,
                              )
                          ],
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
    );
  }
}
