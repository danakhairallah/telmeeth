import 'dart:io';
import 'package:dio/dio.dart';

class FileUploadRequest {
  String title;
  String description;
  List<int> unitIds;
  List<int> lessonIds;
  File? file;

  FileUploadRequest({
    required this.title,
    required this.description,
    required this.unitIds,
    required this.lessonIds,
    this.file,
  });

  /// تحويل الريكويست إلى FormData لاستخدامه مع Dio
  Future<FormData> toFormData() async {
    final formData = FormData();

    // الحقول النصية
    formData.fields.add(MapEntry("title", title));
    formData.fields.add(MapEntry("description", description));

    // array<integer> للوحدات
    for (var id in unitIds) {
      formData.fields.add(MapEntry("unit_id[]", id.toString()));
    }

    // array<integer> للدروس
    for (var id in lessonIds) {
      formData.fields.add(MapEntry("lesson_id[]", id.toString()));
    }

    // الملف
    if (file != null) {
      formData.files.add(
        MapEntry(
          "file",
          await MultipartFile.fromFile(
            file!.path,
            filename: file!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
