import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/teacher_classes_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/teacher/teacher_features_app_bar.dart';
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
        context.read<TeacherClassesController>().fetchTeacherClasses());
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<TeacherClassesController>();
    final classes = ctrl.classesModel?.classesData ?? [];

    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: const TeacherFeaturesAppBar(),
      body: Column(
        children: [
          SizedBox(height: context.h(2.5)),

          /// ================= HEADER (Same Style as My Children) =================
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.w(4)),
            padding: EdgeInsets.all(context.w(6)),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF8C00),
                  Color(0xFFFF8C00),
                ],
              ),
              borderRadius: BorderRadius.circular(context.w(6)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF8C00).withOpacity(.35),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                /// ICON SIDE
                Container(
                  padding: EdgeInsets.all(context.w(3.5)),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.class_outlined,
                    color: Colors.white,
                    size: context.w(6),
                  ),
                ),

                SizedBox(width: context.w(4)),

                /// TEXT SIDE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Classes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.w(4.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.h(.8)),
                      Text(
                        "Select a class to view details",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.9),
                          fontSize: context.w(3.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: context.h(3)),

          /// ================= CONTENT =================
          Expanded(
            child: ctrl.isLoading
                ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF8C00),
              ),
            )
                : classes.isEmpty
                ? _emptyState(context)
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              itemCount: classes.length,
              itemBuilder: (context, index) {
                final c = classes[index];
                return _classCard(context, c);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// ================= CLASS CARD (Same Style as Child Card) =================
  Widget _classCard(BuildContext context, dynamic c) {
    // نفس الداتا اللي كانت عندك (ما غيرنا المنطق)
    final className = c.classC?.grade?.nameAr ?? "Class";
    final idText = "ID: ${c.id}";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ClassDetailsTeacherPage(classData: c),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: context.h(2)),
        padding: EdgeInsets.all(context.w(4.5)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.w(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            /// Avatar (gradient circle)
            Container(
              width: context.w(15),
              height: context.w(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF8C00),
                    Color(0xFFE67600),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  className.isNotEmpty ? className[0] : "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.w(5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(width: context.w(4)),

            /// Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    className,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: context.w(4.2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.h(.6)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(3),
                      vertical: context.h(.6),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8C00).withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      idText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.w(3.3),
                        color: const Color(0xFFFF8C00),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  /// ================= EMPTY STATE (Same Style as My Children) =================
  Widget _emptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(context.w(6)),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.class_outlined,
              size: context.w(14),
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: context.h(2)),
          Text(
            "No Classes Found",
            style: TextStyle(
              fontSize: context.w(3.8),
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}