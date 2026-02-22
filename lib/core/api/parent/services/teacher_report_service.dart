import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/teacher_report_model.dart';

class TeacherReportService {
  Dio? dio;

  Future<TeacherReportModel?> getTeacherReports(int studentId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/teacher-reports/$studentId",
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return TeacherReportModel.fromJson(response.data);
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