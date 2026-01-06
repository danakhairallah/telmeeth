import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> notes = [];

  void _showAddNoteDialog() {
    String noteText = '';
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor:  Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(1.5))),
        title: Text(
          'Create Note',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(4.1)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create a new study note to keep track of important information.',
                style: TextStyle(fontSize: context.w(2.6), color: Color(0xFF6C7A87))),
            SizedBox(height: context.h(1.2)),
            Text('Note Text *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(2.9))),
            SizedBox(height: context.h(0.4)),
            TextField(
              minLines: 4,
              maxLines: 7,
              autofocus: true,
              onChanged: (val) => noteText = val,
              decoration: InputDecoration(
                hintText: 'Enter your note here...',
                hintStyle: TextStyle(fontSize: context.w(2.7), color: Color(0xFFb8c2ca)),
                contentPadding: EdgeInsets.all(context.w(1.9)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.h(0.7)),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.96),
              ),
            ),
            SizedBox(height: context.h(0.6)),
            Text(
              "Write your study notes, reminders, or key concepts",
              style: TextStyle(fontSize: context.w(2.4), color: Color(0xFFb8c2ca)),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel', style: TextStyle(fontSize: context.w(2.9))),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA962),
              padding: EdgeInsets.symmetric(horizontal: context.w(5), vertical: context.h(0.8)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(0.8))),
            ),
            onPressed: () {
              if (noteText.trim().isNotEmpty) {
                setState(() {
                  notes.insert(0, noteText.trim());
                });
                Navigator.pop(ctx);
              }
            },
            child: Text('Create', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: context.w(2.9))),
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
          padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.4) : context.w(7.2), vertical: isMobile ? context.h(1) : context.h(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(3.4) : context.w(5.3), vertical: isMobile ? context.h(1.3) : context.h(1.9)),
                margin: EdgeInsets.only(bottom: context.h(1.5)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
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
                            "My Notes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? context.w(4.3) : context.w(5.5),
                              color: const Color(0xFF264566),
                            ),
                          ),
                          SizedBox(height: context.h(0.3)),
                          Text(
                            "Create and manage your personal study notes",
                            style: TextStyle(
                              fontSize: isMobile ? context.w(2.1) : context.w(3.1),
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right: New Note Button
                    SizedBox(
                      height: isMobile ? context.h(3.2) : context.h(4.2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.9) : context.w(3.8)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(0.8))),
                          elevation: 0,
                        ),
                        onPressed: _showAddNoteDialog,
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Colors.white, size: context.w(3.6)),
                            SizedBox(width: context.w(0.9)),
                            Text(
                              ' New Note',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? context.w(2.7) : context.w(3.4),
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
              // Total Notes Card
              Container(
                margin: EdgeInsets.only(bottom: context.h(1.7)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(1.6) : context.h(2), horizontal: isMobile ? context.w(2.9) : context.w(5.3)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(context.h(1.3)),
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
                            Text("Total Notes", style: TextStyle(fontSize: isMobile ? context.w(2.6) : context.w(3.1), color: Colors.blueGrey[700], fontWeight: FontWeight.w700)),
                            SizedBox(height: context.h(0.4)),
                            Text(
                              notes.length.toString(),
                              style: TextStyle(
                                color: const Color(0xFFf59e42),
                                fontSize: isMobile ? context.w(5.5) : context.w(7.5),
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
              // Notes List Box
              Container(
                width: MediaQuery.sizeOf(context).width,
                margin: EdgeInsets.only(bottom: context.h(2)),
                padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(2) : context.h(3.2)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.h(1.4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: notes.isEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.note_alt, color: Colors.orange[200], size: isMobile ? context.w(9.2) : context.w(12.6)),
                    SizedBox(height: context.h(0.8)),
                    Text(
                      'No notes yet. Create your first study note!',
                      style: TextStyle(
                        fontSize: isMobile ? context.w(2.9) : context.w(3.8),
                        color: const Color(0xFF6C7A87),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...notes.asMap().entries.map((entry) => Padding(
                      padding: EdgeInsets.symmetric(vertical: context.h(0.5), horizontal: context.w(3.1)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDF6E8),
                          borderRadius: BorderRadius.circular(context.h(0.8)),
                        ),
                        padding: EdgeInsets.all(context.h(1)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.note, color: Colors.orange[300], size: isMobile ? context.w(5) : context.w(5.5)),
                            SizedBox(width: context.w(1.9)),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: isMobile ? context.w(2.9) : context.w(3.5),
                                  color: const Color(0xFF3C4552),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline, size: context.w(4.3), color: Color(0xFFe57373)),
                              onPressed: () {
                                setState(() => notes.removeAt(entry.key));
                              },
                              tooltip: 'Delete Note',
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
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}