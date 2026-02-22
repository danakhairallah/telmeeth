import 'dart:io';

import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/preparing_lesson_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/preparing_lesson_model.dart';

class PreparingLessonService {
  Dio? dio;

  Future<PreparingLessonModel?> getPreparingLesson() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/preparing-lesson");

      if (response.statusCode == 200) {
        return PreparingLessonModel.fromJson(response.data);
      } else {
        print("Get Preparing Lesson failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Get Preparing Lesson Error: $e");
      return null;
    }
  }

  Future<File?> downloadPreparingLesson(String savePath , PreparingLessonRequest request) async {
  try {
    final dio = Dio();

    final response = await dio.get(
      "/teacher/preparing-lesson",
      data: request.toJson(),
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    if (response.statusCode == 200) {
      final file = File(savePath);
      await file.writeAsBytes(response.data);
      print("Preparing Lesson downloaded: $savePath");
      return file;
    } 
    else {
      print("Unexpected error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Download Preparing Lesson Error: $e");
    return null;
  }
}
}