import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/streak_leaderbored.dart';

class StreakServices {
  Dio? dio;

  Future<StreakLeaderboardModel?> getStreakLeaderboard() async {
    try {
      final dio = await ApiClient.getDio();

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/streak/leaderboard",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      print("Streak Leaderboard Response: ${response.data}");

      if (response.statusCode == 200) {
        final mapData = Map<String, dynamic>.from(response.data);
        return StreakLeaderboardModel.fromJson(mapData);
      }

      return null;
    } catch (e) {
      print("Get Streak Leaderboard API error: $e");
      return null;
    }
  }
}
