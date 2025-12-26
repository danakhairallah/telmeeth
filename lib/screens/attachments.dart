import 'package:flutter/material.dart';
import 'package:telmeeth1/widget/app_bar.dart';
import 'package:telmeeth1/widget/drawer.dart';
import 'package:telmeeth1/widget/navigation.dart';

class Attachments extends StatelessWidget {
  const Attachments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(),
      drawer: AppDrawer(),
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}