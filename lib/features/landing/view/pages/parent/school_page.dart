import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/school_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/features/landing/view/pages/parent/branches_page.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<SchoolController>().getSchools();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FeaturesAppBar(),
      body: Consumer<SchoolController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage != null) {
            return Center(
              child: Text(
                controller.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final schools = controller.schoolModel?.data ?? [];

          if (schools.isEmpty) {
            return const Center(child: Text("No schools found"));
          }

          return ListView.builder(
            padding: EdgeInsets.all(context.w(4)),
            itemCount: schools.length,
            itemBuilder: (context, index) {
              final school = schools[index];

              return InkWell(
                borderRadius: BorderRadius.circular(context.w(3)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BranchesPage(
                        id: school.id!,
                        fromStudent: false,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: context.h(2)),
                  padding: EdgeInsets.all(context.w(4)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.w(3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// اسم المدرسة + سهم
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              school.nameAr ?? school.nameEn ?? "School",
                              style: TextStyle(
                                fontSize: context.w(4.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: context.w(4),
                            color: Colors.grey,
                          ),
                        ],
                      ),

                      SizedBox(height: context.h(1)),

                      /// الايميل
                      if (school.email != null)
                        Text(
                          "Email: ${school.email}",
                          style: TextStyle(fontSize: context.w(3.4)),
                        ),

                      SizedBox(height: context.h(0.5)),

                      /// الهاتف
                      if (school.phoneNumber != null)
                        Text(
                          "Phone: ${school.phoneNumber}",
                          style: TextStyle(fontSize: context.w(3.4)),
                        ),

                      SizedBox(height: context.h(1.5)),

                      /// الإحصائيات
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoItem(
                            context,
                            title: "Branches",
                            value: school.maxBranches?.toString() ?? "0",
                          ),
                          _infoItem(
                            context,
                            title: "Teachers",
                            value: school.maxTeachers?.toString() ?? "0",
                          ),
                          _infoItem(
                            context,
                            title: "Students",
                            value: school.maxStudents?.toString() ?? "0",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _infoItem(BuildContext context,
      {required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: context.w(4),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.h(0.3)),
        Text(
          title,
          style: TextStyle(
            fontSize: context.w(3),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
