import 'package:flutter/material.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';
import '../../../../../core/widgets/student/student_drawer.dart';

class Behaviors extends StatelessWidget {
  const Behaviors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: StudentDrawer(),
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}
