import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/lesson_model.dart';

class LessonServices {
  Dio? dio;

  Future<LessonModel?> getLessonById(int Unitid) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/lessons/$Unitid",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

     if (response.statusCode == 200) {
  return LessonModel.fromJson(response.data); // مباشرة
}


      return null;
    } catch (e) {
      print("Get Lessons by ID API error: $e");
      return null;
    }
  }
}