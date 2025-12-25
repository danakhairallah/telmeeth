import 'dart:async';
import 'package:flutter/material.dart';
import 'landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF8C00), // لون السبلاش
      body: Center(
        child: Image.asset(
          'assets/logo_telmeeth.png', // استخدم الصورة الجديدة هنا
          width: 250, // أو الحجم الذي تريده
          fit: BoxFit.contain,
        ),
      ),

    );
  }
}
