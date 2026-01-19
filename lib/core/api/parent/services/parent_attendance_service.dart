import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/parent_attendance_model.dart';

class ParentAttendanceService {
  Dio? dio;
  
  Future<ParentAttendance?> getParentAttendanceById(int id) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/api/parent/attendance/$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return ParentAttendance.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("getParentAttendanceById error: $e");
    return null;
  }
}

}