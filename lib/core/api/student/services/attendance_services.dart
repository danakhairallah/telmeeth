import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/attendance.dart';

class AttendanceServices {
  Future<AttendanceModel?> getAttendance() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Attendance API: $token");

      final response = await dio.get(
        "/student/attendances",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Attendance API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return AttendanceModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Attendance API error: $e");
      return null;
    }
  }
}
