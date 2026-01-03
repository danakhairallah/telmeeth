import 'package:flutter/material.dart';

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
        title: const Text(
          "Guidance",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: isMobile ? Alignment.topCenter : Alignment.centerRight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 20 : 40,
              horizontal: isMobile ? 8 : 80,
            ),
            child: Container(
              width: isMobile ? double.infinity : 700,
              padding: EdgeInsets.all(isMobile ? 24 : 38),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBF4),
                borderRadius: BorderRadius.circular(46),
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
                        fontSize: isMobile ? 28 : 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.16,
                        fontFamily: "Montserrat",
                      ),
                      children: const [
                        TextSpan(text: "Professional\n"),
                        TextSpan(
                          text: "counseling",
                          style: TextStyle(color: Color(0xFF19B862)),
                        ),
                        TextSpan(text: " for\nholistic\ndevelopment"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Our certified counselors provide personalized support to help every student thrive academically, emotionally, and socially.",
                    style: TextStyle(
                      fontSize: isMobile ? 15.5 : 19,
                      color: Colors.grey[700],
                      height: 1.44,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // العناصر الثلاثة
                  _GuidanceItem(
                    icon: Icons.menu_book_rounded,
                    iconBg: const Color(0xFFCFEBFF),
                    title: "Academic Guidance",
                    desc: "Personalized academic planning and course selection support to help students achieve their educational goals.",
                  ),
                  const SizedBox(height: 20),
                  _GuidanceItem(
                    icon: Icons.track_changes_rounded,
                    iconBg: const Color(0xFFFFC4DE),
                    title: "Career Planning",
                    desc: "Expert guidance on career paths, university applications, and future planning aligned with student interests.",
                  ),
                  const SizedBox(height: 20),
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
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(7),
          child: Icon(icon, size: isMobile ? 32 : 40, color: Colors.black87),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 17 : 22,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                desc,
                style: TextStyle(
                  fontSize: isMobile ? 13.5 : 16,
                  color: Colors.grey[800],
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
