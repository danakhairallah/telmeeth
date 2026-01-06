import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/controllers/highlight_controller.dart';
import 'package:telmeeth/core/api/model/request/highlight_request.dart';
import 'package:telmeeth/core/api/model/response/highlight_data.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({super.key});

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
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HighlightController>().getHighlights();
    });
  }

  void _showHighlightDialog({HighlightData? existingHighlight}) {
    final _textController = TextEditingController(
        text: existingHighlight?.text ?? ""); // pre-fill if editing
    selectedColor = existingHighlight != null
        ? Color(int.parse(existingHighlight.color!.replaceAll("#", "0xff")))
        : highlightColors[0]; // default selection

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.h(1.3))),
        contentPadding: EdgeInsets.symmetric(
            horizontal: context.w(6), vertical: context.h(1.3)),
        title: Text(
          existingHighlight == null ? "Add New Highlight" : "Edit Highlight",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(4.1)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textController,
              minLines: 2,
              maxLines: 3,
              style: TextStyle(fontSize: context.w(2.6)),
              decoration: InputDecoration(
                hintText: "Enter the text you want to highlight",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.h(0.7))),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: context.w(1.9), vertical: context.h(0.8)),
              ),
            ),
            SizedBox(height: context.h(1)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: highlightColors.map((c) {
                  bool isSelected = selectedColor == c;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = c;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: context.w(0.4)),
                      padding: EdgeInsets.all(isSelected ? 3 : 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: Colors.deepOrange, width: 2)
                            : null,
                      ),
                      child: CircleAvatar(
                        radius: context.h(1.4),
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
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(fontSize: context.w(2.6))),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_textController.text.trim().isEmpty) return;

              final controller = context.read<HighlightController>();
              if (existingHighlight == null) {
                // ADD
                final request = HighlightRequest(
                  lessonId: 0,
                  text: _textController.text.trim(),
                  color:
                      '#${selectedColor!.value.toRadixString(16).substring(2)}',
                );
                await controller.addHighlight(request);
              } else {
                // EDIT
                await controller.updateHighlight(
                  id: existingHighlight.id!,
                  request: HighlightRequest(
                    lessonId: existingHighlight.lessonId ?? 0,
                    text: _textController.text.trim(),
                    color:
                        '#${selectedColor!.value.toRadixString(16).substring(2)}',
                  ),
                );
              }

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA962),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.h(0.8))),
              elevation: 0,
              padding: EdgeInsets.symmetric(
                  horizontal: context.w(3.8), vertical: context.h(0.7)),
            ),
            child: Text(existingHighlight == null ? "Create" : "Save",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.w(2.6))),
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
      backgroundColor: const Color(0xFFF7F1E9E0),
      bottomNavigationBar: const NavigationBarPrimary(),
      body: Consumer<HighlightController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final highlights = controller.highlightModel?.data ?? [];

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? context.w(2.4) : context.w(7.2),
                  vertical: context.h(1.6)),
              child: Column(
                children: [
                  _highlightsHeader(context),
                  Expanded(
                    child: highlights.isEmpty
                        ? _emptyState(context)
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: highlights.length,
                            separatorBuilder: (_, __) =>
                                SizedBox(height: context.h(1)),
                            itemBuilder: (context, i) {
                              final item = highlights[i];
                              return GestureDetector(
                                onTap: () => _showHighlightDialog(
                                    existingHighlight: item),
                                child: Container(
                                  padding: EdgeInsets.all(context.w(2.1)),
                                  decoration: BoxDecoration(
                                    color: Color(int.parse(
                                            item.color!.replaceAll("#", "0xff")))
                                        .withOpacity(0.45),
                                    borderRadius:
                                        BorderRadius.circular(context.h(0.9)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.text ?? "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: context.w(2.9),
                                              color: const Color(0xFF2C384A)),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete_outline,
                                            color: Colors.red[300],
                                            size: context.w(5)),
                                        onPressed: () async {
                                          await controller
                                              .deleteHighlight(id: item.id!);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.edit_note_rounded,
            color: Colors.grey[350], size: context.w(7.7)),
        SizedBox(height: context.h(0.8)),
        Text(
          "No highlights yet. Start highlighting important text!",
          style:
              TextStyle(fontSize: context.w(2.9), color: const Color(0xFF6C7987)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _highlightsHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.w(2.9), vertical: context.h(0.8)),
      margin: EdgeInsets.only(bottom: context.h(1.4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.5)),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Highlights",
                    style: TextStyle(
                        fontSize: context.w(4.5),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF39566C))),
                SizedBox(height: context.h(0.3)),
                Text("Save and organize your study highlights",
                    style: TextStyle(fontSize: context.w(2.4), color: const Color(0xFF7C8A97))),
              ],
            ),
          ),
          SizedBox(
            height: context.h(3),
            child: ElevatedButton.icon(
              onPressed: () => _showHighlightDialog(),
              icon: Icon(Icons.add, color: Colors.white, size: context.w(2.6)),
              label: Text("Add Highlight",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.w(2.9),
                      color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA962),
                  padding: EdgeInsets.symmetric(horizontal: context.w(2.4), vertical: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.h(0.7))),
                  elevation: 0),
            ),
          ),
        ],
      ),
    );
  }
}
