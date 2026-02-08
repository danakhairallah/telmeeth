import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/average_detail.dart';
import 'package:telmeeth/core/api/student/model/response/average_model.dart';

class AverageServices {
  Dio? dio;

  Future<AveragModel?> getAverage() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Average API: $token");

      final response = await dio.get(
        "/student/average",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Average API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return AveragModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Average API error: $e");
      return null;
    }
  }

  Future<AverageDetile?> getAverageById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/average/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return AverageDetile.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Average by ID API error: $e");
      return null;
    }
  }
}