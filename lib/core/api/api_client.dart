import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static const baseUrl = "https://api.telmeeth.net/api";

  static Future<Dio> getDio() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    print("🔥 ApiClient BaseUrl Used: $baseUrl");
    return Dio(options);
  }
}
