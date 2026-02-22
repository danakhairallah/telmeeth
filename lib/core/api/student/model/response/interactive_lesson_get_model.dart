import 'dart:convert';

/// ===== Root Response =====
class InteractiveLessonGetModel {
  final bool success;
  final List<InteractiveLesson> data;

  InteractiveLessonGetModel({
    required this.success,
    required this.data,
  });

  factory InteractiveLessonGetModel.fromJson(Map<String, dynamic> json) {
    return InteractiveLessonGetModel(
      success: json['success'] ?? false,
      data: (json['data'] as List? ?? [])
          .map((e) => InteractiveLesson.fromJson(e))
          .toList(),
    );
  }
}

/// ===== Lesson =====
class InteractiveLesson {
  final int id;
  final int teacherId;
  final int lessonId;
  final int sectionId;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String videoPath;
  final String videoUrl;
  final List<InteractiveLessonPart> parts;

  InteractiveLesson({
    required this.id,
    required this.teacherId,
    required this.lessonId,
    required this.sectionId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.videoPath,
    required this.videoUrl,
    required this.parts,
  });

  factory InteractiveLesson.fromJson(Map<String, dynamic> json) {
    return InteractiveLesson(
      id: json['id'],
      teacherId: json['teacher_id'],
      lessonId: json['lesson_id'],
      sectionId: json['section_id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      videoPath: json['video_path'],
      videoUrl: json['video_url'],
      parts: (json['parts'] as List? ?? [])
          .map((e) => InteractiveLessonPart.fromJson(e))
          .toList(),
    );
  }
}

/// ===== Lesson Part =====
class InteractiveLessonPart {
  final int id;
  final int interactiveLessonId;
  final int timeInSeconds;

  /// 👇 جايين كنص
  final String questionsRaw;
  final String optionsRaw;
  final String correctAnswerRaw;

  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  InteractiveLessonPart({
    required this.id,
    required this.interactiveLessonId,
    required this.timeInSeconds,
    required this.questionsRaw,
    required this.optionsRaw,
    required this.correctAnswerRaw,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InteractiveLessonPart.fromJson(Map<String, dynamic> json) {
    return InteractiveLessonPart(
      id: json['id'],
      interactiveLessonId: json['interactive_lesson_id'],
      timeInSeconds: json['time_in_seconds'],
      questionsRaw: json['questions'],
      optionsRaw: json['options'],
      correctAnswerRaw: json['correct_answer'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// ===== Parsed Helpers =====

  List<String> get questions {
    return List<String>.from(jsonDecode(questionsRaw));
  }

  List<List<String>> get options {
    return (jsonDecode(optionsRaw) as List)
        .map((e) => List<String>.from(e))
        .toList();
  }

  List<String> get correctAnswers {
    return List<String>.from(jsonDecode(correctAnswerRaw));
  }
}