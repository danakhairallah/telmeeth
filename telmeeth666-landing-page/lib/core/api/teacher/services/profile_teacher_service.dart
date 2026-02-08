import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/complete_profile_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/request/update_profile_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_complet.dart';
import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_update.dart';

class ProfileTeacherService {
  Dio? dio;

  Future<ProfileTeacherModel?> getProfile() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/profile",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ProfileTeacherModel.fromJson(response.data);
      } else {
        print("Get Profile failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Get Profile Error: $e");
      return null;
    }
  }

  Future<ProfileTeacherCompleteModel?> completeProfile(
      CompletProfileTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/api/teacher/complete-profile",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ProfileTeacherCompleteModel.fromJson(response.data);
      } else {
        print("Complete Profile failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Complete Profile Error: $e");
      return null;
    }
  }

  Future<ProfileTeacherUpdateModel?> updateProfile(
      UpdateProfileTeacherRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/api/teacher/update-profile",
        data: request.toFormData(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ProfileTeacherUpdateModel.fromJson(response.data);
      } else {
        print("Update Profile failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Update Profile Error: $e");
      return null;
    }
  }
}
