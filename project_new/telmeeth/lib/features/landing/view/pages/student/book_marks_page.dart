import 'package:flutter/material.dart';
import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({super.key});
  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  List<Map<String, dynamic>> highlights = [];
  final List<Color> highlightColors = [
    Colors.yellow,
    Colors.greenAccent.shade100,
    Colors.lightBlue.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.purple.shade200,
  ];
  Color? selectedColor;

  void _showAddHighlightDialog() {
    final _textController = TextEditingController();
    final _noteController = TextEditingController();
    selectedColor = highlightColors[0];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        title: const Text(
          "Add New Highlight",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        content: SizedBox(
          width: 280,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Highlighted Text",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                const SizedBox(height: 4),
                TextField(
                  controller: _textController,
                  minLines: 2,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 11),
                  decoration: InputDecoration(
                    hintText: "Enter the text you want to highlight",
                    hintStyle: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Note (Optional)",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
                const SizedBox(height: 3),
                TextField(
                  controller: _noteController,
                  minLines: 2,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 11),
                  decoration: InputDecoration(
                    hintText: "Add a note about this highlight",
                    hintStyle: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
                const SizedBox(height: 11),
                const Text("Highlight Color",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
                const SizedBox(height: 5),
                // ألوان الهايلايت
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
                          Navigator.of(context).pop();
                          _showAddHighlightDialogWithSelection(_textController, _noteController, c);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
                              width: isSelected ? 2.1 : 1.1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: c,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(fontSize: 11)),
          ),
          ElevatedButton(
            onPressed: () {
              if (_textController.text.trim().isEmpty) return;
              setState(() {
                highlights.add({
                  "text": _textController.text.trim(),
                  "note": _noteController.text.trim(),
                  "color": selectedColor,
                });
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA962),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            ),
            child: const Text("Create", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
          ),
        ],
      ),
    );
  }

  void _showAddHighlightDialogWithSelection(TextEditingController textController, TextEditingController noteController, Color selected) {
    selectedColor = selected;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        title: const Text(
          "Add New Highlight",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        content: SizedBox(
          width: 280,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Highlighted Text",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                const SizedBox(height: 4),
                TextField(
                  controller: textController,
                  minLines: 2,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 11),
                  decoration: InputDecoration(
                    hintText: "Enter the text you want to highlight",
                    hintStyle: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Note (Optional)",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
                const SizedBox(height: 3),
                TextField(
                  controller: noteController,
                  minLines: 2,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 11),
                  decoration: InputDecoration(
                    hintText: "Add a note about this highlight",
                    hintStyle: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
                const SizedBox(height: 11),
                const Text("Highlight Color",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
                const SizedBox(height: 5),
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
                          Navigator.of(context).pop();
                          _showAddHighlightDialogWithSelection(textController, noteController, c);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
                              width: isSelected ? 2.1 : 1.1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: c,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(fontSize: 11)),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.trim().isEmpty) return;
              setState(() {
                highlights.add({
                  "text": textController.text.trim(),
                  "note": noteController.text.trim(),
                  "color": selectedColor,
                });
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA962),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            ),
            child: const Text("Create", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 30, vertical: 15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                margin: const EdgeInsets.only(bottom: 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 8)],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Highlights",
                            style: TextStyle(
                              fontSize: 18.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39566C),
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Save and organize your study highlights",
                            style: TextStyle(fontSize: 10, color: Color(0xFF7C8A97)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      child: ElevatedButton.icon(
                        onPressed: _showAddHighlightDialog,
                        icon: const Icon(Icons.add, color: Colors.white, size: 11),
                        label: const Text(
                          "Add Highlight",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA962),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.06), blurRadius: 5)],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 7),
                  child: highlights.isEmpty
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_note_rounded, color: Colors.grey[350], size: 32),
                      const SizedBox(height: 8),
                      const Text(
                        "No highlights yet. Start highlighting important text!",
                        style: TextStyle(fontSize: 12, color: Color(0xFF6C7987)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                      : ListView.separated(
                    shrinkWrap: true,
                    itemCount: highlights.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final item = highlights[i];
                      return Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: (item['color'] as Color).withOpacity(0.45),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Expanded حتى يأخذ النص المساحة المتبقية
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['text'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFF2C384A),
                                    ),
                                  ),
                                  if ((item['note'] as String).isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        item['note'],
                                        style: const TextStyle(fontSize: 10, color: Color(0xFF7C8A97)),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // زر الحذف
                            IconButton(
                              icon: Icon(Icons.delete_outline, color: Colors.red[300], size: 20),
                              tooltip: "Delete Highlight",
                              padding: const EdgeInsets.only(left: 8, top: 0),
                              onPressed: () {
                                setState(() {
                                  highlights.removeAt(i);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
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
