import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_classes_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/class_details_teacher_page.dart';

class MyClassesTeacherPage extends StatefulWidget {
  const MyClassesTeacherPage({super.key});

  @override
  State<MyClassesTeacherPage> createState() => _MyClassesTeacherPageState();
}

class _MyClassesTeacherPageState extends State<MyClassesTeacherPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TeacherClassesController>().fetchTeacherClasses()
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<TeacherClassesController>();
    final classes = ctrl.classesModel?.classesData ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("My Classes", style: TextStyle(
          fontSize: ResponsiveValues.font(context, 22),
        )),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ctrl.isLoading
          ? const Center(child: CircularProgressIndicator())
          : classes.isEmpty
          ? const Center(child: Text("No classes found"))
          : ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, i) {
          final c = classes[i];
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: ResponsiveValues.w(context, 4),
              vertical: ResponsiveValues.h(context, 1.5),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(
                  ResponsiveValues.padding(context, 12)),
              leading: CircleAvatar(
                child: Icon(Icons.class_),
              ),
              title: Text(
                c.classC?.grade?.nameAr ?? "Class",
                style: TextStyle(
                  fontSize: ResponsiveValues.font(context, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("ID: ${c.id}"),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ClassDetailsTeacherPage(classData: c),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
