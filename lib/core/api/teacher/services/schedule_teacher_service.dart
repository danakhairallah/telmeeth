import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/schedule_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_update.dart';

class ScheduleTeacherService {
  Dio? dio;

  Future<ScheduleTeacherModel?> getSchedules() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/schedules",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ScheduleTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getSchedules: $e");
    }
    return null;
  }

  Future<ScheduleTeacherPost?> addSchedule(ScheduleTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/schedules",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ScheduleTeacherPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in addSchedule: $e");
    }
    return null;
  }

  Future<ScheduleTeacherDetails?> getScheduleDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/schedules/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ScheduleTeacherDetails.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getScheduleDetails: $e");
    }
    return null;
  }

  Future<ScheduleTeacherUpdate?> updateSchedule(
    int id,
    ScheduleTeacherRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/teacher/schedules/$id",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ScheduleTeacherUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateSchedule: $e");
    }
    return null;
  }

  Future<ScheduleTeacherDelete?> deleteSchedule(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/schedules/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return ScheduleTeacherDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteSchedule: $e");
    }
    return null;
  }
}

