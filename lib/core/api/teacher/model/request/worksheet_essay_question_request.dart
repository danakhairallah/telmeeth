import 'dart:io';

import 'package:dio/dio.dart';

class WorksheetEssayQuestionRequest {
  String question;
  String hint;
  List<File>? images;

  WorksheetEssayQuestionRequest({
    required this.question,
    required this.hint,
    this.images,
  });

  /// تحويل الريكويست إلى FormData لاستخدامه مع Dio
  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.add(MapEntry("question", question));
    formData.fields.add(MapEntry("hint", hint));

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
