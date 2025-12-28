import 'package:flutter/material.dart';
import '../../../features/landing/view/pages/student/announcements_page.dart';
import '../../../features/landing/view/pages/student/attachments_page.dart';
import '../../../features/landing/view/pages/student/attendance_page.dart';
import '../../../features/landing/view/pages/student/behaviors_page.dart';
import '../../../features/landing/view/pages/student/book_marks_page.dart';
import '../../../features/landing/view/pages/student/class_schedule_page.dart';
import '../../../features/landing/view/pages/student/community_page.dart';
import '../../../features/landing/view/pages/student/exams_page.dart';
import '../../../features/landing/view/pages/student/grades_results_page.dart';
import '../../../features/landing/view/pages/student/live_lessons_page.dart';
import '../../../features/landing/view/pages/student/messages_page.dart';
import '../../../features/landing/view/pages/student/notes_page.dart';
import '../../../features/landing/view/pages/student/reports_page.dart';
import '../../../features/landing/view/pages/student/schedule_page.dart';
import '../../../features/landing/view/pages/student/school_days_page.dart';
import '../../../features/landing/view/pages/student/smart_assistant_page.dart';
import '../../../features/landing/view/pages/student/student_file_page.dart';
import '../../../features/landing/view/pages/student/study_plan_page.dart';
import '../../../features/landing/view/pages/student/work_sheets_page.dart';
import '../../constants/responsive.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Bushra Gogazeh',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveValues.font(context, 20),
              ),
            ),
            accountEmail: Text(
              'bushraahmad@gmail.com',
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          ListTile(
            title: Text('📅 Class schedule'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassSchedule()),
              );
            },
          ),
          ListTile(
            title: Text('🧪 Exams'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exams()),
              );
            },
          ),
          ListTile(
            title: Text('📄 Worksheets'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkSheets()),
              );
            },
          ),
          ListTile(
            title: Text('🎥 Live Lessons'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LiveLessons()),
              );
            },
          ),
          ListTile(
            title: Text('📎 Attachments'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attachments()),
              );
            },
          ),
          ListTile(
            title: Text('📝 Notes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notes()),
              );
            },
          ),
          ListTile(
            title: Text('✏️ Bookmarks'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookMarks()),
              );
            },
          ),
          ListTile(
            title: Text('🗺 Study Plan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudyPlan()),
              );
            },
          ),
          ListTile(
            title: Text('📅 Schedule'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Schedule()),
              );
            },
          ),
          ListTile(
            title: Text('📋 Attendance'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            },
          ),
          ListTile(
            title: Text('💯 Grades & Results'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradesResults()),
              );
            },
          ),
          ListTile(
            title: Text('⭐ Behaviors'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Behaviors()),
              );
            },
          ),
          ListTile(
            title: Text('📊 Reports'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reports()),
              );
            },
          ),
          ListTile(
            title: Text('💬 Messages'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Messages()),
              );
            },
          ),
          ListTile(
            title: Text('📣 Announcements'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Announcements()),
              );
            },
          ),
          ListTile(
            title: Text('📆 School Days'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchoolDays()),
              );
            },
          ),
          ListTile(
            title: Text('🤖 Smart Assistant'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SmartAssistant()),
              );
            },
          ),
          ListTile(
            title: Text('👥👥 Community'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Community()),
              );
            },
          ),
          ListTile(
            title: Text('📁 Student File'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentFilePage()),
              );
            },
          ),
          ListTile(title: Text('🚪Log Out')),
        ],
      ),
    );
  }
}
