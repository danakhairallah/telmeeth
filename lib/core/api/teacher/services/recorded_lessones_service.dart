import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/recorded_lessones_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_update.dart';

class RecordedLessonsTeacherService {
  Dio? dio;

  Future<RecordedLessonesTeacherModel?> getRecordedLessons() async {
    try {
      final dio = await ApiClient.getDio(); // استدعاء Dio من ApiClient
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/recorded-lessons",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return RecordedLessonesTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getRecordedLessons: $e");
    }

    return null;
  }

  Future<RecordedLessonesTeacherPost?> addRecordedLesson(
      RecordedLessonRequest request) async {
    try {
      final dio = await ApiClient.getDio(); // جلب Dio من ApiClient
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/api/teacher/recorded-lessons",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RecordedLessonesTeacherPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in addRecordedLesson: $e");
    }
    return null;
  }

  Future<RecordedLessonesTeacherDetails?> getRecordedLessonDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/api/teacher/recorded-lessons/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return RecordedLessonesTeacherDetails.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getRecordedLessonDetails: $e");
    }

    return null;
  }

  Future<RecordedLessonesTeacherUpdate?> updateRecordedLesson(
      int id, RecordedLessonRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/api/teacher/recorded-lessons/$id",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RecordedLessonesTeacherUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateRecordedLesson: $e");
    }
    return null;
  }

  Future<RecordedLessonesTeacherDelete?> deleteRecordedLesson(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/api/teacher/recorded-lessons/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return RecordedLessonesTeacherDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteRecordedLesson: $e");
    }

    return null;
  }
}
