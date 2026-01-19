import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/schedual_controller.dart';
import 'package:telmeeth/core/api/student/model/response/schedual_model.dart';
import 'package:telmeeth/core/widgets/student/custom_container1.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/student/schedual_from_dialog.dart';
import '../../../../../core/constants/responsive.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int currentPage = 1;
  final int perPage = 2;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SchedualController>(context, listen: false).getScheduals();
    });
  }

  void goToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SchedualController>(context);

    final allSchedules = controller.schedulesResponse?.data ?? [];
    final totalPages = (allSchedules.length / perPage).ceil();

    // حماية من تجاوز الصفحات
    final start = (currentPage - 1) * perPage;
    final end = (start + perPage) > allSchedules.length
        ? allSchedules.length
        : start + perPage;
    final pagedSchedules = allSchedules.isEmpty
        ? <ScheduleModel>[]
        : allSchedules.sublist(start, end);

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : allSchedules.isEmpty
              ? const Center(child: Text("No schedules found."))
              : Column(
            children: [
              CustomContainer(
                backgroundColor: const Color(0xFFF39F5F),
                child: Padding(
                  padding: EdgeInsets.all(context.w(3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '📚 My Schedule',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: context.w(5),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.h(2)),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: pagedSchedules.length,
                        itemBuilder: (context, index) {
                          final schedule = pagedSchedules[index];
                          return CustomContainer(
                            child: Padding(
                              padding: EdgeInsets.all(context.w(3)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.event_note,
                                          color: Color(0xFFF39F5F),
                                          size: context.w(6)),
                                      SizedBox(width: context.w(1.5)),
                                      Expanded(
                                        child: Text(
                                          schedule.task,
                                          style: TextStyle(
                                            fontSize: context.w(4.2),
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF264566),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: context.h(0.7)),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_outlined,
                                          color: Colors.orange[200],
                                          size: context.w(4)),
                                      SizedBox(width: context.w(1)),
                                      Text(
                                        schedule.day,
                                        style: TextStyle(
                                            fontSize: context.w(3.2),
                                            color: Colors.orange[700]),
                                      ),
                                      SizedBox(width: context.w(3)),
                                      Icon(Icons.access_time,
                                          color: Colors.blue[200],
                                          size: context.w(4)),
                                      SizedBox(width: context.w(1)),
                                      Text(
                                        "${schedule.startTime} - ${schedule.endTime}",
                                        style: TextStyle(
                                            fontSize: context.w(3.1),
                                            color: Colors.blue[800]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: context.h(0.5)),
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: context.h(0.6)),
                                    child: Text(
                                      schedule.description,
                                      style: TextStyle(
                                          fontSize: context.w(3.2),
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Tooltip(
                                          message: "Edit",
                                          child: IconButton(
                                            icon: Icon(Icons.edit, color: Color(0xFFF39F5F)),
                                            onPressed: () async {
                                              final updatedSchedule =
                                              await showDialog<ScheduleModel>(
                                                context: context,
                                                builder: (_) => ScheduleFormDialog(
                                                    schedule: schedule),
                                              );
                                              if (updatedSchedule != null) {
                                                await controller.updateSchedual(
                                                  id: schedule.id,
                                                  request: updatedSchedule.toRequest(),
                                                );
                                                await controller.getScheduals();
                                              }
                                            },
                                          ),
                                        ),
                                        Tooltip(
                                          message: "Delete",
                                          child: IconButton(
                                            icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                                            onPressed: () async {
                                              final confirm = await showDialog<bool>(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: const Text("Confirm Delete"),
                                                  content: const Text(
                                                      "Are you sure you want to delete this schedule?"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(context, false),
                                                        child: const Text("Cancel")),
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(context, true),
                                                        child: const Text("Delete")),
                                                  ],
                                                ),
                                              );
                                              if (confirm == true) {
                                                await controller.deleteSchedual(id: schedule.id);
                                                await controller.getScheduals();
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // ---------- باجينشن (يمين - يسار) ----------
                    if (totalPages > 1)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: context.h(1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // زر يسار
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: currentPage > 1
                                  ? () => goToPage(currentPage - 1)
                                  : null,
                              color: Colors.orange[300],
                            ),
                            ...List.generate(totalPages, (index) {
                              final page = index + 1;
                              return GestureDetector(
                                onTap: () => goToPage(page),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  margin: EdgeInsets.symmetric(horizontal: context.w(1)),
                                  width: currentPage == page ? context.w(6) : context.w(4),
                                  height: context.w(4),
                                  decoration: BoxDecoration(
                                    color: currentPage == page
                                        ? Color(0xFFF39F5F)
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      if (currentPage == page)
                                        BoxShadow(
                                          color: Colors.orange.withOpacity(0.18),
                                          blurRadius: 7,
                                        )
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$page',
                                      style: TextStyle(
                                          color: currentPage == page
                                              ? Colors.white
                                              : Colors.orange[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            // زر يمين
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: currentPage < totalPages
                                  ? () => goToPage(currentPage + 1)
                                  : null,
                              color: Colors.orange[300],
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newSchedule = await showDialog<ScheduleModel>(
            context: context,
            builder: (_) => const ScheduleFormDialog(),
          );

          if (newSchedule != null) {
            final controller = Provider.of<SchedualController>(context, listen: false);
            await controller.addSchedual(newSchedule.toRequest());
            await controller.getScheduals();
            setState(() {}); // حتى يتم التحديث فورًا
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
