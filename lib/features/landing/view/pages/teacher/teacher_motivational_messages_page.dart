/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_motivational_message_controller.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_motivational_message.dart';

class TeacherMotivationalMessagesPage extends StatefulWidget {
  const TeacherMotivationalMessagesPage({super.key});

  @override
  State<TeacherMotivationalMessagesPage> createState() => _TeacherMotivationalMessagesPageState();
}

class _TeacherMotivationalMessagesPageState extends State<TeacherMotivationalMessagesPage> {
  final TextEditingController messageCtrl = TextEditingController();
  File? imageFile;
  int? selectedStudentId; // للطالب المختار
  int classTeacherId = 2; // مثال: غيرها حسب حالتك
  List<Map<String, dynamic>> studentsList = []; // املأها من API أو ثابت

  @override
  void initState() {
    super.initState();
    Provider.of<MotivationMessageControllerTeacher>(context, listen: false).fetchAll();
    // افترض هنا أنك تجيب قائمة الطلاب من API أو من الكنترولر
    studentsList = [
      {"id": 1, "name_ar": "محمد أحمد علي"},
      {"id": 2, "name_ar": "خالد صبحي"},
      {"id": 3, "name_ar": "هالة ناصر"},
      // أضف باقي الطلاب...
    ];
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  void showEditDialog(MotivationMessageTeacher msg) {
    final TextEditingController editCtrl = TextEditingController(text: msg.message);
    File? editImageFile;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('تعديل الرسالة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: editCtrl,
              decoration: InputDecoration(labelText: 'نص الرسالة'),
            ),
            SizedBox(height: 10),
            (editImageFile != null)
                ? Image.file(editImageFile, width: 80, height: 80)
                : (msg.imageUrl != null
                ? Image.network("https://latestback-8dmb.onrender.com/${msg.imageUrl}", width: 80, height: 80)
                : SizedBox.shrink()),
            TextButton.icon(
              onPressed: () async {
                final picker = ImagePicker();
                final picked = await picker.pickImage(source: ImageSource.gallery);
                if (picked != null) {
                  setState(() {
                    editImageFile = File(picked.path);
                  });
                }
              },
              icon: Icon(Icons.image),
              label: Text("تغيير الصورة"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () async {
              await Provider.of<MotivationMessageControllerTeacher>(context, listen: false)
                  .update(id: msg.id, message: editCtrl.text, image: editImageFile);
              Navigator.pop(ctx);
            },
            child: Text("حفظ"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Motivational Messages'),
        centerTitle: true,
      ),
      body: Consumer<MotivationMessageControllerTeacher>(
        builder: (context, controller, _) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        leading: msg.imageUrl != null
                            ? Image.network("https://latestback-8dmb.onrender.com/${msg.imageUrl}", width: 60, height: 60, fit: BoxFit.cover)
                            : null,
                        title: Text(msg.message),
                        subtitle: Text("الطالب: ${msg.studentId}  |  المعلم: ${msg.classTeacherId}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                showEditDialog(msg);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                await controller.delete(msg.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // ====== ADD NEW MESSAGE FORM =====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // اختيار الطالب
                        Expanded(
                          child: isLoadingStudents
                              ? Center(child: CircularProgressIndicator())
                              : DropdownButtonFormField<int>(
                            value: selectedStudentId,
                            hint: Text("اختر الطالب"),
                            items: studentsList.map((stu) => DropdownMenuItem(
                              value: stu.id,
                              child: Text(stu.nameAr),
                            )).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedStudentId = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        // اختيار صورة
                        IconButton(
                          icon: Icon(Icons.image),
                          onPressed: pickImage,
                        ),
                      ],
                    ),
                    if (imageFile != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image.file(imageFile!, width: 70, height: 70),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: messageCtrl,
                            decoration: InputDecoration(hintText: "اكتب رسالة تحفيزية للطالب"),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () async {
                            if (selectedStudentId == null || messageCtrl.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("اختر الطالب واكتب رسالة!"))
                              );
                              return;
                            }
                            await controller.add(
                              studentId: selectedStudentId!,
                              classTeacherId: classTeacherId,
                              message: messageCtrl.text,
                              image: imageFile,
                            );
                            messageCtrl.clear();
                            setState(() {
                              imageFile = null;
                              selectedStudentId = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}*/
