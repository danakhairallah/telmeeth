import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/schrdual_request.dart';
import 'package:telmeeth/core/api/model/response/schedual_model.dart';
import 'package:telmeeth/core/api/model/response/schedual_response.dart';

class SchedualServices {
  Dio? dio;

   Future<SchedulesResponse?> getScheduals() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Subject API: $token");

      final response = await dio.get(
        "/student/schedules",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Schedules API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return SchedulesResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Schedules API error: $e");
      return null;
    }
  }

  Future<ScheduleModel?> getSchedualById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/schedules/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return ScheduleModel.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Schedual by ID API error: $e");
      return null;
    }
  }

  Future<ScheduleModel?> addSchedual(SchedualRequest request) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.post(
      "/student/schedules",
      data: request.toJson(),
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      return ScheduleModel.fromJson(response.data['data']);
    }

    return null;
  } catch (e) {
    print("Add Schedual API error: $e");
    return null;
  }
}

Future<bool> deleteSchedual(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/student/schedules/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return response.statusCode == 200 && response.data['success'] == true;
    } catch (e) {
      print("Delete Schedual API error: $e");
      return false;
    }
  }

  Future<ScheduleModel?> updateSchedual(int id, SchedualRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/student/schedules/$id",
        data: request.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return ScheduleModel.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Update Schedual API error: $e");
      return null;
    }
  }
}