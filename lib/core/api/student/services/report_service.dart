
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/report_model.dart';

class ReportService {
  Future<List<ReportModel>> getTeacherReports() async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/reports",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List reportsJson = response.data["reports"];
        return reportsJson.map((e) => ReportModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("Reports API Error: $e");
      return [];
    }
  }

}
