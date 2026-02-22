import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/my_children_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/parent/child_details_page.dart';
class MyChildrenPage extends StatefulWidget {
  const MyChildrenPage({super.key});

  @override
  State<MyChildrenPage> createState() => _MyChildrenPageState();
}

class _MyChildrenPageState extends State<MyChildrenPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MyChildrenController>().getMyChildren();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MyChildrenController>();

    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: FeaturesAppBar(),
      body: Column(
        children: [
          SizedBox(height: context.h(2.5)), //
          /// ================= HEADER =================
          /// ================= HEADER (Same Style as Fees) =================
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
                    Icons.child_care,
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
                        "My Children",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.w(4.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.h(.8)),
                      Text(
                        "Select a child to view details",
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
            child: controller.isLoading
                ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF8C00),
              ),
            )
                : controller.childrenModel?.data == null ||
                controller.childrenModel!.data!.isEmpty
                ? _emptyState()
                : ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(4),
              ),
              itemCount:
              controller.childrenModel!.data!.length,
              itemBuilder: (context, index) {
                final child =
                controller.childrenModel!.data![index];

                return _childCard(child);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ================= CHILD CARD =================
// ================= CHILD CARD =================
  Widget _childCard(child) {

    final isEnglish =
        Localizations.localeOf(context).languageCode == "en";

    final childName =
    isEnglish ? (child.nameEn ?? "") : (child.nameAr ?? "");

    final gradeName =
    isEnglish
        ? (child.gradeSection?.grade?.nameEn ?? "")
        : (child.gradeSection?.grade?.nameAr ?? "");

    final sectionName =
    isEnglish
        ? (child.gradeSection?.section?.nameEn ?? "")
        : (child.gradeSection?.section?.nameAr ?? "");

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChildDetailsPage(
              studentId: child.id!,
              name: childName,
              grade: "$gradeName - $sectionName",
            ),
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

            /// Avatar
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
                  childName.isNotEmpty ? childName[0] : "",
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
                    childName,
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
                      "$gradeName - $sectionName",
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
  // ================= EMPTY STATE =================
  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(context.w(6)),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.child_care_outlined,
              size: context.w(14),
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: context.h(2)),
          Text(
            "No Children Found",
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