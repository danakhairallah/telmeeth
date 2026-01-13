import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/exam_controller.dart';
import 'package:telmeeth/features/landing/view/pages/student/exam_question_page.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/student_features_app_bar.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  int currentPage = 1;
  final int perPage = 2;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ExamController>().getExam();
    });
  }

  void goToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: Consumer<ExamController>(
            builder: (context, controller, child) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final allExams = controller.examModel?.data ?? <dynamic>[];
              final totalPages = (allExams.length / perPage).ceil();

              final start = (currentPage - 1) * perPage;
              final end = (start + perPage) > allExams.length
                  ? allExams.length
                  : start + perPage;

              final pagedExams = allExams.isEmpty
                  ? <dynamic>[]
                  : allExams.sublist(start, end);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // ===== Header =====
                    CustomContainer(
                      backgroundColor: const Color(0xFFF39F5F),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📝 Exams',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.w(5.2),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: context.h(0.8)),
                              Text(
                                'View and take your exams',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.w(3.1),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const Text('Total Exams',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: context.h(0.7)),
                              Container(
                                width: context.w(9.7),
                                height: context.h(4.3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.circular(context.h(0.7)),
                                ),
                                child: Center(
                                  child: Text(
                                    '${allExams.length}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: context.w(3.1),
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

                    SizedBox(height: context.h(1.7)),

                    // ===== Exams List =====
                    if (pagedExams.isEmpty)
                      Column(
                        children: [
                          Icon(Icons.info_outline,
                              size: context.w(11), color: Colors.orange),
                          SizedBox(height: context.h(1)),
                          Text('No exams available',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: context.w(3.1))),
                        ],
                      )
                    else
                      ...pagedExams.map((exam) {
                        return Container(
                          margin: EdgeInsets.only(bottom: context.h(1.4)),
                          padding: EdgeInsets.all(context.w(3)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF6ED),
                            borderRadius: BorderRadius.circular(context.h(1.1)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      exam.title ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: context.w(4.1),
                                        color: Color(0xFF27313F),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.assignment,
                                      color: Colors.orange.shade400),
                                ],
                              ),
                              SizedBox(height: context.h(0.7)),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ExamQuestionsPage(
                                        examId: exam.id!,
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.play_arrow,
                                    color: Colors.white, size: context.w(3.6)),
                                label: Text(
                                  'Start Exam',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.w(3.1),
                                      color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF39F5F),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.w(5),
                                    vertical: context.h(1),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        context.h(0.7)),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),

                    SizedBox(height: context.h(1.6)),

                    // ===== Pagination =====
                    if (totalPages > 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(totalPages, (index) {
                          final page = index + 1;
                          return GestureDetector(
                            onTap: () => goToPage(page),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: context.w(1.1)),
                              width: context.w(8),
                              height: context.w(8),
                              decoration: BoxDecoration(
                                color: currentPage == page
                                    ? Color(0xFFF39F5F)
                                    : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xFFF39F5F)),
                              ),
                              child: Center(
                                child: Text(
                                  '$page',
                                  style: TextStyle(
                                    color: currentPage == page
                                        ? Colors.white
                                        : Color(0xFFF39F5F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.w(3),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
