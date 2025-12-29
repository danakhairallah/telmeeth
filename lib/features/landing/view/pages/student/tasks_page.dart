import 'package:flutter/material.dart';

import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/container.dart';
import '../../../../../core/widgets/student/custom_container1.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

import 'home1_page.dart';
import 'materials_page.dart';
import 'profile_page.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentAppBar(),
      drawer: const StudentDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ResponsiveValues.padding(context, 16)),
          child: Column(
            children: [
              /// Header
              CustomContainer(
                backgroundColor: const Color(0xFFF39F5F),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '✍️ Tasks',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'View and complete your assignments',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const Text(
                          'Total Tasks',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Status Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FilterContainer(
                    width: 110,
                    height: 80,
                    color: Color(0xFFEFF6FF),
                    child: _StatusBox(
                      count: '0',
                      label: '📋 Pending',
                      color: Color(0xFF1D4ED8),
                    ),
                  ),
                  FilterContainer(
                    width: 110,
                    height: 80,
                    color: Color(0xFFFFF7ED),
                    child: _StatusBox(
                      count: '0',
                      label: '⏳ In Progress',
                      color: Color(0xFFEA580C),
                    ),
                  ),
                  FilterContainer(
                    width: 110,
                    height: 80,
                    color: Color(0xFFF0FDF4),
                    child: _StatusBox(
                      count: '0',
                      label: '✅ Completed',
                      color: Color(0xFF16A34A),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Task Card 1
              _TaskCard(title: 'Math Quiz 1'),

              const SizedBox(height: 16),

              /// Task Card 2
              _TaskCard(title: 'Science Essay Assignment'),
            ],
          ),
        ),
      ),

      /// Bottom Navigation
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}

class _StatusBox extends StatelessWidget {
  final String count;
  final String label;
  final Color color;

  const _StatusBox({
    required this.count,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}

class _TaskCard extends StatelessWidget {
  final String title;

  const _TaskCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      width: double.infinity,
      height: 120,
      color: const Color(0xFFFEF2F2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveValues.font(context, 18),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFEFEFEF),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
