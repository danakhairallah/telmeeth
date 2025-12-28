import 'package:flutter/material.dart';

import '../../../../../core/widgets/student/drawer.dart';
import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_app_bar.dart';

class GradesResults extends StatelessWidget {
  const GradesResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(),
      drawer: AppDrawer(),
      bottomNavigationBar: NavigationBarPrimary(),
    );
  }
}
