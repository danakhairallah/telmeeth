import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_update.dart';

class WorksheetTeacherService {
  Dio? dio;

  Future<WorksheetTeacherModel?> getTeacherWorksheets() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/worksheet",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetTeacherModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Worksheets Error: $e");
      return null;
    }
  }

  Future<WorksheetTeacherPost?> addTeacherWorksheet(
      WorksheetTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/worksheet",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetTeacherPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Add Teacher Worksheet Error: $e");
      return null;
    }
  }

  Future<WorksheetTeacherDetailes?> getWorksheetDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/worksheet/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetTeacherDetailes.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Worksheet Details Error: $e");
      return null;
    }
  }

  Future<WorksheetTeacherUpdate?> updateWorksheet(
      int id, WorksheetTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/teacher/worksheet/$id",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetTeacherUpdate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Update Worksheet Error: $e");
      return null;
    }
  }

  Future<WorksheetTeacherDelete?> deleteWorksheet(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/worksheet/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetTeacherDelete.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Delete Worksheet Error: $e");
      return null;
    }
  }

}
