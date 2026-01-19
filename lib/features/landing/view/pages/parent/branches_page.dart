import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/branches_controllers.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class BranchesPage extends StatefulWidget {
  final int id;
  final bool fromStudent; // true = student, false = school

  const BranchesPage({
    super.key,
    required this.id,
    required this.fromStudent,
  });

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final controller = context.read<BranchesController>();

      if (widget.fromStudent) {
        controller.getStudentSchoolBranches(widget.id);
      } else {
        controller.getBranchesBySchoolId(widget.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fromStudent ? "My School Branches" : "School Branches"),
      ),
      body: Consumer<BranchesController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final branches = controller.branchesModel?.data ?? [];

          if (branches.isEmpty) {
            return const Center(child: Text("No branches found"));
          }

          return ListView.builder(
            padding: EdgeInsets.all(context.w(4)),
            itemCount: branches.length,
            itemBuilder: (context, index) {
              final branch = branches[index];

              return Container(
                margin: EdgeInsets.only(bottom: context.h(2)),
                padding: EdgeInsets.all(context.w(4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.w(3)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم الفرع
                    Text(
                      branch.nameAr ?? branch.nameEn ?? "Branch",
                      style: TextStyle(
                        fontSize: context.w(4.4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: context.h(1)),

                    if (branch.address != null)
                      Text(
                        "📍 ${branch.address}",
                        style: TextStyle(fontSize: context.w(3.3)),
                      ),

                    SizedBox(height: context.h(0.5)),

                    if (branch.phoneNumber != null)
                      Text(
                        "📞 ${branch.phoneNumber}",
                        style: TextStyle(fontSize: context.w(3.3)),
                      ),

                    SizedBox(height: context.h(0.5)),

                    if (branch.email != null)
                      Text(
                        "✉️ ${branch.email}",
                        style: TextStyle(fontSize: context.w(3.3)),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
