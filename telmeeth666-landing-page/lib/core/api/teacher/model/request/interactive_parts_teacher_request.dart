import 'package:dio/dio.dart';

/// كل Part داخل الـ interactive lesson
class InteractivePartPost {
  int interactiveLessonId;
  int timeInSeconds;
  List<String> questions;
  List<List<String>> options; // كل سؤال عنده مجموعة خيارات
  List<String> correctAnswer;

  InteractivePartPost({
    required this.interactiveLessonId,
    required this.timeInSeconds,
    required this.questions,
    required this.options,
    required this.correctAnswer,
  });

  Map<String, dynamic> toJson() {
    return {
      "interactive_lesson_id": interactiveLessonId,
      "time_in_seconds": timeInSeconds,
      "questions": questions,
      "options": options,
      "correct_answer": correctAnswer,
    };
  }
}

/// الريكوست الكامل
class InteractivePartsRequestPost {
  List<InteractivePartPost> parts;

  InteractivePartsRequestPost({required this.parts});

  /// تحويل الريكوست لـ FormData لاستخدامه مع Dio
  Future<FormData> toFormData() async {
    final formData = FormData();

    for (int i = 0; i < parts.length; i++) {
      final part = parts[i];
      // كل object بالـ parts[]
      formData.fields.add(MapEntry("parts[$i][interactive_lesson_id]",
          part.interactiveLessonId.toString()));
      formData.fields
          .add(MapEntry("parts[$i][time_in_seconds]", part.timeInSeconds.toString()));

      // questions[] لكل part
      for (int q = 0; q < part.questions.length; q++) {
        formData.fields.add(MapEntry(
            "parts[$i][questions][$q]", part.questions[q]));
      }

      // options[][] لكل part
      for (int o = 0; o < part.options.length; o++) {
        for (int opt = 0; opt < part.options[o].length; opt++) {
          formData.fields.add(MapEntry(
              "parts[$i][options][$o][$opt]", part.options[o][opt]));
        }
      }

      // correct_answer[] لكل part
      for (int c = 0; c < part.correctAnswer.length; c++) {
        formData.fields.add(MapEntry(
            "parts[$i][correct_answer][$c]", part.correctAnswer[c]));
      }
    }

    return formData;
  }
}
