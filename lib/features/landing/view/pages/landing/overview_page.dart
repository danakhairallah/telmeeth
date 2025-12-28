import 'package:flutter/material.dart';

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
        title: const Text(
          "Overview",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 22 : 56,
            vertical: isMobile ? 25 : 36,
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
                            letterSpacing: 2,
                            fontSize: isMobile ? 13 : 15,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Telmeeth connects\nall parts of the educational process",
                          style: TextStyle(
                            color: const Color(0xFFFF8C00),
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 30 : 56,
                            height: 1.09,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Telmeeth is an advanced educational platform built to improve school operations and enhance learning outcomes using modern AI technologies.",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: isMobile ? 14 : 20,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "Since our launch, we have supported schools across multiple cities and helped thousands of students learn more effectively.",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: isMobile ? 14 : 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile) const SizedBox(width: 12),
                  if (!isMobile)
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: isMobile ? 140 : 170,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.asset(
                              'assets/pencil.png',
                              width: isMobile ? 90 : 130,
                              height: isMobile ? 90 : 130,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 35),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Image.asset(
                      'assets/parentWkid.png',
                      width: double.infinity,
                      height: isMobile ? 240 : 320,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: isMobile ? -45 : -65,
                    child: Image.asset(
                      'assets/zebra.png',
                      width: isMobile ? 90 : 130,
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
