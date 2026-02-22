import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/live_lesson_create_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/live_lesson_create_response.dart';
import 'package:telmeeth/core/api/teacher/model/response/live_lesson_finsh_response.dart';
import 'package:telmeeth/core/api/teacher/model/response/live_lesson_join_response.dart';

class LiveLessonTeacherService {
  Dio? dio;

  Future<LiveLessonCreateResponse?> createLiveLesson(LiveLessonCreateRequest request) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        "/teacher/live-lessons",
        data: request,
      );

      if (response.statusCode == 200) {
        return LiveLessonCreateResponse.fromJson(response.data);
      }
    } catch (e) {
      print("Error in create live lesson: $e");
    }
    return null;
  }

  Future<LiveLessonJoinResponse?> getLiveLessonJoin(int lessonId) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.get(
      "/teacher/live-lessons/$lessonId/join",
    );

    if (response.statusCode == 200) {
      return LiveLessonJoinResponse.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Live Lesson Join Error: $e");
    return null;
  }
}

Future<LiveLessonFinshResponse?> postLiveLessonFinish(int lessonId) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.post(
      "/teacher/live-lessons/$lessonId/finish",
    );

    if (response.statusCode == 200) {
      return LiveLessonFinshResponse.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Live Lesson Finish Error: $e");
    return null;
  }
}
}