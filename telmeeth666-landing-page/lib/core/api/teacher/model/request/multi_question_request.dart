import 'dart:io';
import 'package:dio/dio.dart';

class MCQuestionRequest {
  String? question;
  List<String>? options;
  String? correctAnswer;
  int? mark;
  File? image;

  MCQuestionRequest({
    this.question,
    this.options,
    this.correctAnswer,
    this.mark,
    this.image,
  });

  /// تحويل الريكوست إلى FormData لإرساله بـ Dio
  Future<FormData> toFormData() async {
    final map = <String, dynamic>{
      "question": question,
      "correct_answer": correctAnswer,
      "mark": mark,
    };

    // إضافة المصفوفة بصيغة options[]
    if (options != null && options!.isNotEmpty) {
      for (int i = 0; i < options!.length; i++) {
        map["options[$i]"] = options![i];
      }
    }

    // إضافة الصورة إذا موجودة
    if (image != null) {
      map["image"] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }
}
