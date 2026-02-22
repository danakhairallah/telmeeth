import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
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
            top: isMobile ? context.h(4.3) : context.h(5.2),
            left: isMobile ? context.w(4.3) : context.w(16.5),
            child: Image.asset(
              'assets/parasuit.png',
              width: isMobile ? context.w(12.6) : context.w(17.5),
              height: isMobile ? context.h(5.6) : context.h(7.8),
              fit: BoxFit.contain,
            ),
          ),

          // Text content
          Positioned(
            top: isMobile ? context.h(10.9) : context.h(8.7),
            left: isMobile ? context.w(5) : context.w(26.7),
            child: SizedBox(
              width: isMobile ? size.width - context.w(9.7) : context.w(126.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Put your seat\nbelt',
                    style: TextStyle(
                      fontSize: isMobile ? context.w(8.9) : context.w(11.6),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFFD600),
                    ),
                  ),
                  SizedBox(height: context.h(0.6)),
                  Text(
                    '& get ready\nWith the First AI\nEducational Journey',
                    style: TextStyle(
                      fontSize: isMobile ? context.w(6.8) : context.w(9.2),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F4C5C),
                    ),
                  ),
                  SizedBox(height: context.h(2.4)),
                  Text(
                    'We help you grow with clear ideas and thoughtful design.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.93),
                      fontSize: isMobile ? context.w(3.4) : context.w(4.3),
                    ),
                  ),
                  SizedBox(height: context.h(6.5)),
                  AnimatedCounter(
                    endValue: 4,
                    duration: const Duration(seconds: 2),
                    style: TextStyle(
                      fontSize: isMobile ? context.w(9.7) : context.w(13.6),
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                      letterSpacing: context.w(0.29),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.09),
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.h(1.9)),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/custom-img-114-copyright.webp',
                        width: isMobile ? context.w(29.1) : context.w(43.7),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: context.w(3.8)),
                      Expanded(
                        child: Text(
                          'Happy brands grow\nwith our innovation!',
                          style: TextStyle(
                            fontSize: isMobile ? context.w(3.4) : context.w(3.5),
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
            right: isMobile ? 0 : context.w(14.5),
            child: SizedBox(height: isMobile ? context.h(22.9) : context.h(40.4)),
          ),
        ],
      ),
    );
  }
}
