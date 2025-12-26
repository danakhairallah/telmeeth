import 'package:flutter/material.dart';
import 'package:telmeeth1/screens/class_schedule.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text('Bushra Gogazeh'), accountEmail: Text('bushraahmad@gmail.com') , arrowColor: Colors.white,),
          ListTile(title: Text('📅 Class schedule'), onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ClassSchedule(),));
          } ,),
          ListTile(title: Text('🧪 Exams'),),
          ListTile(title: Text('📄 Worksheets'),),
          ListTile(title: Text('🎥 Live Lessons'),),
          ListTile(title: Text('📎 Attachments'),),
          ListTile(title: Text('📝 Notes'),),
          ListTile(title: Text('✏️ Bookmarks'),),
          ListTile(title: Text('🗺 Study Plan'),),
          ListTile(title: Text('📅 Schedule'),),
          ListTile(title: Text('📋 Attendance'),),
          ListTile(title: Text('💯 Grades & Results'),),
          ListTile(title: Text('⭐ Behaviors'),),
          ListTile(title: Text('📊 Reports'),),
          ListTile(title: Text('💬 Messages'),),
          ListTile(title: Text('📣 Announcements'),),
          ListTile(title: Text('📆 School Days'),),
          ListTile(title: Text('🤖 Smart Assistant'),),
          ListTile(title: Text('👥👥 Community'),),
          ListTile(title: Text('📁 Student File'),),
          ListTile(title: Text('🚪Log Out'),),
        ],
      ),
    );
  }
}