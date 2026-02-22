import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/api_response.dart';
import 'package:telmeeth/core/api/student/model/response/auth.dart';

class AuthServices {
  Dio? dio;

  Future<ApiResponse<User>> login({
    required String userName,
    required String password,
  }) async {
    dio = await ApiClient.getDio();

    try {
      final response = await dio!.post(
        "/login",
        data: {
          "user_name": userName,
          "password": password,
        },
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        final token = response.data['data']['token'];
        final userJson = response.data['data']['user'];

        // **حفظ التوكن في SharedPreferences**
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("accessToken", token);

        User user = User.fromJson(userJson , token: token);

        return ApiResponse(
          data: user,
          statusCode: response.statusCode,
          message: response.data['message'],
        );
      }

      return ApiResponse(
        statusCode: response.statusCode,
        message: response.data['message'],
      );
    } catch (e) {
      if (e is DioException) {
        return ApiResponse(
          statusCode: e.response?.statusCode ?? 0,
          message: e.response?.data['message'] ?? "Request failed",
        );
      }
      return ApiResponse(statusCode: 0, message: "Unexpected error");
    }
  }
}
