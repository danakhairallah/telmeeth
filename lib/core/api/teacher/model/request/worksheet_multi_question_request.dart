import 'dart:io';
import 'package:dio/dio.dart';

class WorksheetMultiQuestionRequest {
  String question;
  List<String> options;
  String correctAnswer;
  List<File>? images;

  WorksheetMultiQuestionRequest({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.images,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    // question
    formData.fields.add(MapEntry("question", question));

    // correct_answer
    formData.fields.add(MapEntry("correct_answer", correctAnswer));

    // options[]
    for (var option in options) {
      formData.fields.add(MapEntry("options[]", option));
    }

    // images[]
    if (images != null && images!.isNotEmpty) {
      for (var image in images!) {
        formData.files.add(
          MapEntry(
            "images[]",
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
            ),
          ),
        );
      }
    }

    return formData;
  }
}
