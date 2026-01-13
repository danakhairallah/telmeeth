import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/task_request.dart';
import 'package:telmeeth/core/api/model/response/task.dart';
import 'package:telmeeth/core/api/model/response/task_detile_response.dart';
import 'package:telmeeth/core/api/model/response/task_result_response.dart';

class TaskServices {
  Dio? dio;

  /// ===== جلب كل الـ Tasks =====
  Future<List<Task>> getTasks() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/tasks",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return (response.data['data'] as List)
            .map((e) => Task.fromJson(e))
            .toList();
      }

      return [];
    } catch (e) {
      print("Get Tasks error: $e");
      return [];
    }
  }

  /// ===== جلب Task حسب ID =====
  Future<TaskDetailResponse?> getTaskById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/task/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return TaskDetailResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Task by ID error: $e");
      return null;
    }
  }

  /// ===== إرسال إجابات Task =====
  Future<bool> submitTask(int taskId, TaskSubmitRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/student/task/$taskId/submit",
        data: request.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return response.statusCode == 200 && response.data['status'] == true;
    } catch (e) {
      print("Submit Task error: $e");
      return false;
    }
  }

  /// ===== جلب نتيجة Task =====
  Future<TaskResultResponse?> getTaskResult(int taskId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/task/$taskId/result",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return TaskResultResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Task Result error: $e");
      return null;
    }
  }
}
