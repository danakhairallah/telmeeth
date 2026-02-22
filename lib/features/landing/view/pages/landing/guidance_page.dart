import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class GuidancePage extends StatelessWidget {
  const GuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: const Color(0xFF05777A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF05777A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Guidance",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: context.w(5)),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? context.h(3) : context.h(5),
              horizontal: isMobile ? context.w(2.5) : context.w(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان الرئيسي بدون بوكس
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Professional ",
                      style: TextStyle(
                        fontSize: isMobile ? context.w(5.3) : context.w(6.7),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Text(
                      "counseling",
                      style: TextStyle(
                        fontSize: isMobile ? context.w(5.3) : context.w(6.7),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF19B862),
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(0.7)),
                Text(
                  "for holistic development",
                  style: TextStyle(
                    fontSize: isMobile ? context.w(4.2) : context.w(5.1),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  "Our certified counselors provide personalized support to help every student thrive academically, emotionally, and socially.",
                  style: TextStyle(
                    fontSize: isMobile ? context.w(3.8) : context.w(4.7),
                    color: Colors.white.withOpacity(0.92),
                    height: 1.45,
                  ),
                ),
                SizedBox(height: context.h(3)),
                // كل إرشاد ببطاقة منفصلة مع تظليل واضح جداً
                _GuidanceCard(
                  icon: Icons.menu_book_rounded,
                  iconBg: const Color(0xFFCFEBFF),
                  title: "Academic Guidance",
                  desc:
                  "Personalized academic planning and course selection support to help students achieve their educational goals.",
                ),
                SizedBox(height: context.h(2.1)),
                _GuidanceCard(
                  icon: Icons.track_changes_rounded,
                  iconBg: const Color(0xFFFFC4DE),
                  title: "Career Planning",
                  desc:
                  "Expert guidance on career paths, university applications, and future planning aligned with student interests.",
                ),
                SizedBox(height: context.h(2.1)),
                _GuidanceCard(
                  icon: Icons.favorite_rounded,
                  iconBg: const Color(0xFFC8F7D5),
                  title: "Mental Wellness",
                  desc:
                  "Comprehensive support for student well-being, stress management, and emotional health.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// بوكس الإرشاد مع تظليل قوي وملحوظ وبدون بوردر
class _GuidanceCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String desc;

  const _GuidanceCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? context.h(2.3) : context.h(2.8),
        horizontal: isMobile ? context.w(3.5) : context.w(5),
      ),
      margin: EdgeInsets.symmetric(vertical: context.h(1)), // مساحة عشان التظليل يبين
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(2.6)),
        // تظليل خارجي قوي + تظليل بلون الأزرق للـglow
        boxShadow: [
          // ظل خارجي غامق وواضح
          BoxShadow(
            color: Colors.black.withOpacity(0.22), // أسود قوي
            blurRadius: 36,
            spreadRadius: 8,
            offset: const Offset(0, 14),
          ),
          // ظل خفيف لامع أزرق يعطي تأثير glow
          BoxShadow(
            color: const Color(0xFF19B862).withOpacity(0.14), // نفس لون الـbrand
            blurRadius: 60,
            spreadRadius: 14,
            offset: const Offset(0, 0),
          ),
        ],
        border: Border.all(
          color: Colors.black.withOpacity(0.03),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(context.h(1.6)),
            ),
            padding: EdgeInsets.all(context.w(2.6)),
            child: Icon(icon,
                size: isMobile ? context.w(7.4) : context.w(8.4),
                color: Colors.black87),
          ),
          SizedBox(width: context.w(4.4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? context.w(4.4) : context.w(5.4),
                  ),
                ),
                SizedBox(height: context.h(0.9)),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: isMobile ? context.w(3.2) : context.w(3.8),
                    color: Colors.grey[800],
                    height: 1.34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
