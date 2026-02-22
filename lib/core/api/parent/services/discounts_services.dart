import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/parent/model/response/student_discounts_model.dart';
import '../../api_client.dart';

class DiscountsServices {
  Future<ParentStudentDiscountsResponse?> getStudentDiscounts() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      print("🔵 TOKEN: $token");
      print("🔵 BASE URL: ${dio.options.baseUrl}");
      print("🔵 ENDPOINT: /parent/student-discounts");

      final response = await dio.get(
        "/parent/student-discounts",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      print("🟢 STATUS CODE: ${response.statusCode}");
      print("🟢 RAW RESPONSE: ${response.data}");

      if (response.statusCode == 200) {
        final parsed = ParentStudentDiscountsResponse.fromJson(response.data);
        print("🟢 PARSED STUDENTS COUNT: ${parsed.students?.length}");
        return parsed;
      }

      print("🔴 STATUS NOT 200");
      return null;

    } catch (e) {
      print("🔴 SERVICE ERROR: $e");
      return null;
    }
  }
}
