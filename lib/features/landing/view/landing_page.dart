import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/app_bar.dart';
import 'package:telmeeth/features/landing/view/sections/contact_section.dart';
import 'package:telmeeth/features/landing/view/sections/home_section.dart';
import 'package:telmeeth/features/landing/view/sections/plans_section.dart';
import 'package:telmeeth/features/landing/view/sections/services_section.dart';

import '../../../core/widgets/telmeeth_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;

    return Scaffold(
      appBar: TelmeethAppBar(onLogin: () {}, onToggleTheme: () {}),
      endDrawer: TelmeethDrawer(onToggleTheme: () {}, isDark: isDark),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HomeSection(),
            ServicesSection(),
            PlansSection(),
            ContactSection(),

            //FooterSection(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.login),
        label: const Text('Login'),
        backgroundColor: const Color(0xFF0F4C5C),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
