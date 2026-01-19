import 'dart:io';
import 'package:dio/dio.dart';

class QuestionRequest {
  String? question;
  String? hint;
  int? mark;
  File? image;

  QuestionRequest({
    this.question,
    this.hint,
    this.mark,
    this.image,
  });

  /// تحويل الريكوست إلى FormData لإرساله بـ Dio
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "question": question,
      "hint": hint,
      "mark": mark,
      if (image != null)
        "image": await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        ),
    });
  }
}
