import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';

/// =======================
/// Model
/// =======================
class MotivationalMessage {
  final String childName;
  final String message;
  final String? imagePath;

  MotivationalMessage({
    required this.childName,
    required this.message,
    this.imagePath,
  });
}

/// =======================
/// Screen
/// =======================
class MotivationalMessagesParent extends StatefulWidget {
  const MotivationalMessagesParent({super.key});

  @override
  State<MotivationalMessagesParent> createState() =>
      _MotivationalMessagesParentState();
}

class _MotivationalMessagesParentState
    extends State<MotivationalMessagesParent> {
  final List<MotivationalMessage> messages = [];

  final List<String> children = ["Child", "Ahmed", "Sara"];

  void _openMessageDialog({MotivationalMessage? message, int? index}) {
    String? selectedChild = message?.childName;
    final controller = TextEditingController(text: message?.message);
    String? imagePath;

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Create Message",
                        style: TextStyle(
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
                  DropdownButtonFormField<String>(
                    value: selectedChild,
                    items: children
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) => selectedChild = v,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// Image picker (رجعناه)
                  const Text(
                    "Image (optional)",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: file_picker
                      imagePath = "dummy_path";
                    },
                    icon: const Icon(
                      Icons.upload_file,
                      size: 18,
                      color: Color(0xFF0F4C5C),
                    ),
                    // لون الأيقونة
                    label: const Text(
                      "Choose File",
                      style: TextStyle(
                        color: Color(0xFF0F4C5C), // لون النص
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xFF0F4C5C), // لون النص زر الإلغاء
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8C00),
                          // برتقالي مشرق
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (selectedChild == null || controller.text.isEmpty)
                            return;

                          setState(() {
                            final newMessage = MotivationalMessage(
                              childName: selectedChild!,
                              message: controller.text,
                              imagePath: imagePath,
                            );

                            if (index != null) {
                              messages[index] = newMessage;
                            } else {
                              messages.add(newMessage);
                            }
                          });

                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
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
            // العنوان مع زر الإنشاء
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
                    backgroundColor: const Color(0xFFFF8C00), // برتقالي مشرق
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
              child: ListView.separated(
                itemCount: messages.length,
                separatorBuilder: (_, __) => SizedBox(height: context.h(2)),
                itemBuilder: (context, index) {
                  final msg = messages[index];

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
                        const Text(
                          "Child",
                          style: TextStyle(
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
                                  ), // أزرق داكن
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    color: const Color(0xFF0F4C5C), // أزرق داكن
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    messages.removeAt(index);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF8C00),
                                  // برتقالي مشرق
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
