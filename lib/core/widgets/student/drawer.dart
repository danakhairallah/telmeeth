/*import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
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

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.w(2.9), vertical: context.h(1.3)),
            color: Colors.white,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bushra Gogazeh',
              style: TextStyle(
              fontSize: context.w(5),
              fontWeight: FontWeight.bold,
              ),
              ),
            SizedBox(height: context.h(0.4)),
            Text('bushraahmad@gmail.com' , style: TextStyle(fontSize: context.w(3.2)),),
            ],
            ),
          ),

          ListTile(
            title: Text('📅 Class schedule' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassSchedule()),
              );
            },
          ),
          ListTile(
            title: Text('🧪 Exams' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exams()),
              );
            },
          ),
          ListTile(
            title: Text('📄 Worksheets' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkSheets()),
              );
            },
          ),
          ListTile(
            title: Text('🎥 Live Lessons' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LiveLessons()),
              );
            },
          ),
          ListTile(
            title: Text('📎 Attachments' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attachments()),
              );
            },
          ),
          ListTile(
            title: Text('📝 Notes' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesPage()),
              );
            },
          ),
          ListTile(
            title: Text('✏️ Bookmarks' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookMarks()),
              );
            },
          ),
          ListTile(
            title: Text('🗺 Study Plan' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudyPlan()),
              );
            },
          ),
          ListTile(
            title: Text('📅 Schedule' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Schedule()),
              );
            },
          ),
          ListTile(
            title: Text('📋 Attendance' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            },
          ),
          ListTile(
            title: Text('💯 Grades & Results' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradesResults()),
              );
            },
          ),
          ListTile(
            title: Text('⭐ Behaviors' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Behaviors()),
              );
            },
          ),
          ListTile(
            title: Text('📊 Reports' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reports()),
              );
            },
          ),
          ListTile(
            title: Text('💬 Messages' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Messages()),
              );
            },
          ),
          ListTile(
            title: Text('📣 Announcements' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Announcements()),
              );
            },
          ),
          ListTile(
            title: Text('📆 School Days' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchoolDays()),
              );
            },
          ),
          ListTile(
            title: Text('🤖 Smart Assistant' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SmartAssistant()),
              );
            },
          ),
          ListTile(
            title: Text('👥👥 Community' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Community()),
              );
            },
          ),
          ListTile(
            title: Text('📁 Student File' , style: TextStyle(fontSize: context.w(4.2)),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentFilePage()),
              );
            },
          ),
          ListTile(title: Text('🚪Log Out' , style: TextStyle(fontSize: context.w(4.2)),)),
        ],
      ),
    );
  }
}*/
