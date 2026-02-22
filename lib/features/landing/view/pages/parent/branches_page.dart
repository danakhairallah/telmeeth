import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/branches_controllers.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';

class BranchesPage extends StatefulWidget {
  final int id;
  final bool fromStudent;

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
      backgroundColor: const Color(0xffF7F8FA),
      appBar: FeaturesAppBar(),
      body: Consumer<BranchesController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }

          final branches = controller.branchesModel?.data ?? [];

          if (branches.isEmpty) {
            return Center(
              child: Text(
                "No branches available",
                style: TextStyle(
                  fontSize: context.w(4),
                  color: Colors.grey,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(context.w(4)),
            itemCount: branches.length,
            itemBuilder: (context, index) {
              final branch = branches[index];

              return Container(
                margin: EdgeInsets.only(bottom: context.h(2)),
                padding: EdgeInsets.all(context.w(5)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(context.w(4)),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 3),
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    /// ===== Branch Name =====
                    Text(
                      branch.nameAr ??
                          branch.nameEn ??
                          "Branch",
                      style: TextStyle(
                        fontSize: context.w(4.5),
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),

                    SizedBox(height: context.h(1.5)),

                    /// ===== Address =====
                    if (branch.address != null)
                      _infoRow(
                        Icons.location_on,
                        branch.address!,
                      ),

                    if (branch.phoneNumber != null)
                      _infoRow(
                        Icons.phone,
                        branch.phoneNumber!,
                      ),

                    if (branch.email != null)
                      _infoRow(
                        Icons.email,
                        branch.email!,
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

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(1)),
      child: Row(
        children: [
          Icon(
            icon,
            size: context.w(4.5),
            color: AppColors.primary,
          ),
          SizedBox(width: context.w(2)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: context.w(3.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}