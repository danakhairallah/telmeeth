import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class AnimatedCounterAI extends StatelessWidget {
  final int targetNumber;
  final String label;
  final String imageAsset; // مسار الصورة الصغيرة
  final Duration duration;
  final TextStyle? numberStyle;
  final TextStyle? labelStyle;
  final double imageSize;

  const AnimatedCounterAI({
    super.key,
    required this.targetNumber,
    required this.label,
    required this.imageAsset,
    this.duration = const Duration(seconds: 2),
    this.numberStyle,
    this.labelStyle,
    this.imageSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الصورة فوق الرقم
        Padding(
          padding: EdgeInsets.only(bottom: context.h(0.4)),
          child: Image.asset(
            imageAsset,
            width: imageSize,
            height: imageSize,
          ),
        ),
        // الرقم المتحرك
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: targetNumber),
          duration: duration,
          builder: (context, value, child) {
            return Text(
              "$value+",
              style: numberStyle ??
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.w(9.7),
                    color: Colors.white,
                  ),
            );
          },
        ),
        // النص أسفل الرقم
        SizedBox(height: context.h(0.6)),
        Text(
          label,
          textAlign: TextAlign.center,
          style: labelStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: context.w(4.1),
              ),
        ),
      ],
    );
  }
}
