import 'dart:io';
import 'package:dio/dio.dart';

class RecordedLessonRequest {
  int lessonId;
  int sectionId;
  String title;
  String description;
  File? video; // فيديو اختياري
  File? image; // صورة اختياري

  RecordedLessonRequest({
    required this.lessonId,
    required this.sectionId,
    required this.title,
    required this.description,
    this.video,
    this.image,
  });

  /// تحويل الريكوست إلى FormData لاستخدامه مع Dio
  Future<FormData> toFormData() async {
    final formData = FormData();

    // الحقول النصية
    formData.fields.add(MapEntry("lesson_id", lessonId.toString()));
    formData.fields.add(MapEntry("section_id", sectionId.toString()));
    formData.fields.add(MapEntry("title", title));
    formData.fields.add(MapEntry("description", description));

    // إضافة الفيديو إذا موجود
    if (video != null) {
      formData.files.add(
        MapEntry(
          "video",
          await MultipartFile.fromFile(
            video!.path,
            filename: video!.path.split('/').last,
          ),
        ),
      );
    }

    // إضافة الصورة إذا موجودة
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
