import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_classes_controller.dart'; // أو كنترولر الطلاب لو عندك
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_model.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class StudentsOfClassTeacherPage extends StatefulWidget {
  final int classId;
  const StudentsOfClassTeacherPage({super.key, required this.classId});

  @override
  State<StudentsOfClassTeacherPage> createState() => _StudentsOfClassTeacherPageState();
}

class _StudentsOfClassTeacherPageState extends State<StudentsOfClassTeacherPage> {
  @override
  void initState() {
    super.initState();
    // إذا عندك كنترولر للطلاب استدعيه هنا وجب طلاب هذا الصف
    // context.read<TeacherStudentsController>().fetchStudentsOfClass(widget.classId);
  }

  @override
  Widget build(BuildContext context) {
    // افترضنا الطلاب جوا تفاصيل الصف (classData) أو جوا كنترولر منفصل
    // عدلها حسب المكان الصحيح في مشروعك
    final classCtrl = Provider.of<TeacherClassesController>(context, listen: false);
    final students = []; // ضع هنا الطلاب الحقيقيين عندما تربط الـ API

    return Scaffold(
      appBar: AppBar(
        title: Text("Students", style: TextStyle(fontSize: ResponsiveValues.font(context, 18))),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: students.isEmpty
          ? Center(child: Text("No students found", style: TextStyle(fontSize: ResponsiveValues.font(context, 14))))
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, i) {
          final s = students[i];
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: ResponsiveValues.w(context, 4),
              vertical: ResponsiveValues.h(context, 1.2),
            ),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(s.name ?? "Student"),
              subtitle: Text("ID: ${s.id}"),
            ),
          );
        },
      ),
    );
  }
}
