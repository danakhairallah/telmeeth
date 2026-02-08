import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import '../../../../../core/widgets/parent/features_app_bar.dart';

class DiscountsParent extends StatelessWidget {
  const DiscountsParent({super.key});

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
        child: Column(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Card title
                    Text(
                      "Active Discounts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                        isMobile ? context.w(4.6) : context.w(5.2),
                      ),
                    ),

                    /// Empty state
                    Expanded(
                      child: Center(
                        child: Text(
                          "No active discounts found.",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: isMobile
                                ? context.w(3)
                                : context.w(3.6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
