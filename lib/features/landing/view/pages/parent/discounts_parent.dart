import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    // تحميل الداتا عند فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DiscountsController>(context, listen: false).loadDiscounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Scaffold(
      appBar: const FeaturesAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? context.w(4) : context.w(8),
          vertical: context.h(2),
        ),
        child: Consumer<DiscountsController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.errorMessage != null) {
              return Center(child: Text(controller.errorMessage!));
            }

            final data = controller.response;
            final students = data?.students ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  "My Discounts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? context.w(6) : context.w(7),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: context.h(0.6)),

                /// Subtitle
                Text(
                  "View active discounts for your children.",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: isMobile ? context.w(3) : context.w(3.6),
                  ),
                ),
                SizedBox(height: context.h(3)),

                /// Card
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(4),
                      vertical: context.h(2.5),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(context.h(1.4)),
                      border: Border.all(
                        color: const Color(0xFFE5E9F2),
                      ),
                    ),
                    child: students.isEmpty
                        ? Center(
                      child: Text(
                        "No active discounts found.",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: isMobile
                              ? context.w(3)
                              : context.w(3.6),
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, idx) {
                        final student = students[idx];
                        final discounts = student.discounts ?? [];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student.studentName ?? "Student",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.w(4.5),
                              ),
                            ),
                            ...discounts.isEmpty
                                ? [
                              Text(
                                "No discounts.",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: context.w(3.3),
                                ),
                              )
                            ]
                                : discounts.map((discount) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                  discount.type ?? "Discount"),
                              subtitle: Text(
                                  discount.note ?? ""),
                              trailing: Text(
                                discount.amount != null
                                    ? '${discount.amount} JD'
                                    : '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            )),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
