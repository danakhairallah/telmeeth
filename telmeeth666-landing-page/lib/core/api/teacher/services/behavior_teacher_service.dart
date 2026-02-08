import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/behavior_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_update.dart';

class BehaviorTeacherService {
  Dio? dio;

  Future<List<BehaviorTeacherModel>?> getTeacherBehaviors() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/behaviors",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        // بما أن الريسبونس عبارة عن List
        List list = response.data as List;

        return list
            .map((e) => BehaviorTeacherModel.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Behaviors Error: $e");
      return null;
    }
  }

  Future<BehaviorTeacherModel?> getBehaviorById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/behaviors/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return BehaviorTeacherModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Behavior By Id Error: $e");
      return null;
    }
  }

  Future<BehaviorTeacherPost?> addBehavior(
      BehaviorTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/behaviors",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return BehaviorTeacherPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Add Behavior Error: $e");
      return null;
    }
  }

  Future<BehaviorTeacherUpdate?> updateBehavior(
      int id,
      BehaviorTeacherRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/behaviors/$id",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        return BehaviorTeacherUpdate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Update Behavior Error: $e");
      return null;
    }
  }

  Future<BehaviorTeacherDelete?> deleteBehavior(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/behaviors/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        return BehaviorTeacherDelete.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Delete Behavior Error: $e");
      return null;
    }
  }
}
