import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/animated_counter.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      width: double.infinity,
      height: isMobile ? 600 : 480,
      color: const Color(0xFFFF8C00),
      child: Stack(
        children: [
          // Balloon
          Positioned(
            top: isMobile ? 40 : 48,
            left: isMobile ? 18 : 68,
            child: Image.asset(
              'assets/parasuit.png',
              width: isMobile ? 52 : 72,
              height: isMobile ? 52 : 72,
              fit: BoxFit.contain,
            ),
          ),

          // Text content
          Positioned(
            top: isMobile ? 100 : 80,
            left: isMobile ? 20 : 110,
            child: SizedBox(
              width: isMobile ? size.width - 40 : 520,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Put your seat\nbelt',
                    style: TextStyle(
                      fontSize: isMobile ? 34 : 48,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFFD600),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '& get ready\nWith the First AI\nEducational Journey',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 38,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F4C5C),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'We help you grow with clear ideas and thoughtful design.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.93),
                      fontSize: isMobile ? 14 : 18,
                    ),
                  ),
                  const SizedBox(height: 60),
                  AnimatedCounter(
                    endValue: 4,
                    duration: const Duration(seconds: 2),
                    style: TextStyle(
                      fontSize: isMobile ? 40 : 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.09),
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/custom-img-114-copyright.webp',
                        width: isMobile ? 120 : 180,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Happy brands grow\nwith our innovation!',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.95),
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Face image
          Positioned(
            bottom: 0,
            right: isMobile ? 0 : 60,
            child: SizedBox(height: isMobile ? 210 : 370),
          ),
        ],
      ),
    );
  }
}
