import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/behavior_teacher_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart'; // حسب استخدامك

class BehaviorsOfClassTeacherPage extends StatelessWidget {
  final int classTeacherId;

  const BehaviorsOfClassTeacherPage({super.key, required this.classTeacherId});

  @override
  Widget build(BuildContext context) {
    final behaviorsCtrl = context.watch<BehaviorTeacherController>();

    final classBehaviors = (behaviorsCtrl.behaviorsList ?? [])
        .where((b) => b.classTeacherId == classTeacherId)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Behaviors'),
      ),
      body: behaviorsCtrl.isLoading
          ? const Center(child: CircularProgressIndicator())
          : classBehaviors.isEmpty
          ? const Center(child: Text('No behaviors found for this class.'))
          : ListView.builder(
        itemCount: classBehaviors.length,
        itemBuilder: (context, idx) {
          final behavior = classBehaviors[idx];
          return Card(
            margin: EdgeInsets.symmetric(
                horizontal: context.w(4), vertical: context.h(1)),
            child: ListTile(
              title: Text(
                behavior.behavior?.behavior ?? 'Behavior',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(behavior.description ?? ''),
              trailing: Icon(
                behavior.certificate == 1
                    ? Icons.verified
                    : Icons.warning_amber_rounded,
                color: behavior.certificate == 1
                    ? Colors.green
                    : Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}
