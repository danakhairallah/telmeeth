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

      final response = await dio.get(
        "/parent/student-discounts",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      print("DISCOUNTS API RAW RESPONSE: ${response.data}");

      if (response.statusCode == 200) {
        return ParentStudentDiscountsResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Discounts API error: $e");
      return null;
    }
  }
}
