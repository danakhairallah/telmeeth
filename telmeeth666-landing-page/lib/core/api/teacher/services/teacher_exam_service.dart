import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_exam_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_update.dart';

class TeacherExamService {
  Dio? dio;

  Future<TeacherExamModel?> getTeacherExams() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/exams",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return TeacherExamModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Exams Error: $e");
      return null;
    }
  }

  Future<TeacherExamDetails?> getTeacherExamDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/exams/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return TeacherExamDetails.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Exam Details Error: $e");
      return null;
    }
  }

  Future<TeacherExamPost?> addTeacherExam(
      TeacherExamRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/exams",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return TeacherExamPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Post Teacher Exam Error: $e");
      return null;
    }
  }

  Future<TeacherExamUpdate?> updateTeacherExam(
    int id,
    TeacherExamRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/teacher/exams/$id",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return TeacherExamUpdate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Update Teacher Exam Error: $e");
      return null;
    }
  }

  Future<TeacherExamDelete?> deleteTeacherExam(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/exams/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return TeacherExamDelete.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Delete Teacher Exam Error: $e");
      return null;
    }
  }
}