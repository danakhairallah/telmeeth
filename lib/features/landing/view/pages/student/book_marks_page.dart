import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/highlight_controller.dart';
import 'package:telmeeth/core/api/model/request/highlight_request.dart';
import 'package:telmeeth/core/api/model/response/highlight_data.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class BookMarks extends StatefulWidget {
  final int lessonId;
  const BookMarks({super.key, required this.lessonId});

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  final List<Color> highlightColors = [
    Colors.yellow,
    Colors.greenAccent.shade100,
    Colors.lightBlue.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.purple.shade200,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HighlightController>().getHighlights();
    });
  }

  // ================== ADD / UPDATE DIALOG ==================
  void _showHighlightDialog({HighlightData? existing}) {
    final textController =
    TextEditingController(text: existing?.text ?? '');

    Color selectedColor = existing != null
        ? Color(int.parse(existing.color!.replaceAll("#", "0xff")))
        : highlightColors.first;

    showDialog(
      context: context,
      builder: (dialogCtx) => StatefulBuilder(
        builder: (dialogCtx, setDialogState) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.h(1.3))),
          contentPadding: EdgeInsets.symmetric(
              horizontal: context.w(6), vertical: context.h(1.3)),
          title: Text(
            existing == null ? "Add New Highlight" : "Update Highlight",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.w(4.1),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: textController,
                minLines: 2,
                maxLines: 3,
                style: TextStyle(fontSize: context.w(2.6)),
                decoration: InputDecoration(
                  hintText: "Enter the text you want to highlight",
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(context.h(0.7))),
                ),
              ),
              SizedBox(height: context.h(1)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: highlightColors.map((c) {
                    final isSelected = selectedColor == c;
                    return GestureDetector(
                      onTap: () =>
                          setDialogState(() => selectedColor = c),
                      child: Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: context.w(0.6)),
                        padding: EdgeInsets.all(isSelected ? 3 : 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(
                              color: Colors.deepOrange, width: 2)
                              : null,
                        ),
                        child: CircleAvatar(
                          radius: context.h(1.5),
                          backgroundColor: c,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA962),
              ),
              onPressed: () async {
                if (textController.text.trim().isEmpty) return;

                final controller =
                context.read<HighlightController>();

                final request = HighlightRequest(
                  lessonId: widget.lessonId,
                  text: textController.text.trim(),
                  color:
                  '#${selectedColor.value.toRadixString(16).substring(2)}',
                );

                if (existing == null) {
                  await controller.addHighlight(request);
                } else {
                  await controller.updateHighlight(
                    id: existing.id!,
                    request: request,
                  );
                }

                Navigator.pop(dialogCtx);
              },
              child: Text(
                existing == null ? "Create" : "Update",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================== UI ==================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      backgroundColor: const Color(0xFFF7F1E9E0),
      body: Consumer<HighlightController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final highlights = controller.highlightModel?.data ?? [];

          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.w(2.5), vertical: context.h(1.6)),
            child: Column(
              children: [
                _header(),
                Expanded(
                  child: highlights.isEmpty
                      ? _emptyState()
                      : ListView.separated(
                    itemCount: highlights.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: context.h(1)),
                    itemBuilder: (context, i) {
                      final item = highlights[i];
                      final bgColor = Color(int.parse(
                          item.color!.replaceAll("#", "0xff")));

                      return Container(
                        padding: EdgeInsets.all(context.w(2.1)),
                        decoration: BoxDecoration(
                          color: bgColor.withOpacity(0.45),
                          borderRadius:
                          BorderRadius.circular(context.h(0.9)),
                        ),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.text ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.w(2.9),
                                  color: const Color(0xFF2C384A),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () =>
                                      _showHighlightDialog(
                                          existing: item),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () async {
                                    await controller.deleteHighlight(
                                        id: item.id!);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ================== COMPONENTS ==================
  Widget _header() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.w(4.5), vertical: context.h(2)),
      margin: EdgeInsets.only(bottom: context.h(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.8)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.12),
              blurRadius: 14,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Highlights",
                    style: TextStyle(
                        fontSize: context.w(5.2),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF39566C))),
                SizedBox(height: context.h(0.7)),
                Text(
                  "Save and organize your study highlights",
                  style: TextStyle(
                      fontSize: context.w(2.9),
                      color: const Color(0xFF7C8A97)),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => _showHighlightDialog(),
            icon: Icon(Icons.add,
                color: Colors.white, size: context.w(3)),
            label: Text("Add Highlight",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.w(3.3),
                    color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA962),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Text(
        "No highlights yet.\nStart highlighting important text!",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: context.w(2.9),
            color: const Color(0xFF6C7987)),
      ),
    );
  }
}
