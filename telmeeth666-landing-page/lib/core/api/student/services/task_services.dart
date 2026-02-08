import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/task_request.dart';
import 'package:telmeeth/core/api/student/model/response/task.dart';
import 'package:telmeeth/core/api/student/model/response/task_detile_response.dart';
import 'package:telmeeth/core/api/student/model/response/task_result_response.dart';
import 'package:telmeeth/core/api/student/model/response/task_submit_response.dart';

class TaskServices {
  Dio? dio;

  Future<List<Task>> getTasks() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/student/tasks");

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

      final response = await dio.get("/student/task/$id");

      if (response.statusCode == 200 && response.data['status'] == true) {
        return TaskDetailResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Task by ID error: $e");
      return null;
    }
  }

  Future<TaskSubmitResponse> submitTask(int taskId, TaskSubmitRequest request) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.post(
      "/student/task/$taskId/submit",
      data: request.toJson(),
    );

    if (response.statusCode == 200 && response.data != null) {
      return TaskSubmitResponse.fromJson(response.data);
    } else {
      return TaskSubmitResponse(
        message: "Failed to submit task (Status code: ${response.statusCode})",
        totalMark: null,
      );
    }
  } catch (e) {
    print("Submit Task error: $e");
    return TaskSubmitResponse(
      message: "Failed to submit task due to error",
      totalMark: null,
    );
  }
}

  Future<TaskResultResponse?> getTaskResult(int taskId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/student/task/$taskId/result");

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
