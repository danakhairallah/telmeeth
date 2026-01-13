import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/subject_model.dart';
import 'package:telmeeth/core/api/model/response/unite_model.dart';

class SubjectServices {
  Dio? dio;

   Future<SubjectModel?> getSubjects() async {
    try {
      Dio dio = await ApiClient.getDio();

      // جلب التوكن من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      print("Token used for Subject API: $token");

      final response = await dio.get(
        "/student/subjects",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("Subject API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        return SubjectModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Subjects API error: $e");
      return null;
    }
  }

  Future<UnitsModel?> getUnitById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/units/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return UnitsModel.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Subject by ID API error: $e");
      return null;
    }
  }
}