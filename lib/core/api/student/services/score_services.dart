import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/score_model.dart';

class ScoreServices {
  Dio? dio;

   Future<ScoreModel?> getScore() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Marks API: $token");

      final response = await dio.get(
        "/student/scores",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Scores API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return ScoreModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Score API error: $e");
      return null;
    }
  }
}