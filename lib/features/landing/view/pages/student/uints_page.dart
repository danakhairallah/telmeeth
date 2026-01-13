import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/lessons_controller.dart';
import 'package:telmeeth/core/api/controllers/unit_controller.dart';
import 'package:telmeeth/core/api/model/response/unite_model.dart';
import 'package:telmeeth/features/landing/view/pages/student/book_marks_page.dart';
import 'package:telmeeth/features/landing/view/pages/student/notes_page.dart';
// Replace with your custom AppBar if needed
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class UnitPage extends StatefulWidget {
  final int classId;
  final String className;

  const UnitPage({super.key, required this.classId, required this.className});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UnitController>(context, listen: false)
          .getUnitById(widget.classId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final unitController = Provider.of<UnitController>(context);

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      body: unitController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : unitController.unit == null ||
          unitController.unit!.units == null ||
          unitController.unit!.units!.isEmpty
          ? Center(
        child: Text(
          unitController.message ?? "No units available.",
          style: const TextStyle(
              fontSize: 17,
              color: Colors.orange,
              fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 600 ? 10 : 36,
          vertical: 28,
        ),
        itemCount: unitController.unit!.units!.length,
        itemBuilder: (context, index) {
          final unit = unitController.unit!.units![index];
          return UnitTile(unit: unit);
        },
      ),
    );
  }
}

class UnitTile extends StatefulWidget {
  final Units unit;

  const UnitTile({super.key, required this.unit});

  @override
  State<UnitTile> createState() => _UnitTileState();
}

class _UnitTileState extends State<UnitTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final lessonController = Provider.of<LessonController>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.12),
            blurRadius: 16,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: expanded ? Colors.orange.shade300 : Colors.orange.shade50,
          width: expanded ? 1.4 : 1,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.orange.withOpacity(0.13),
          highlightColor: Colors.orange.withOpacity(0.09),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          initiallyExpanded: expanded,
          onExpansionChanged: (value) {
            setState(() => expanded = value);
            if (value) {
              lessonController.getLessonById(widget.unit.id ?? 0);
            }
          },
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.menu_book, color: Colors.orange, size: 23),
          ),
          title: Text(
            widget.unit.name ?? "No name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width < 400 ? 15 : 18,
              color: Colors.orange.shade800,
            ),
          ),
          subtitle: Text(
            "Semester: ${widget.unit.semester ?? 'Unknown'}",
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          children: [
            if (lessonController.isLoading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (lessonController.lesson == null ||
                lessonController.lesson!.lessons == null ||
                lessonController.lesson!.lessons!.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Text(
                    "No lessons available for this unit.",
                    style: TextStyle(
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: lessonController.lesson!.lessons!.map((lesson) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.orange.withOpacity(0.23),
                          width: 0.7,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.10),
                            blurRadius: 10,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          lesson.name ?? "No title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade900,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: lesson.summary?.isNotEmpty == true
                            ? Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            lesson.summary!,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 12),
                          ),
                        )
                            : null,
                        trailing: Wrap(
                          spacing: 4,
                          children: [
                            IconButton(
                              tooltip: "Lesson Notes",
                              icon: Icon(Icons.note, color: Colors.orange[700]),
                              onPressed: () {
                                if (lesson.id != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          NotesPage(lessonId: lesson.id!),
                                    ),
                                  );
                                }
                              },
                            ),
                            IconButton(
                              tooltip: "Bookmarks",
                              icon: Icon(Icons.bookmark_border,
                                  color: Colors.deepOrange[400]),
                              onPressed: () {
                                if (lesson.id != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          BookMarks(lessonId: lesson.id!),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          // Optional: Show lesson details dialog or bottom sheet here
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
