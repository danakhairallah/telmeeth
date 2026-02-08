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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: context.w(5)),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: isMobile ? Alignment.topCenter : Alignment.centerRight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? context.h(2.1) : context.h(4.3),
              horizontal: isMobile ? context.w(1.9) : context.w(19.4),
            ),
            child: Container(
              width: isMobile ? MediaQuery.sizeOf(context).width : context.w(170.3),
              padding: EdgeInsets.all(isMobile ? context.w(5.8) : context.w(9.2)),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBF4),
                borderRadius: BorderRadius.circular(context.h(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.11),
                    blurRadius: 44,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان الرئيسي الكبير
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: isMobile ? context.w(6.8) : context.w(9.7),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: context.h(0.12),
                        fontFamily: "Montserrat",
                      ),
                      children: [
                        TextSpan(text: "Professional\n" , style: TextStyle(fontSize: context.w(3))),
                        TextSpan(
                          text: "counseling",
                          style: TextStyle(color: Color(0xFF19B862) , fontSize: context.w(3)),
                        ),
                        TextSpan(text: " for\nholistic\ndevelopment" , style: TextStyle(fontSize: context.w(3))),
                      ],
                    ),
                  ),
                  SizedBox(height: context.h(2.6)),
                  Text(
                    "Our certified counselors provide personalized support to help every student thrive academically, emotionally, and socially.",
                    style: TextStyle(
                      fontSize: isMobile ? context.w(3.7) : context.w(4.6),
                      color: Colors.grey[700],
                      height: context.h(0.15),
                    ),
                  ),
                  SizedBox(height: context.h(4.3)),
                  // العناصر الثلاثة
                  _GuidanceItem(
                    icon: Icons.menu_book_rounded,
                    iconBg: const Color(0xFFCFEBFF),
                    title: "Academic Guidance",
                    desc: "Personalized academic planning and course selection support to help students achieve their educational goals.",
                  ),
                  SizedBox(height: context.h(2)),
                  _GuidanceItem(
                    icon: Icons.track_changes_rounded,
                    iconBg: const Color(0xFFFFC4DE),
                    title: "Career Planning",
                    desc: "Expert guidance on career paths, university applications, and future planning aligned with student interests.",
                  ),
                  SizedBox(height: context.h(2)),
                  _GuidanceItem(
                    icon: Icons.favorite_rounded,
                    iconBg: const Color(0xFFC8F7D5),
                    title: "Mental Wellness",
                    desc: "Comprehensive support for student well-being, stress management, and emotional health.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GuidanceItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String desc;

  const _GuidanceItem({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(context.h(1.5)),
          ),
          padding: EdgeInsets.all(context.w(1.7)),
          child: Icon(icon, size: isMobile ? context.w(7.7) : context.w(9.7), color: Colors.black87),
        ),
        SizedBox(width: context.w(3.8)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? context.w(4.1) : context.w(5.3),
                ),
              ),
              SizedBox(height: context.h(0.3)),
              Text(
                desc,
                style: TextStyle(
                  fontSize: isMobile ? context.w(3.2) : context.w(3.8),
                  color: Colors.grey[800],
                  height: context.h(0.14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
