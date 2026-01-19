import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/study_plan_controller.dart';
import 'package:telmeeth/core/api/student/model/request/study_plan_request.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class StudyPlan extends StatefulWidget {
  const StudyPlan({super.key});

  @override
  State<StudyPlan> createState() => _StudyPlanState();
}

class _StudyPlanState extends State<StudyPlan> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StudyPlanController>().getStudyPlans();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: Consumer<StudyPlanController>(
            builder: (context, controller, _) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // HEADER
                    CustomContainer(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Study Plans',
                                style: TextStyle(
                                  fontSize: context.w(5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: context.w(2)),
                              const Icon(Icons.menu_book),
                            ],
                          ),
                          SizedBox(height: context.h(0.8)),
                          Text(
                            'Manage your AI-generated study schedules',
                            style: TextStyle(fontSize: context.w(3)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h(2)),

                    // EMPTY STATE
                    if (controller.plans.isEmpty)
                      DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: [6, 4],
                        strokeWidth: 1.5,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffF9FAFB),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.menu_book_outlined,
                                size: 40,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "No Study Plans Yet",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Create your first AI-powered study plan\nto get personalized learning schedules",
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () => _showCreatePlanDialog(context),
                                child: const Text(
                                  "Create Your First Plan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.plans.length,
                        separatorBuilder: (_, __) =>
                            SizedBox(height: context.h(1)),
                        itemBuilder: (context, index) {
                          final plan = controller.plans[index];
                          print("Plan at index $index has id: ${plan.id}");


                          return CustomContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        plan.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: context.w(4),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                                      onPressed: () async {
                                        print("Trying to delete plan with id: ${plan.id}");
                                        final deleted = await controller.deleteStudyPlan(plan.id);
                                        if (!mounted) return;
                                        if (deleted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text("تم حذف الخطة بنجاح")),
                                          );  
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text("فشل حذف الخطة!")),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.h(0.5)),
                                Text(
                                  plan.aiResponse,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: context.h(0.5)),
                                Text(
                                  '${plan.startDate} → ${plan.endDate}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showCreatePlanDialog(BuildContext context) {
    final titleController = TextEditingController();
    final controller = context.read<StudyPlanController>();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Create New Study Plan"),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: "Plan Title",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await controller.createPlan(
                StudyPlanRequest(
                  title: titleController.text,
                  subjects: [],
                  availableHoursPerDay: 2,
                  daysOff: [],
                  goal: "Improve grades",
                  preferredStudyTime: "morning",
                  semesterStart: "2024-01-01",
                  semesterEnd: "2024-06-01",
                ),
              );
              if (mounted) Navigator.pop(context);
              // بعد الإنشاء، إذا الاستجابة فيها ai_response أعرض ديالوج بنجاح
              if (controller.response != null) {
                _showSuccessDialog(context, controller.response!);
              }
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  // ديالوج بعد نجاح إنشاء الخطة
  void _showSuccessDialog(BuildContext context, dynamic response) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(1.5))),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.celebration, color: Colors.orange, size: context.w(6)),
            SizedBox(width: context.w(1)),
            Text(
              "تم إنشاء خطتك بنجاح!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(4)),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ملخص الذكاء الاصطناعي للخطة:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(2.7)),
              ),
              SizedBox(height: context.h(1)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.w(2)),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7EB),
                  borderRadius: BorderRadius.circular(context.h(1)),
                ),
                child: Text(
                  response.aiResponse ?? '',
                  style: TextStyle(fontSize: context.w(2.8), color: Color(0xFF7A5B27)),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text("تم", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: context.w(3))),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
