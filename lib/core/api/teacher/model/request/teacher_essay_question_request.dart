import 'dart:io';
import 'package:dio/dio.dart';

class TeacherEssayQuestionRequestModel {
  final String question;
  final String? hint;
  final int mark;
  final File? image;

  TeacherEssayQuestionRequestModel({
    required this.question,
    this.hint,
    required this.mark,
    this.image,
  });

  /// ===== Convert to multipart FormData =====
  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      "question": question,
      "hint": hint,
      "mark": mark,
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