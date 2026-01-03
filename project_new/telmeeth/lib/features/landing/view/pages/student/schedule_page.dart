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

  void _showAddEventDialog() {
    String eventTitle = '';
    String eventDay = '';
    String eventTime = '';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text(
          'Add New Schedule',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Fill in the details to create a new schedule event.',
                style: TextStyle(fontSize: 11, color: Color(0xFF6C7A87))),
            const SizedBox(height: 11),
            const Text('Task *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              autofocus: true,
              onChanged: (val) => eventTitle = val,
              decoration: InputDecoration(
                hintText: 'Enter task name',
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFFb8c2ca)),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.96),
              ),
            ),
            const SizedBox(height: 8),
            const Text('Day *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              onChanged: (val) => eventDay = val,
              decoration: InputDecoration(
                hintText: 'e.g. Tuesday',
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFFb8c2ca)),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.96),
              ),
            ),
            const SizedBox(height: 8),
            const Text('Time *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              onChanged: (val) => eventTime = val,
              decoration: InputDecoration(
                hintText: 'e.g. 10:00 - 11:00',
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFFb8c2ca)),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.96),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel', style: TextStyle(fontSize: 12)),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA962),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              if (eventTitle.trim().isNotEmpty && eventDay.trim().isNotEmpty && eventTime.trim().isNotEmpty) {
                setState(() {
                  schedules.insert(0, {
                    'title': eventTitle.trim(),
                    'day': eventDay.trim(),
                    'time': eventTime.trim(),
                  });
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text('Create', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
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
              // Header Card + Add Event
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
                    // Left: Title & description
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
                    // Right: Add Event Button
                    SizedBox(
                      height: isMobile ? 30 : 39,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                        ),
                        onPressed: _showAddEventDialog,
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
              // Scheduled Events Count
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: isMobile ? 15 : 20, horizontal: isMobile ? 12 : 22),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.09),
                              blurRadius: 7,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Events", style: TextStyle(fontSize: isMobile ? 11 : 13, color: Colors.blueGrey[700], fontWeight: FontWeight.w700)),
                            const SizedBox(height: 4),
                            Text(
                              schedules.length.toString(),
                              style: TextStyle(
                                color: const Color(0xFFf59e42),
                                fontSize: isMobile ? 23 : 31,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Schedule List Box
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
                                  Text(
                                    'Day: ${entry.value['day']}',
                                    style: TextStyle(
                                      fontSize: isMobile ? 11 : 13,
                                      color: Colors.blueGrey[700],
                                    ),
                                  ),
                                  Text(
                                    'Time: ${entry.value['time']}',
                                    style: TextStyle(
                                      fontSize: isMobile ? 11 : 13,
                                      color: Colors.blueGrey[700],
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
