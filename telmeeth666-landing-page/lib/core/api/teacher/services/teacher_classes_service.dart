import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_classes_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/classes_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_update.dart';

class TeacherClassesService {
  Dio? dio;

  Future<ClassesTeacherModel?> getTeacherClasses() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/classes-teacher",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ClassesTeacherModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Classes Error: $e");
      return null;
    }
  }

  Future<ClassesTeacherPost?> postTeacherClass(
      TeacherClassesRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/classes-teacher",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ClassesTeacherPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Post Teacher Classes Error: $e");
      return null;
    }
  }

  Future<ClassesTeacherDetailes?> getTeacherClassDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/classes-teacher/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ClassesTeacherDetailes.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Class Details Error: $e");
      return null;
    }
  }

  Future<ClassesTeacherUpdate?> updateTeacherClass(
    int id,
    TeacherClassesRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/teacher/classes-teacher/$id",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ClassesTeacherUpdate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Update Teacher Classes Error: $e");
      return null;
    }
  }

  Future<ClassesTeacherDelete?> deleteTeacherClass(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/classes-teacher/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ClassesTeacherDelete.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Delete Teacher Classes Error: $e");
      return null;
    }
  }
}