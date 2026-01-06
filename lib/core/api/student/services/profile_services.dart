import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/update_profile_requect.dart';
import 'package:telmeeth/core/api/model/response/profile_model.dart';

class ProfileServices {
  Dio? dio;
  Future<ProfileModel?> getStudentProfile() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Attendance API: $token");

      final response = await dio.get(
        "/student/profile",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Profile API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        return ProfileModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Profile API error: $e");
      return null;
    }
  }

  Future<ProfileModel?> updateProfile(UpdateProfileRequest request) async {

  final dio = await ApiClient.getDio();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("accessToken") ?? "";

  final response = await dio.post(
    "/student/update",
    data: request.toJson(),
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );

  if (response.statusCode == 200 && response.data['status'] == true) {
    return ProfileModel.fromJson(response.data);
  }

  return null;
}
}