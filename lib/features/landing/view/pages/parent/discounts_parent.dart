import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/constants/app_colors.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/api/parent/controllers/discounts_controller.dart';

class DiscountsParent extends StatefulWidget {
  const DiscountsParent({super.key});

  @override
  State<DiscountsParent> createState() => _DiscountsParentState();
}

class _DiscountsParentState extends State<DiscountsParent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DiscountsController>().loadDiscounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: const FeaturesAppBar(),
      body: Consumer<DiscountsController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }

          if (controller.errorMessage != null) {
            return Center(
              child: Text(
                controller.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final students = controller.response?.students ?? [];

          if (students.isEmpty) {
            return Center(
              child: Text(
                "No active discounts found.",
                style: TextStyle(
                  fontSize: context.w(4),
                  color: Colors.grey,
                ),
              ),
            );
          }
          print("📱 UI STUDENTS COUNT: ${students.length}");

          for (var s in students) {
            print("👤 ${s.studentName} DISCOUNTS: ${s.discounts?.length}");
          }

          return ListView(
            padding: EdgeInsets.all(context.w(4)),
            children: [

              /// ===== Header =====
              Container(
                padding: EdgeInsets.all(context.w(5)),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryDark,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(context.radius(25)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: context.shadowBlur(18),
                      offset: Offset(0, context.shadowOffsetY(6)),
                      color: AppColors.primary.withOpacity(0.35),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.w(3)),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.local_offer,
                        color: Colors.white,
                        size: context.icon(28),
                      ),
                    ),
                    SizedBox(width: context.w(4)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Discounts",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: context.font(18),
                            ),
                          ),
                          SizedBox(height: context.h(0.5)),
                          Text(
                            "View active discounts for your children",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: context.font(12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.h(3)),

              /// ===== Students =====
              ...students.map((student) {
                print("📱 UI STUDENTS COUNT: ${controller.response?.students?.length}");

                final discounts = student.discounts ?? [];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Student Name
                    Padding(
                      padding: EdgeInsets.only(bottom: context.h(1),left: context.h(0.5)),
                      child: Text(
                        student.studentName ?? "Student",
                        style: TextStyle(
                          fontSize: context.w(4.5),
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ),

                    if (discounts.isEmpty)
                      Padding(
                        padding: EdgeInsets.only(bottom: context.h(2),left: context.h(0.5)),
                        child: Text(
                          "No discounts available.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: context.w(3.5),
                          ),
                        ),
                      ),

                    ...discounts.map((discount) {
                      return Container(
                        margin: EdgeInsets.only(bottom: context.h(2)),
                        padding: EdgeInsets.all(context.w(4)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(context.radius(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [

                            /// 🔥 Percentage Badge
                            Container(
                              height: context.w(14),
                              width: context.w(14),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.primaryDark,
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "${discount.percentage?.toStringAsFixed(0) ?? 0}%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.font(13),
                                ),
                              ),
                            ),

                            SizedBox(width: context.w(4)),

                            /// 🔥 Discount Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    discount.discountName ?? "Discount",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.font(14),
                                    ),
                                  ),

                                  SizedBox(height: context.h(.5)),

                                  Row(
                                    children: [
                                      if (discount.originalAmount != null)
                                        Text(
                                          "${discount.originalAmount!.toStringAsFixed(0)} JD",
                                          style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontSize: context.font(12),
                                          ),
                                        ),

                                      SizedBox(width: context.w(2)),

                                      if (discount.finalAmount != null)
                                        Text(
                                          "${discount.finalAmount!.toStringAsFixed(0)} JD",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryDark,
                                            fontSize: context.font(13),
                                          ),
                                        ),
                                    ],
                                  ),

                                  SizedBox(height: context.h(1)),

                                  /// 🔥 Progress Bar Visual
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      value: (discount.percentage ?? 0) / 100,
                                      minHeight: 6,
                                      backgroundColor: Colors.grey.shade200,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );
  }
}