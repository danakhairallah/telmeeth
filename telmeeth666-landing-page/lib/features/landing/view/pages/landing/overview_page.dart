import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF8F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back',
        ),
        title: Text(
          "Overview",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: context.w(4.6),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? context.w(5.2) : context.w(13.6),
            vertical: isMobile ? context.h(2.7) : context.h(3.9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LEARN. MANAGE. EMPOWER.",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w700,
                            letterSpacing: context.w(0.4),
                            fontSize: isMobile ? context.w(3.1) : context.w(3.6),
                          ),
                        ),
                        SizedBox(height: context.h(2)),
                        Text(
                          "Telmeeth connects\nall parts of the educational process",
                          style: TextStyle(
                            color: const Color(0xFFFF8C00),
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? context.w(7.2) : context.w(13.6),
                            height: context.h(0.119),
                          ),
                        ),
                        SizedBox(height: context.h(2)),
                        Text(
                          "Telmeeth is an advanced educational platform built to improve school operations and enhance learning outcomes using modern AI technologies.",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: isMobile ? context.w(3) : context.w(5),
                          ),
                        ),
                        SizedBox(height: context.h(1.5)),
                        Text(
                          "Since our launch, we have supported schools across multiple cities and helped thousands of students learn more effectively.",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: isMobile ? context.w(3) : context.w(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile) SizedBox(width: context.w(2.9)),
                  if (!isMobile)
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: isMobile ? context.h(15.3) : context.h(18.5),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.asset(
                              'assets/pencil.png',
                              width: isMobile ? context.w(21.8) : context.w(31.6),
                              height: isMobile ? context.h(9.8) : context.h(14.2),
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: context.h(3.8)),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.h(2.8)),
                    child: Image.asset(
                      'assets/parentWkid.png',
                      width: double.infinity,
                      height: isMobile ? context.h(26.2) : context.h(35),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: isMobile ? context.h(-4.9) : context.h(7.1),
                    child: Image.asset(
                      'assets/zebra.png',
                      width: isMobile ? context.w(21.8) : context.w(31.6),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
