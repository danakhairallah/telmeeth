import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFFFEF8F2),
      padding: EdgeInsets.symmetric(vertical: context.h(6.5), horizontal: context.w(3.8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(
          'Simpler Management. Better Learning. Stronger Results.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: isMobile ? context.w(2.6) : context.w(2.4),
            fontWeight: FontWeight.w600,
            letterSpacing: context.w(0.04),
          ),
        ),
          SizedBox(height: context.h(1.3)),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'A complete ',
                  style: TextStyle(
                    fontSize: isMobile ? context.w(5.8) : context.w(9.2),
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'digital education\n',
                  style: TextStyle(
                    fontSize: isMobile ? context.w(5.8) : context.w(9.2),
                    color: const Color(0xFF118183),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'system for modern schools',
                  style: TextStyle(
                    fontSize: isMobile ? context.w(5.8) : context.w(9.2),
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.h(4.8)),
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
                  SizedBox(width: isMobile ? 0 : context.w(6.8), height: isMobile ? context.h(3) : 0),
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _FeatureCard(
                      image: 'assets/woman.jpg',
                      title: 'Flexible Solutions for Schools & Institutions',
                      description:
                      'Customizable curricula and schedules for institutions of any size.',
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : context.w(6.8), height: isMobile ? context.h(3) : 0),
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
    final double cardHeight = isMobile ? context.h(8.5) : context.h(10);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : context.w(0.4), vertical: isMobile ? context.h(0.3) : 0),
      padding: EdgeInsets.symmetric(horizontal: context.w(2.4), vertical: context.h(0.6)),
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.9)),
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
            borderRadius: BorderRadius.circular(context.h(1.3)),
            child: Image.asset(
              image,
              height: isMobile ? context.h(4.8) : context.h(6.1),
              width: isMobile ? context.w(10.7) : context.w(13.6),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: context.w(2.9)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.h(1)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? context.w(3.1) : context.w(3.1),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: context.h(0.5)),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: isMobile ? context.w(2.5) : context.w(2.9),
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
