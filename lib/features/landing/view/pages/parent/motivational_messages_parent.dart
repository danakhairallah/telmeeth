import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/motivational_messages_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/my_children_controller.dart';
import 'package:telmeeth/core/api/parent/controllers/student_controller.dart';
import 'package:telmeeth/core/api/parent/model/response/motivational_message_model.dart';
import 'package:telmeeth/core/api/parent/model/response/student_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';

class MotivationalMessagesParent extends StatefulWidget {
  const MotivationalMessagesParent({super.key});

  @override
  State<MotivationalMessagesParent> createState() => _MotivationalMessagesParentState();
}

class _MotivationalMessagesParentState extends State<MotivationalMessagesParent> {
  int? selectedStudentId;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StudentController>().loadMyStudents();
      context.read<MotivationalMessagesController>().loadMessages();
    });
  }

  void _openMessageDialog({
    MotivationalMessageModel? message,
    int? index,
  }) {
    selectedStudentId = message?.studentId;
    final controller = TextEditingController(text: message?.message ?? "");
    File? pickedImage;
    String? imageFileName;

    showDialog(
      context: context,
      builder: (context) {
        final isMobile = MediaQuery.of(context).size.width < 600;

        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Container(
            width: isMobile ? double.infinity : 420,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child:
              StatefulBuilder(
                builder: (context, setState) {
                  final isLoading =
                      context.watch<MotivationalMessagesController>().isLoading;

                  return Stack(
                    children: [
                      Opacity(
                        opacity: isLoading ? 0.6 : 1.0,
                        child: AbsorbPointer(
                          absorbing: isLoading,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Header
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    message == null ? "Create Message" : "Edit Message",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(Icons.close),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              /// Child
                              const Text(
                                "Child *",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              Consumer<StudentController>(
                                builder: (context, childrenController, _) {
                                  if (childrenController.isLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (childrenController.errorMessage != null) {
                                    return const Text('Error loading students');
                                  }
                                  final students = childrenController.students;
                                  return DropdownButtonFormField<int>(
                                    value: selectedStudentId,
                                    items: students
                                        .map(
                                          (student) => DropdownMenuItem<int>(
                                        value: student.id,
                                        child: Text(student.nameAr),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (v) =>
                                        setState(() => selectedStudentId = v),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 14),

                              /// Message
                              const Text(
                                "Message *",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: controller,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              /// Image
                              const Text(
                                "Image (optional)",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              OutlinedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    pickedImage = null;
                                    imageFileName = "chosen.jpg";
                                  });
                                },
                                icon: const Icon(Icons.upload_file,
                                    size: 18, color: Color(0xFF0F4C5C)),
                                label: Text(
                                  imageFileName ?? "Choose File",
                                  style:
                                  const TextStyle(color: Color(0xFF0F4C5C)),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// Actions
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancel"),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (selectedStudentId == null ||
                                          controller.text.isEmpty) return;

                                      if (message == null) {
                                        await context
                                            .read<MotivationalMessagesController>()
                                            .createMessage(
                                          studentId: selectedStudentId!,
                                          message: controller.text,
                                          image: pickedImage,
                                        );
                                      } else {
                                        await context
                                            .read<MotivationalMessagesController>()
                                            .updateMessage(
                                          id: message.id,
                                          message: controller.text,
                                          image: pickedImage,
                                        );
                                      }

                                      if (mounted) Navigator.pop(context);
                                    },
                                    child: const Text("Save"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Loader overlay
                      if (isLoading)
                        Positioned.fill(
                          child: Container(
                            color: Colors.white.withOpacity(0.4),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? context.w(4) : context.w(8),
          vertical: context.h(2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Motivational Messages",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? context.w(6) : context.w(7),
                        ),
                      ),
                      SizedBox(height: context.h(0.6)),
                      Text(
                        "Send motivational messages to your children",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: isMobile ? context.w(3) : context.w(3.6),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _openMessageDialog(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8C00),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(4),
                      vertical: context.h(1.2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Create Message",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.h(3)),

            Expanded(
              child: Consumer<MotivationalMessagesController>(
                builder: (context, controller, _) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.errorMessage != null) {
                    return Center(child: Text(controller.errorMessage!));
                  }
                  if (controller.messages.isEmpty) {
                    return Center(
                      child: Text(
                        "No motivational messages yet.",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: isMobile ? context.w(3) : context.w(3.6),
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: controller.messages.length,
                    separatorBuilder: (_, __) => SizedBox(height: context.h(2)),
                    itemBuilder: (context, index) {
                      final msg = controller.messages[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE5E9F2)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg.studentName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              msg.message,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                            if (msg.imageUrl != null && msg.imageUrl!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 8),
                                child: Image.network(
                                  msg.imageUrl!,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () => _openMessageDialog(
                                      message: msg,
                                      index: index,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Color(0xFF0F4C5C),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: Color(0xFF0F4C5C),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await context
                                          .read<MotivationalMessagesController>()
                                          .deleteMessage(msg.id);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF8C00),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
