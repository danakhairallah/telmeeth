import 'package:telmeeth/core/api/model/response/essay_question.dart';
import 'package:telmeeth/core/api/model/response/msc_question.dart';

class Worksheet {
  int id;
  int teacherId;
  String title;
  String type;
  List<int> unitId;
  List<int> lessonId;
  List<MCQQuestion> multipleChoiceQuestions;
  List<EssayQuestion> essayQuestions;

  Worksheet({
    required this.id,
    required this.teacherId,
    required this.title,
    required this.type,
    required this.unitId,
    required this.lessonId,
    required this.multipleChoiceQuestions,
    required this.essayQuestions,
  });

  factory Worksheet.fromJson(Map<String, dynamic> json) {
    return Worksheet(
      id: json['id'],
      teacherId: json['teacher_id'],
      title: json['title'],
      type: json['type'],
      unitId: List<int>.from(json['unit_id'] ?? []),
      lessonId: List<int>.from(json['lesson_id'] ?? []),
      multipleChoiceQuestions: (json['multiple_choice_questions'] as List? ?? [])
          .map((e) => MCQQuestion.fromJson(e))
          .toList(),
      essayQuestions: (json['essay_questions'] as List? ?? [])
          .map((e) => EssayQuestion.fromJson(e))
          .toList(),
    );
  }
}