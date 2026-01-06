import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/website_activity.dart';

class ActivityWebsiteServices {

  Dio? dio;
  Future<WebsiteActivity?> getWebsiteActivity() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Activity API: $token");

      final response = await dio.get(
        "/student/website-attendance",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Activity API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return WebsiteActivity.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Activity API error: $e");
      return null;
    }
  }
}
