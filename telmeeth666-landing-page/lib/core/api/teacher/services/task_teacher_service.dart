import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/task_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_update.dart';

class TaskTeacherService {
  Dio? dio;

  Future<TaskTeacherModel?> getTeacherTasks() async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/teacher/tasks",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return TaskTeacherModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Teacher Tasks Error: $e");
    return null;
  }
}

Future<TaskTeacherPost?> addTeacherTask(TaskTeacherRequest request) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.post(
      "/teacher/tasks",
      data: request.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return TaskTeacherPost.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Add Teacher Task Error: $e");
    return null;
  }
}

Future<TaskTeacherDetails?> getTeacherTaskDetails(int id) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/teacher/tasks/$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return TaskTeacherDetails.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Teacher Task Details Error: $e");
    return null;
  }
}

Future<TaskTeacherUpdate?> updateTeacherTask(
  int id,
  TaskTeacherRequest request,
) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.put(
      "/teacher/tasks/$id",
      data: request.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return TaskTeacherUpdate.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Update Teacher Task Error: $e");
    return null;
  }
}

Future<TaskTeacherDelete?> deleteTeacherTask(int id) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.delete(
      "/teacher/tasks/$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return TaskTeacherDelete.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Delete Teacher Task Error: $e");
    return null;
  }
}


}