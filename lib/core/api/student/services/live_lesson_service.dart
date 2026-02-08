import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/live_lesson_leave.dart';
import 'package:telmeeth/core/api/student/model/response/live_lesson_model.dart';

class LiveLessonService {
  Dio? dio;

  Future<LiveLessonsModel?> getLiveLessonJoinById(int lessonId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/student/live-lessons/$lessonId/join",
      );

      if (response.statusCode == 200) {
        return LiveLessonsModel.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Live Lessons Join by ID API error: $e");
      return null;
    }
  }

  Future<LivelessonLeaveModel?> postLiveLessonLeaveById(int lessonId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        "/student/live-lessons/$lessonId/leave",
      );

      if (response.statusCode == 200) {
        return LivelessonLeaveModel.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Live Lessons Leave by ID API error: $e");
      return null;
    }
  }
}