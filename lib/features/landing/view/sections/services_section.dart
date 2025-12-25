import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFFFEF8F2),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(
          'Simpler Management. Better Learning. Stronger Results.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: isMobile ? 11 : 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
          const SizedBox(height: 12),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'A complete ',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 38,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'digital education\n',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 38,
                    color: const Color(0xFF118183),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'system for modern schools',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 38,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 44),
          LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _FeatureCard(
                      image: 'assets/teacher.jpg',
                      title: 'AI-Powered Interactive Classes',
                      description:
                      'Live, recorded, and fully interactive lessons supported by AI for faster understanding.',
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 28, height: isMobile ? 28 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _FeatureCard(
                      image: 'assets/woman.jpg',
                      title: 'Flexible Solutions for Schools & Institutions',
                      description:
                      'Customizable curricula and schedules for institutions of any size.',
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 28, height: isMobile ? 28 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _FeatureCard(
                      image: 'assets/student.jpg',
                      title: 'AI Study Assistant for Every Student',
                      description:
                      'Tailored lesson paths using AI assessments for each student.',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const _FeatureCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final double cardHeight = isMobile ? 78 : 92;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 2, vertical: isMobile ? 3 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: isMobile ? 44 : 56,
              width: isMobile ? 44 : 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: isMobile ? 10.5 : 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
