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
      backgroundColor: const Color(0xffF7F8FA),
      appBar: FeaturesAppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.w(4)),
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.childrenModel?.data == null
            ? const Center(child: Text("No Children Found"))
            : ListView.builder(
                itemCount: controller.childrenModel!.data!.length,
                itemBuilder: (context, index) {
                  final child = controller.childrenModel!.data![index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChildDetailsPage(
                            studentId: child.id!,
                            name: child.nameAr ?? "",
                            grade: child.gradeSection?.grade?.nameAr ?? "",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: context.h(1.8)),
                      padding: EdgeInsets.all(context.w(4)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(context.w(4)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: context.w(14),
                            height: context.w(14),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.1),
                              borderRadius: BorderRadius.circular(context.w(4)),
                            ),
                            child: const Icon(Icons.person, color: Colors.blue),
                          ),
                          SizedBox(width: context.w(4)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  child.nameAr ?? "",
                                  style: TextStyle(
                                    fontSize: context.w(4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: context.h(0.5)),
                                Text(
                                  "Grade: ${child.gradeSection?.grade?.nameAr ?? ""}",
                                  style: TextStyle(fontSize: context.w(3.5)),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
