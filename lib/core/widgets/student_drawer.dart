import 'package:flutter/material.dart';

class StudentDrawer extends StatelessWidget {
  final Function(int) onSelect;

  const StudentDrawer({
    super.key,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Bushra Gogazeh'),
            accountEmail: Text('bushraahmad@gmail.com'),
          ),

          ListTile(title: Text('📅 Class schedule')),
          ListTile(title: Text('🧪 Exams')),
          ListTile(title: Text('📄 Worksheets')),
          ListTile(title: Text('🎥 Live Lessons')),
          ListTile(title: Text('📎 Attachments')),
          ListTile(title: Text('📝 Notes')),
          ListTile(title: Text('✏️ Bookmarks')),
          ListTile(title: Text('🗺 Study Plan')),
          ListTile(title: Text('📋 Attendance')),
          ListTile(title: Text('💯 Grades & Results')),

          /// ⭐ Student File
          ListTile(
            title: const Text('📁 Student File'),
            onTap: () {
              onSelect(1);
              Navigator.pop(context);
            },
          ),

          ListTile(title: Text('🚪 Log Out')),
        ],
      ),
    );
  }
}
