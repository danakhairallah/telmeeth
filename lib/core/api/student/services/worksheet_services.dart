import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/worksheet_request.dart';
import 'package:telmeeth/core/api/model/response/worksheet.dart';
import 'package:telmeeth/core/api/model/response/worksheet_data.dart';

class WorksheetServices {
  Dio? dio;

  // جلب كل الـ Worksheets
  Future<List<WorksheetData>?> getWorksheets() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/worksheets",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return (response.data['data'] as List)
    .map((e) => WorksheetData(
          worksheet: Worksheet.fromJson(e), // كل عنصر كـ Worksheet
          totalMark: null, // لأنه endpoint اللي يجلب القائمة ما فيه totalMark
        ))
    .toList();

      }

      return null;
    } catch (e) {
      print("Get Worksheets error: $e");
      return null;
    }
  }

  // جلب Worksheet حسب ID
  Future<WorksheetData?> getWorksheetById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/worksheet/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
  return WorksheetData.fromJson(response.data['data']); // بدون ['worksheet']
}


      return null;
    } catch (e) {
      print("Get Worksheet by ID error: $e");
      return null;
    }
  }

  // إرسال الإجابات
  Future<bool> submitWorksheet(int worksheetId, WorksheetSubmitRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/student/worksheet/$worksheetId/submit",
        data: request.toJson(),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      return response.statusCode == 200 && response.data['status'] == true;
    } catch (e) {
      print("Submit Worksheet error: $e");
      return false;
    }
  }
}
