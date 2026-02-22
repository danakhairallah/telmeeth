import 'dart:io';
import 'package:dio/dio.dart';

class TeacherMcQuestionRequestModel {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final int mark;
  final File? image; // اختياري

  TeacherMcQuestionRequestModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.mark,
    this.image,
  });

  /// ===== Convert to FormData =====
  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      "question": question,
      "correct_answer": correctAnswer,
      "mark": mark,

      // options[]
      "options[]": options,
    });

    if (image != null) {
      formData.files.add(
        MapEntry(
          "image",
          await MultipartFile.fromFile(
            image!.path,
            filename: image!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}