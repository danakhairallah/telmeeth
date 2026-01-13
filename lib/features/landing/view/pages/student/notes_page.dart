import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/note_controller.dart';
import 'package:telmeeth/core/api/model/request/nots_request.dart';
import 'package:telmeeth/core/api/model/response/note_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class NotesPage extends StatefulWidget {
  final int lessonId;
  const NotesPage({super.key, required this.lessonId});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _noteTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NoteController>().getNoteById(widget.lessonId);
    });
  }

  /// ➕ ADD NOTE
  void _showEditNoteDialog(Note note) {
    final controller = context.read<NoteController>();
    _noteTextController.text = note.text ?? '';

    showDialog(
      context: context,
      builder: (_) => _buildStyledNoteDialog(
        title: 'Update Note',
        buttonText: 'Update',
        onSubmit: () async {
          final text = _noteTextController.text.trim();
          if (text.isEmpty) return;

          final success = await controller.updateNote(
            note.id!,
            NotsRequest(text: text),
          );

          if (success) {
            Navigator.pop(context);
            controller.getNoteById(widget.lessonId);
          }
        },
      ),
    );
  }

  /// ✏️ EDIT NOTE
  void _showAddNoteDialog() {
    final controller = context.read<NoteController>();
    _noteTextController.clear();

    showDialog(
      context: context,
      builder: (_) => _buildStyledNoteDialog(
        title: 'Create Note',
        buttonText: 'Create',
        onSubmit: () async {
          final text = _noteTextController.text.trim();
          if (text.isEmpty) return;

          final success = await controller.addNote(
            widget.lessonId,
            NotsRequest(text: text),
          );

          if (success) {
            Navigator.pop(context);
            controller.getNoteById(widget.lessonId);
          }
        },
      ),
    );
  }

  Widget _buildStyledNoteDialog({
    required String title,
    required String buttonText,
    required VoidCallback onSubmit,
  }) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.h(1.5)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: context.w(4.1),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create a new study note to keep track of important information.',
            style: TextStyle(
              fontSize: context.w(2.6),
              color: const Color(0xFF6C7A87),
            ),
          ),
          SizedBox(height: context.h(1.2)),
          Text(
            'Note Text *',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.w(2.9),
            ),
          ),
          SizedBox(height: context.h(0.4)),
          TextField(
            controller: _noteTextController,
            minLines: 4,
            maxLines: 7,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter your note here...',
              hintStyle: TextStyle(
                fontSize: context.w(2.7),
                color: const Color(0xFFb8c2ca),
              ),
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
            style: TextStyle(
              fontSize: context.w(2.4),
              color: const Color(0xFFb8c2ca),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: context.w(2.9)),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFA962),
            padding: EdgeInsets.symmetric(
              horizontal: context.w(5),
              vertical: context.h(0.8),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.h(0.8)),
            ),
          ),
          onPressed: onSubmit,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: context.w(2.9),
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Consumer<NoteController>(
      builder: (context, controller, _) {
        final note = controller.note;

        return Scaffold(
          appBar: const StudentFeaturesAppBar(),
          backgroundColor: const Color(0xFFF6F2EC),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? context.w(2.5) : context.w(7),
                vertical: context.h(1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  Container(
                    padding: EdgeInsets.all(context.h(1.6)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(context.h(1.4)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Note',
                                style: TextStyle(
                                  fontSize: context.w(4.5),
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF264566),
                                ),
                              ),
                              Text(
                                'Create and manage your study notes',
                                style: TextStyle(
                                  fontSize: context.w(2.6),
                                  color: Colors.blueGrey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA962),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text('Add Note',
                              style: TextStyle(color: Colors.white)),
                          onPressed: _showAddNoteDialog,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: context.h(2)),

                  /// NOTE CARD
                  Container(
                    padding: EdgeInsets.all(context.h(1.6)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(context.h(1.4)),
                    ),
                    child: note == null
                        ? Center(
                      child: Text(
                        'No notes yet.',
                        style: TextStyle(
                          fontSize: context.w(3),
                          color: Colors.grey,
                        ),
                      ),
                    )
                        : Container(
                      padding: EdgeInsets.all(context.h(1.4)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDF6E8),
                        borderRadius:
                        BorderRadius.circular(context.h(1)),
                      ),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.note,
                              color: Colors.orange[300],
                              size: context.w(5)),
                          SizedBox(width: context.w(2)),
                          Expanded(
                            child: Text(
                              note.text ?? '',
                              style: TextStyle(
                                fontSize: context.w(3),
                                color:
                                const Color(0xFF3C4552),
                              ),
                            ),
                          ),
                          IconButton(
                            tooltip: 'Edit Note',
                            icon: const Icon(Icons.edit,
                                color: Colors.orange),
                            onPressed: () =>
                                _showEditNoteDialog(note),
                          ),
                          IconButton(
                            tooltip: 'Delete Note',
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.red),
                            onPressed: () async {
                              await controller
                                  .deleteNote(note.id!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
