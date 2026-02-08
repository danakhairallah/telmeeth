import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/interactive_lesson_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_detailes.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_update.dart';

class InteractiveLessonTeacherService {
  Dio? dio;

  Future<InteractiveLessonTeacherModel?> getInteractiveLessons() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/interactive-lessons",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return InteractiveLessonTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getInteractiveLessons: $e");
    }

    return null;
  }

  Future<InteractiveLessonTeacherDetails?> getInteractiveLessonDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/interactive-lessons/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return InteractiveLessonTeacherDetails.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getInteractiveLessonDetails: $e");
    }
    return null;
  }

  Future<InteractiveLessonTeacherPost?> addInteractiveLesson(
      InteractiveLessonRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/interactive-lessons",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return InteractiveLessonTeacherPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in addInteractiveLesson: $e");
    }
    return null;
  }

  Future<InteractiveLessonTeacherUpdate?> updateInteractiveLesson(
    int id,
    InteractiveLessonRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/interactive-lessons/$id",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return InteractiveLessonTeacherUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateInteractiveLesson: $e");
    }
    return null;
  }

  Future<InteractiveLessonTeacherDelete?> deleteInteractiveLesson(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/interactive-lessons/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return InteractiveLessonTeacherDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteInteractiveLesson: $e");
    }
    return null;
  }
}
