import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/marks_detile.dart';
import 'package:telmeeth/core/api/student/model/response/marks_model.dart';

class MarksServices {
  Dio? dio;

  Future<MarkModel?> getMarks() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Marks API: $token");

      final response = await dio.get(
        "/student/marks",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Marks API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return MarkModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Marks API error: $e");
      return null;
    }
  }

  Future<MarkDetile?> getMarksById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/marks/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return MarkDetile.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Marks by ID API error: $e");
      return null;
    }
  }
}