import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/school_model.dart';

class SchoolServices {
  Dio? dio;

  Future<SchoolModel?> getSchools() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/schools",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return SchoolModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      if (e is DioException) {
        print("Dio error: ${e.response?.data}");
      } else {
        print("Unexpected error: $e");
      }
      return null;
    }
  }
}