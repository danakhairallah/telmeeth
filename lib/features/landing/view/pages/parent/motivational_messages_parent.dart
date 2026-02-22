import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/motivational_messages_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';

class MotivationalMessagesForChildPage extends StatefulWidget {
  final int studentId;
  final String name;

  const MotivationalMessagesForChildPage({
    super.key,
    required this.studentId,
    required this.name,
  });

  @override
  State<MotivationalMessagesForChildPage> createState() =>
      _MotivationalMessagesForChildPageState();
}

class _MotivationalMessagesForChildPageState
    extends State<MotivationalMessagesForChildPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MotivationalMessagesController>().loadMessagesByStudent(
        widget.studentId,
      );
    });
  }

  // ================= CREATE / EDIT DIALOG =================
  void _openDialog({dynamic message}) {
    final textController = TextEditingController(text: message?.message ?? "");
    File? pickedImage;

    showDialog(
      context: context,
      builder: (_) {
        final controller = context.read<MotivationalMessagesController>();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                message == null ? "Create Message" : "Edit Message",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Write something motivational...",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.all(14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ===== Image Picker =====
                    GestureDetector(
                      onTap: () async {
                        final picker = ImagePicker();
                        final picked = await picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 70,
                        );

                        if (picked != null) {
                          setState(() {
                            pickedImage = File(picked.path);
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFFF8C00),
                            width: 1.4,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.image, color: Color(0xFFFF8C00)),
                            SizedBox(width: 8),
                            Text(
                              "Choose Image",
                              style: TextStyle(
                                color: Color(0xFFFF8C00),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ===== Preview =====
                    if (pickedImage != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          pickedImage!,
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    else if (message != null &&
                        message.imageUrl != null &&
                        message.imageUrl!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          message.imageUrl!,
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
              actionsPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: const Color(0xFFFF8C00),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: controller.isLoading
                      ? null
                      : () async {
                          if (textController.text.trim().isEmpty) return;

                          if (message == null) {
                            await controller.createMessage(
                              studentId: widget.studentId,
                              message: textController.text.trim(),
                              image: pickedImage,
                            );
                          } else {
                            await controller.updateMessage(
                              id: message.id,
                              message: textController.text.trim(),
                              image: pickedImage,
                            );
                          }

                          if (mounted) Navigator.pop(context);
                        },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MotivationalMessagesController>();
    final list = controller.messagesForChild;

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: const Color(0xffF4F6FA),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF8C00),
        elevation: 3,
        onPressed: () => _openDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== HEADER =====
            /// ===== PREMIUM HEADER =====
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: context.w(5),
                vertical: context.h(3),
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFF8C00), Color(0xFFE67600)],
                ),
                borderRadius: BorderRadius.circular(context.w(6)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF8C00).withOpacity(.35),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// TEXT SIDE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Motivational Messages",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.w(4.8),
                            color: Colors.white,
                            letterSpacing: .5,
                          ),
                        ),

                        SizedBox(height: context.h(.6)),

                        Text(
                          "Encourage your child with positive words",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.85),
                            fontSize: context.w(3.2),
                          ),
                        ),

                        SizedBox(height: context.h(1.2)),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.w(3),
                            vertical: context.h(.6),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.18),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: context.w(3.3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            ,
            SizedBox(height: context.h(3)),

            Expanded(
              child: controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFF8C00),
                      ),
                    )
                  : list.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: context.w(15),
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "No motivational messages yet.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: context.h(2)),
                      itemBuilder: (context, index) {
                        final msg = list[index];

                        return Container(
                          padding: EdgeInsets.all(context.w(4)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(context.w(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.05),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg.message,
                                style: TextStyle(
                                  fontSize: context.w(3.8),
                                  height: 1.5,
                                ),
                              ),

                              if (msg.imageUrl != null &&
                                  msg.imageUrl!.isNotEmpty) ...[
                                SizedBox(height: context.h(1.5)),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.network(
                                    msg.imageUrl!,
                                    height: context.h(18),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],

                              SizedBox(height: context.h(1.2)),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _actionIcon(
                                    Icons.edit,
                                    const Color(0xFFFF8C00),
                                    () => _openDialog(message: msg),
                                  ),
                                  SizedBox(width: context.w(2)),
                                  _actionIcon(
                                    Icons.delete,
                                    Colors.red,
                                    () => controller.deleteMessage(
                                      id: msg.id,
                                      studentId: widget.studentId,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionIcon(IconData icon, Color color, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onTap,
      ),
    );
  }
}
