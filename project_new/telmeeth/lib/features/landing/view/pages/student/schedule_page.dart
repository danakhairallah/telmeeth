import 'package:flutter/material.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<Map<String, dynamic>> schedules = [];

  Future<void> _showAddScheduleDialog(BuildContext context) async {
    String taskName = '';
    String? selectedDay;
    String status = 'pending';
    TimeOfDay? startTime;
    TimeOfDay? endTime;
    String? description = '';

    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    final statuses = [
      'pending',
      'in progress',
      'completed',
      'cancelled',
    ];

    Map<String, dynamic>? result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            // اختر الوقت
            Future<void> pickStartTime() async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  startTime = picked;
                  if (endTime != null) {
                    if (picked.hour > endTime!.hour || (picked.hour == endTime!.hour && picked.minute >= endTime!.minute)) {
                      endTime = null;
                    }
                  }
                });
              }
            }

            Future<void> pickEndTime() async {
              final picked = await showTimePicker(
                context: context,
                initialTime: startTime ?? TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  endTime = picked;
                });
              }
            }

            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              titlePadding: const EdgeInsets.fromLTRB(18, 16, 18, 6),
              contentPadding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add New Schedule',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fill in the details to create a new schedule event.',
                      style: TextStyle(fontSize: 11, color: Color(0xFF6C7A87)),
                    ),
                    const SizedBox(height: 14),
                    const Text('Task *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    TextField(
                      onChanged: (v) => taskName = v,
                      decoration: InputDecoration(
                        hintText: 'Enter task name',
                        hintStyle: const TextStyle(fontSize: 11.5, color: Color(0xFFB8C2CA)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('Day *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    DropdownButtonFormField<String>(
                      value: selectedDay,
                      items: days.map(
                            (d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12))),
                      ).toList(),
                      onChanged: (v) => setState(() => selectedDay = v),
                      decoration: InputDecoration(
                        hintText: 'Select a day',
                        hintStyle: const TextStyle(fontSize: 11.5, color: Color(0xFFB8C2CA)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Start Time *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              InkWell(
                                onTap: () => pickStartTime(),
                                child: _timeBox(startTime != null ? startTime!.format(context) : '--:--'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('End Time *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              InkWell(
                                onTap: startTime == null ? null : () => pickEndTime(),
                                child: AbsorbPointer(
                                  absorbing: startTime == null,
                                  child: _timeBox(
                                    endTime != null ? endTime!.format(context) : '--:--',
                                    disabled: startTime == null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text('Status', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    DropdownButtonFormField<String>(
                      value: status,
                      items: statuses.map(
                            (s) => DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(fontSize: 12))),
                      ).toList(),
                      onChanged: (v) => setState(() => status = v!),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text('Description', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    TextField(
                      minLines: 3,
                      maxLines: 4,
                      onChanged: (v) => description = v,
                      decoration: InputDecoration(
                        hintText: 'Add any additional details...',
                        hintStyle: const TextStyle(fontSize: 11.5, color: Color(0xFFB8C2CA)),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
              actionsPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA962),
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (taskName.trim().isEmpty ||
                        selectedDay == null ||
                        startTime == null ||
                        endTime == null) {
                      // ممكن تنبيه هنا
                      return;
                    }
                    // رجّع الداتا للصفحة الرئيسية
                    Navigator.pop(ctx, {
                      'title': taskName.trim(),
                      'day': selectedDay,
                      'status': status,
                      'time': "${startTime!.format(context)} - ${endTime!.format(context)}",
                      'description': description,
                    });
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        schedules.insert(0, result);
      });
    }
  }

  Widget _timeBox(String text, {bool disabled = false}) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: disabled ? Colors.grey[200] : Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 12, color: disabled ? const Color(0xFFCBD5E1) : const Color(0xFF334155))),
          const Icon(Icons.access_time, size: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF6F2EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 30, vertical: isMobile ? 10 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 22, vertical: isMobile ? 12 : 18),
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.09),
                      blurRadius: 9,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Schedule",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 18 : 23,
                              color: const Color(0xFF264566),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "Add and manage your scheduled events",
                            style: TextStyle(
                              fontSize: isMobile ? 9 : 13,
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? 30 : 39,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                        ),
                        onPressed: () => _showAddScheduleDialog(context),
                        child: Row(
                          children: [
                            const Icon(Icons.add, color: Colors.white, size: 15),
                            const SizedBox(width: 4),
                            Text(
                              ' Add Event',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 11.5 : 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: schedules.isEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month, color: Colors.orange[200], size: isMobile ? 38 : 52),
                    const SizedBox(height: 8),
                    Text(
                      'No scheduled events. Click "Add Event" to create one.',
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 16,
                        color: const Color(0xFF6C7A87),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...schedules.asMap().entries.map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 13),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDF6E8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.calendar_today, color: Colors.orange[300], size: isMobile ? 19 : 22),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.value['title'],
                                    style: TextStyle(
                                      fontSize: isMobile ? 12 : 15,
                                      color: const Color(0xFF3C4552),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Text('Day: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 11 : 13)),
                                      Text(entry.value['day'], style: TextStyle(fontSize: isMobile ? 11 : 13, color: Colors.blueGrey[700])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Time: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 11 : 13)),
                                      Text(entry.value['time'], style: TextStyle(fontSize: isMobile ? 11 : 13, color: Colors.blueGrey[700])),
                                    ],
                                  ),
                                  if (entry.value['description'] != null && (entry.value['description'] as String).trim().isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(entry.value['description'],
                                        style: TextStyle(fontSize: isMobile ? 11 : 13, color: const Color(0xFF5B5B5B)),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Row(
                                      children: [
                                        Text('Status: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 11 : 13)),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFEAD1),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            entry.value['status'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: isMobile ? 10 : 12,
                                                color: const Color(0xFFB86412)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFe57373)),
                              onPressed: () {
                                setState(() => schedules.removeAt(entry.key));
                              },
                              tooltip: 'Delete Event',
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarPrimary(),
    );
  }
}
