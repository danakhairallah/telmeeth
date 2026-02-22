import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class AiToolsPage extends StatelessWidget {
  const AiToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    final double imgHeight = isMobile ? 300 : 200;
    final double imgWidth = isMobile ? 300 : 210;
    final double cardWidth = isMobile ? 300 : 220;

    return Scaffold(
      backgroundColor: const Color(0xFF0A6F6D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A6F6D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white , ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "AI Tools",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: context.w(5)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(context.h(1.9)),
                child: Image.asset(
                  'assets/youth_students.jpg',
                  height: imgHeight,
                  width: imgWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: _HeroCard(
                isMobile: isMobile,
                cardWidth: cardWidth,
              ),
            ),
            SizedBox(height: context.h(0.8)),
            // Row of stat items
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StatItem(value: 50, label: "Lessons delivered", fontSize: context.w(3.4)),
                SizedBox(width: context.w(5.1)),
                _StatItem(value: 200, label: "Students reached", fontSize: context.w(3.4)),
                SizedBox(width: context.w(5.1)),
                _StatItem(value: 2, label: "Years empowering", fontSize: context.w(3.4)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final bool isMobile;
  final double cardWidth;

  const _HeroCard({
    required this.isMobile,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.w(8.5)),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBF4),
              borderRadius: BorderRadius.circular(context.h(2.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: isMobile ? context.w(4.1) : context.w(3.6),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: context.h(0.12),
                    ),
                    children: [
                      TextSpan(text: "AI Elevate learning\nwith " , style: TextStyle(fontSize: context.w(4.2))),
                      TextSpan(
                        text: "powerful digital tools",
                        style: TextStyle(color: Color(0xFF1E9E6A) , fontSize: context.w(4.2)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(0.7)),
                Text(
                  "At Telmeeth, we bring students together, helping them master new languages and build real‑world skills for life success.",
                  style: TextStyle(
                    fontSize: isMobile ? context.w(2.6) : context.w(2.6),
                    color: Colors.grey[700],
                    height: context.h(0.13),
                  ),
                ),
                SizedBox(height: context.h(1.2)),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7A18),
                      padding: EdgeInsets.symmetric(horizontal: context.w(2.4), vertical: context.h(0.7)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.h(1.2)),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.w(3),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -28,
            bottom: -65,
            child: Image.asset(
              "assets/bee.png",
              width: context.w(24.3),
              height: context.h(10.9),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final int value;
  final String label;
  final double fontSize;

  const _StatItem({
    required this.value,
    required this.label,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: value),
          duration: const Duration(seconds: 2),
          builder: (context, val, child) {
            return Text(
              "$val+",
              style: TextStyle(
                fontSize: fontSize + 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        SizedBox(
          width: 66,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize - 1, color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
