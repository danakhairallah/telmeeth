import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/behavior_model.dart';

class BehaviorServices {
  Future<BehaviorResponse?> getStudentBehaviors() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/behaviors",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return BehaviorResponse.fromJson(
          Map<String, dynamic>.from(response.data),
        );
      }
      return null;
    } catch (e) {
      print("Behavior API error: $e");
      return null;
    }
  }
}
