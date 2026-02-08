import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/controllers/subject_controller.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/student/uints_page.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import 'package:provider/provider.dart';

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubjectController>().getSubjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectController>(
      builder: (context, controller, _) {
        final subjects = controller.subjectModel?.classes ?? [];

        return Scaffold(
          appBar: const StudentFeaturesAppBar(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(context.w(4)),
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : subjects.isEmpty
                  ? const Center(child: Text('No subjects found'))
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Header =====
                    CustomContainer(
                      backgroundColor: const Color(0xFFF39F5F),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📚 My Subjects',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.w(5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: context.h(0.8)),
                              Text(
                                controller.subjectModel?.student ?? "N/A",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.w(3)),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                'Total Subjects',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.w(3.5)),
                              ),
                              SizedBox(height: context.h(0.6)),
                              Container(
                                width: context.w(9.7),
                                height: context.h(4.3),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white,
                                      width: context.w(0.4)),
                                  borderRadius: BorderRadius.circular(context.h(0.7)),
                                ),
                                child: Center(
                                  child: Text(
                                    '${subjects.length}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.w(3)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: context.h(2)),

                    // ===== Subjects List =====
                    ...subjects.map((subject) {
                      return FilterContainer(
                        width: MediaQuery.sizeOf(context).width,
                        height: context.h(38),
                        child: Column(
                          children: [
                            // Subject Info
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: context.h(14),
                              padding: EdgeInsets.all(context.w(3.4)),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E8FFF),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(context.h(4)),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.menu_book_rounded,
                                    size: context.w(6),
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                  SizedBox(height: context.h(0.6)),
                                  Text(
                                    subject.subjectNameAr ?? "N/A",
                                    style: TextStyle(
                                        fontSize: context.w(4.3),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    subject.subjectNameEn ?? "N/A",
                                    style: TextStyle(
                                        fontSize: context.w(3.4),
                                        color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),

                            // Teacher Info
                            Container(
                              padding: EdgeInsets.all(context.w(3.8)),
                              width: MediaQuery.sizeOf(context).width,
                              height: context.h(10.9),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F2E9),
                                borderRadius: BorderRadius.circular(context.h(3)),
                              ),
                              margin: EdgeInsets.all(context.w(1.9)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Teacher🎓",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                            fontSize: context.w(3)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    subject.teacherNameAr ?? "N/A",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: context.w(3),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    subject.teacherNameEn ?? "N/A",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: context.w(3)),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: context.h(0.5)),

                            // View Units Button
                            // ===== View Units Button =====
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.w(1.9)),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  final classId = subject.classId ?? 0; // ID الصف
                                  final className = subject.subjectNameAr ?? "Unit"; // اسم الوحدة/الصف

                                  if (classId != 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UnitPage(
                                          classId: classId,
                                          className: className, // ⬅ تمرير الاسم للعرض
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("لا توجد وحدة مرتبطة بهذا المادة")),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1E8FFF),
                                  fixedSize: Size(MediaQuery.sizeOf(context).width, context.h(4.3)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: context.h(1.3)),
                                ),
                                icon: const Icon(Icons.menu_book_outlined, color: Colors.white),
                                label: Text(
                                  "View Units",
                                  style: TextStyle(fontSize: context.w(3.4), color: Colors.white),
                                ),
                              ),
                            ),

                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
