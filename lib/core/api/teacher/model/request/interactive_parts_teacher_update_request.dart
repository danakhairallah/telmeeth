import 'dart:io';
import 'package:dio/dio.dart';

class InteractivePartsRequestUpdate {
  List<File>? video; // فيديوهات متعددة
  int timeInSeconds;
  List<String> questions;
  List<List<String>> options; // كل سؤال له مجموعة خيارات
  List<String> correctAnswer;
  String description;

  InteractivePartsRequestUpdate({
    this.video,
    required this.timeInSeconds,
    required this.questions,
    required this.options,
    required this.correctAnswer,
    required this.description,
  });

  /// تحويل الريكوست لـ FormData لاستخدامه مع Dio
  Future<FormData> toFormData() async {
    final formData = FormData();

    // إضافة الفيديوهات
    if (video != null && video!.isNotEmpty) {
      for (var i = 0; i < video!.length; i++) {
        formData.files.add(
          MapEntry(
            "video[]",
            await MultipartFile.fromFile(
              video![i].path,
              filename: video![i].path.split('/').last,
            ),
          ),
        );
      }
    }

    // الوقت
    formData.fields.add(MapEntry("time_in_seconds", timeInSeconds.toString()));

    // الأسئلة
    for (int i = 0; i < questions.length; i++) {
      formData.fields.add(MapEntry("questions[$i]", questions[i]));
    }

    // الخيارات لكل سؤال
    for (int i = 0; i < options.length; i++) {
      for (int j = 0; j < options[i].length; j++) {
        formData.fields.add(MapEntry("options[$i][$j]", options[i][j]));
      }
    }

    // الإجابات الصحيحة
    for (int i = 0; i < correctAnswer.length; i++) {
      formData.fields.add(MapEntry("correct_answer[$i]", correctAnswer[i]));
    }

    // الوصف
    formData.fields.add(MapEntry("description", description));

    return formData;
  }
}
