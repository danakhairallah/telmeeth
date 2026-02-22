import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/time_table_model_parent.dart';

class TimeTableService {
  Dio? dio;

  Future<TimeTableModelParent?> getTimeTableParentById(int studentId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/time-table/$studentId",
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");
      print(ApiClient.baseUrl);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return TimeTableModelParent.fromJson(response.data);
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