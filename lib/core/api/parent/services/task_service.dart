import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../model/response/task_details_model.dart';
import '../model/response/tasks_model.dart';

class TaskService {
  Dio? dio;

  Future<TasksModel?> getTask(int studentId) async {
    try {
      final dio = await ApiClient.getDio();

      /// 🔥 اطبع base url
      print("BASE URL: ${dio.options.baseUrl}");

      /// 🔥 اطبع endpoint
      print("ENDPOINT: /parent/tasks/$studentId");

      final fullUrl = "${dio.options.baseUrl}/parent/tasks/$studentId";
      print("FULL URL: $fullUrl");

      final response = await dio.get(
        "/parent/tasks/$studentId",
      );

      /// 🔥 اطبع status code
      print("STATUS CODE: ${response.statusCode}");

      /// 🔥 اطبع نوع البيانات
      print("RESPONSE TYPE: ${response.data.runtimeType}");

      /// 🔥 اطبع الريسبونس كامل
      print("RESPONSE DATA: ${response.data}");

      if (response.statusCode == 200 &&
          response.data['success'] == true) {
        return TasksModel.fromJson(response.data);
      }

      print("⚠️ success != true OR status != 200");
      return null;

    } catch (e) {
      print("❌ ERROR CAUGHT");
      print("ERROR TYPE: ${e.runtimeType}");
      print("ERROR DETAILS: $e");

      if (e is DioException) {
        print("DIO STATUS: ${e.response?.statusCode}");
        print("DIO DATA: ${e.response?.data}");
        print("DIO REQUEST URL: ${e.requestOptions.uri}");
      }

      return null;
    }
  }
  Future<TaskDetailsModel?> getTaskDetails(int studentId , int taskId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/parent/tasks/$studentId/$taskId",
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return TaskDetailsModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Tasks Details by ID error: $e");
      return null;
    }
  }
}