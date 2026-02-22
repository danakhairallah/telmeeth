import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../model/response/attendance_parent_model.dart';

class AttendanceParentService {
  Dio? dio;

  Future<AttendanceParentModel?> getParentAttendance(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/attendance/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE DATA: ${response.data}");

      if (response.statusCode == 200) {
        return AttendanceParentModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Parent Attendance Error: $e");
      return null;
    }
  }}
