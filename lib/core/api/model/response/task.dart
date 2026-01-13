import 'package:telmeeth/core/api/model/response/task_detile_response.dart';

class Task {
  int id;
  int teacherId;
  int lessonId;
  String type;
  String title;
  String description;
  List<MCQTask> multipleChoiceTasks;
  List<EssayTask> essayTasks;

  Task({
    required this.id,
    required this.teacherId,
    required this.lessonId,
    required this.type,
    required this.title,
    required this.description,
    required this.multipleChoiceTasks,
    required this.essayTasks,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      teacherId: json['teacher_id'],
      lessonId: json['lesson_id'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      multipleChoiceTasks: (json['multiple_choice_tasks'] as List? ?? [])
          .map((e) => MCQTask.fromJson(e))
          .toList(),
      essayTasks: (json['essay_tasks'] as List? ?? [])
          .map((e) => EssayTask.fromJson(e))
          .toList(),
    );
  }
}