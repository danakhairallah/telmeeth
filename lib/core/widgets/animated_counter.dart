import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int endValue;
  final Duration duration;
  final TextStyle? style;
  final String suffix;

  const AnimatedCounter({
    super.key,
    required this.endValue,
    this.duration = const Duration(seconds: 2),
    this.style,
    this.suffix = '',
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: widget.endValue).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '+${_animation.value}k',
      style: widget.style,
    );
  }
}
