import 'package:telmeeth/core/api/model/response/task.dart';

class TaskDetailResponse {
  bool status;
  String message;
  TaskDetailData data;

  TaskDetailResponse({required this.status, required this.message, required this.data});

  factory TaskDetailResponse.fromJson(Map<String, dynamic> json) {
    return TaskDetailResponse(
      status: json['status'],
      message: json['message'],
      data: TaskDetailData.fromJson(json['data']),
    );
  }
}

class TaskDetailData {
  Task task;
  TaskQuestions questions;

  TaskDetailData({required this.task, required this.questions});

  factory TaskDetailData.fromJson(Map<String, dynamic> json) {
    return TaskDetailData(
      task: Task.fromJson(json['task']),
      questions: TaskQuestions.fromJson(json['questions']),
    );
  }
}

class TaskQuestions {
  List<MCQTask> mc;
  List<EssayTask> essay;

  TaskQuestions({required this.mc, required this.essay});

  factory TaskQuestions.fromJson(Map<String, dynamic> json) {
    return TaskQuestions(
      mc: (json['mc'] as List? ?? []).map((e) => MCQTask.fromJson(e)).toList(),
      essay: (json['essay'] as List? ?? []).map((e) => EssayTask.fromJson(e)).toList(),
    );
  }
}

class MCQTask {
  int id;
  int taskId;
  String question;
  Map<String, String> options;
  String correctAnswer;
  int mark;

  MCQTask({
    required this.id,
    required this.taskId,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.mark,
  });

  factory MCQTask.fromJson(Map<String, dynamic> json) {
    return MCQTask(
      id: json['id'],
      taskId: json['task_id'],
      question: json['question'],
      options: Map<String, String>.from(json['options'] ?? {}),
      correctAnswer: json['correct_answer'] ?? '',
      mark: json['mark'] ?? 0,
    );
  }
}

class EssayTask {
  int id;
  int taskId;
  String question;
  int mark;

  EssayTask({
    required this.id,
    required this.taskId,
    required this.question,
    required this.mark,
  });

  factory EssayTask.fromJson(Map<String, dynamic> json) {
    return EssayTask(
      id: json['id'],
      taskId: json['task_id'],
      question: json['question'],
      mark: json['mark'] ?? 0,
    );
  }
}

