import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/attendance_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_detailes.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_put.dart';

class AttendanceTeacherService {
  Dio? dio;

  Future<AttendanceTeacherModel?> getTeacherAttendances() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/attendances",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return AttendanceTeacherModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Attendances Error: $e");
      return null;
    }
  }

  Future<AttendanceTeacherDetails?> getAttendanceById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/attendances/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return AttendanceTeacherDetails.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Attendance By Id Error: $e");
      return null;
    }
  }

  Future<AttendanceTeacherPost?> addAttendance(
      AttendanceTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/attendances",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AttendanceTeacherPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Add Attendance Error: $e");
      return null;
    }
  }

  Future<AttendanceTeacherPut?> updateAttendance(
    int id,
    AttendanceTeacherRequest request, // نفس Request تبع POST
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/teacher/attendances/$id",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return AttendanceTeacherPut.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Update Attendance Error: $e");
      return null;
    }
  }

  Future<AttendanceTeacherDelete?> deleteAttendance(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/attendances/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return AttendanceTeacherDelete.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Delete Attendance Error: $e");
      return null;
    }
  }
}
