import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/time_table_model.dart';

class TimeTableServices {
  Dio? dio;

  Future<TimeTableModel?> getTimeTable() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Subject API: $token");

      final response = await dio.get(
        "/student/timetable",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("TimeTable API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['data'] != null) {
  return TimeTableModel.fromJson(response.data);
}


      return null;
    } catch (e) {
      print("TimeTable API error: $e");
      return null;
    }
  }
}