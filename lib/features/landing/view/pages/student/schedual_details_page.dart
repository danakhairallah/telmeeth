import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/schedual_controller.dart';
import 'package:telmeeth/core/api/student/model/request/schrdual_request.dart';
import 'package:telmeeth/core/api/student/model/response/schedual_model.dart' show ScheduleModel;
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/container.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/student/schedual_from_dialog.dart';

class ScheduleDetailsPage extends StatefulWidget {
  const ScheduleDetailsPage({super.key, required int scheduleId, required schedule});

  @override
  State<ScheduleDetailsPage> createState() => _ScheduleDetailsPageState();
}

class _ScheduleDetailsPageState extends State<ScheduleDetailsPage> {
  ScheduleModel? selectedSchedule;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SchedualController>();

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.w(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// عنوان الصفحة
              Text(
                'Schedule Management',
                style: TextStyle(
                  fontSize: context.w(5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.h(2)),

              /// زر إضافة جدول جديد
              ElevatedButton.icon(
                onPressed: () async {
                  final newSchedule = await showDialog<ScheduleModel>(
                    context: context,
                    builder: (_) => ScheduleFormDialog(),
                  );

                  if (newSchedule != null) {
                    await controller.addSchedual(
                      SchedualRequest(
                        day: newSchedule.day,
                        startTime: newSchedule.startTime,
                        endTime: newSchedule.endTime,
                        task: newSchedule.task,
                        description: newSchedule.description,
                        status: newSchedule.status,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Schedule'),
              ),

              SizedBox(height: context.h(2)),

              /// List of schedules
              Expanded(
                child: ListView.builder(
                  itemCount: controller.schedulesResponse?.data.length ?? 0,
                  itemBuilder: (context, index) {
                    final schedule =
                    controller.schedulesResponse!.data[index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: context.h(2)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSchedule = schedule;
                          });
                        },
                        child: FilterContainer(
                          width: double.infinity,
                          height: context.h(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Title + delete
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    schedule.task,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.w(4),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.red),
                                    onPressed: () async {
                                      await controller.deleteSchedual(
                                          id: schedule.id);
                                      if (selectedSchedule?.id ==
                                          schedule.id) {
                                        setState(() {
                                          selectedSchedule = null;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: context.h(1)),

                              /// Details
                              Text('Day: ${schedule.day}',
                                  style: TextStyle(fontSize: context.w(3.2))),
                              Text(
                                  'Time: ${schedule.startTime} - ${schedule.endTime}',
                                  style: TextStyle(fontSize: context.w(3.2))),
                              Text('Status: ${schedule.status}',
                                  style: TextStyle(fontSize: context.w(3.2))),
                              SizedBox(height: context.h(1)),
                              Text(schedule.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: context.w(3))),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// تفاصيل الجدول المحدد (Edit)
              if (selectedSchedule != null)
                FilterContainer(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Schedule Details',
                        style: TextStyle(
                          fontSize: context.w(4.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.h(1)),

                      Text('Task: ${selectedSchedule!.task}'),
                      Text(
                          'Time: ${selectedSchedule!.startTime} - ${selectedSchedule!.endTime}'),
                      Text('Day: ${selectedSchedule!.day}'),
                      Text('Status: ${selectedSchedule!.status}'),
                      SizedBox(height: context.h(1)),
                      Text('Description: ${selectedSchedule!.description}'),

                      SizedBox(height: context.h(1.5)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.edit),
                              label: const Text('Edit'),
                              onPressed: () async {
                                final updatedSchedule =
                                await showDialog<ScheduleModel>(
                                  context: context,
                                  builder: (_) => ScheduleFormDialog(
                                    schedule: selectedSchedule!,
                                  ),
                                );

                                if (updatedSchedule != null) {
                                  await controller.updateSchedual(
                                    id: selectedSchedule!.id,
                                    request: SchedualRequest(
                                      day: updatedSchedule.day,
                                      startTime: updatedSchedule.startTime,
                                      endTime: updatedSchedule.endTime,
                                      task: updatedSchedule.task,
                                      description: updatedSchedule.description,
                                      status: updatedSchedule.status,
                                    ),
                                  );

                                  setState(() {
                                    selectedSchedule = updatedSchedule;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(width: context.w(3)),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.close),
                              label: const Text('Clear Selection'),
                              onPressed: () {
                                setState(() {
                                  selectedSchedule = null;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

