import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/highlight_request.dart' show HighlightRequest;
import 'package:telmeeth/core/api/student/model/response/highlight_data.dart';
import 'package:telmeeth/core/api/student/model/response/highlight_model.dart';

class HighlightServices {
  Dio? dio;

  Future<HighlightModel?> getHighlight() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Highlight API: $token");

      final response = await dio.get(
        "/student/highlights",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Highlight API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return HighlightModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Highlight API error: $e");
      return null;
    }
  }

  Future<HighlightData?> addHighlight(HighlightRequest request) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.post(
      "/student/highlights",
      data: request.toJson(),
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      return HighlightData.fromJson(response.data['data']);
    }

    return null;
  } catch (e) {
    print("Add Highlight API error: $e");
    return null;
  }
}

// GET Highlight by id
  Future<HighlightData?> getHighlightById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/highlights/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return HighlightData.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Highlight by ID API error: $e");
      return null;
    }
  }

  // PUT / update Highlight by id
  Future<HighlightData?> updateHighlight(int id, HighlightRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/student/highlights/$id",
        data: request.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return HighlightData.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Update Highlight API error: $e");
      return null;
    }
  }

  // DELETE Highlight by id
  Future<bool> deleteHighlight(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/student/highlights/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return response.statusCode == 200 && response.data['success'] == true;
    } catch (e) {
      print("Delete Highlight API error: $e");
      return false;
    }
  }

}
