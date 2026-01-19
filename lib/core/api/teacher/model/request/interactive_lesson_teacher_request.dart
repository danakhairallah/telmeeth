import 'dart:io';
import 'package:dio/dio.dart';

class InteractiveLessonRequest {
  int lessonId;
  int sectionId;
  String title;
  String description;
  File? video;

  InteractiveLessonRequest({
    required this.lessonId,
    required this.sectionId,
    required this.title,
    required this.description,
    this.video,
  });

  /// تحويل الريكوست إلى FormData لاستخدامه مع Dio
  Future<FormData> toFormData() async {
    final formData = FormData();

    // الحقول النصية
    formData.fields.add(MapEntry("lesson_id", lessonId.toString()));
    formData.fields.add(MapEntry("section_id", sectionId.toString()));
    formData.fields.add(MapEntry("title", title));
    formData.fields.add(MapEntry("description", description));

    // الفيديو (اختياري)
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

    return formData;
  }
}
