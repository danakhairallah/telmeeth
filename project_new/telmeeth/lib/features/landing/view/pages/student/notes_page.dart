import 'package:flutter/material.dart';
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text(
          'Create Note',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create a new study note to keep track of important information.',
                style: TextStyle(fontSize: 11, color: Color(0xFF6C7A87))),
            const SizedBox(height: 11),
            const Text('Note Text *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              minLines: 4,
              maxLines: 7,
              autofocus: true,
              onChanged: (val) => noteText = val,
              decoration: InputDecoration(
                hintText: 'Enter your note here...',
                hintStyle: const TextStyle(fontSize: 11.5, color: Color(0xFFb8c2ca)),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.96),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Write your study notes, reminders, or key concepts",
              style: TextStyle(fontSize: 10, color: Color(0xFFb8c2ca)),
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
              if (noteText.trim().isNotEmpty) {
                setState(() {
                  notes.insert(0, noteText.trim());
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
              // Header
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
                            "My Notes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 18 : 23,
                              color: const Color(0xFF264566),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "Create and manage your personal study notes",
                            style: TextStyle(
                              fontSize: isMobile ? 9 : 13,
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right: New Note Button
                    SizedBox(
                      height: isMobile ? 30 : 39,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                        ),
                        onPressed: _showAddNoteDialog,
                        child: Row(
                          children: [
                            const Icon(Icons.add, color: Colors.white, size: 15),
                            const SizedBox(width: 4),
                            Text(
                              ' New Note',
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
              // Total Notes Card
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
                            Text("Total Notes", style: TextStyle(fontSize: isMobile ? 11 : 13, color: Colors.blueGrey[700], fontWeight: FontWeight.w700)),
                            const SizedBox(height: 4),
                            Text(
                              notes.length.toString(),
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
              // Notes List Box
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
                child: notes.isEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.note_alt, color: Colors.orange[200], size: isMobile ? 38 : 52),
                    const SizedBox(height: 8),
                    Text(
                      'No notes yet. Create your first study note!',
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
                    ...notes.asMap().entries.map((entry) => Padding(
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
                            Icon(Icons.note, color: Colors.orange[300], size: isMobile ? 20 : 23),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : 14.5,
                                  color: const Color(0xFF3C4552),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFe57373)),
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
