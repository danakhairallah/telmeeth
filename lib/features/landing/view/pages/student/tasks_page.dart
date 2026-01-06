import 'package:flutter/material.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

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
    // 🔹 مثال بيانات (استبدليها بالـ API)
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
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: SingleChildScrollView(
            child: Column(
              children: [

                /// ===== كل التصميم الأصلي (بدون أي تغيير) =====
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

                /// ===== البوكسات الثلاثة (بدون تغيير) =====
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

                /// ===== عرض التاسكات مع pagination =====
                ...pagedTasks.map((task) {
                  return Column(
                    children: [
                      FilterContainer(
                        width: MediaQuery.sizeOf(context).width,
                        height: context.h(22),
                        color: const Color(0xFFFEF2F2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  task['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.w(4.2),
                                  ),
                                ),
                                SizedBox(width: context.w(0.5)),
                                IconButton(
                                  icon: const Icon(Icons.close, color: Colors.red),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.h(2)),
                    ],
                  );
                }),

                /// ===== pagination دائري =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(totalPages, (index) {
                    final page = index + 1;
                    return GestureDetector(
                      onTap: () => goToPage(page),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: context.w(1)),
                        width: context.w(8),
                        height: context.w(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == page
                              ? Colors.blue
                              : Colors.white,
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Center(
                          child: Text(
                            '$page',
                            style: TextStyle(
                              color: currentPage == page
                                  ? Colors.white
                                  : Colors.blue,
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
