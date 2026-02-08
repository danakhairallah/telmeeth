import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/recorded_lessons.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class RecordedLessonsScreen extends StatelessWidget {
  final int lessonId;

  const RecordedLessonsScreen({
    super.key,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          RecordedLessonsController()..getRecordedLessons(lessonId),
      child: const _RecordedLessonsView(),
    );
  }
}

class _RecordedLessonsView extends StatelessWidget {
  const _RecordedLessonsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: Consumer<RecordedLessonsController>(
        builder: (context, controller, _) {
          /// 🔹 Loading
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = controller.lessons?.data ?? [];

          /// 🔹 Empty
          if (data.isEmpty) {
            return const Center(child: Text("No recorded lessons found"));
          }

          /// 🔹 List
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final lesson = data[index];

              return ListTile(
                title: Text(lesson.title ?? ""),
                subtitle: Text(lesson.description ?? ""),
                leading: const Icon(Icons.play_circle_fill),
                onTap: () {
                  // افتحي الفيديو او الرابط
                },
              );
            },
          );
        },
      ),
    );
  }
}

