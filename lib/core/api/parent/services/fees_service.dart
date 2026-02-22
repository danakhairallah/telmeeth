import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/fees_paid_model.dart';
import 'package:telmeeth/core/api/parent/model/response/remianing_fees_model.dart';
import 'package:telmeeth/core/api/parent/model/response/total_fees_model.dart';

class FeesService {

  Future<FeesPaidModel?> getFeesPaidByStudentId(int studentId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      print("===== FETCH PAID FEES =====");
      print("Student ID: $studentId");

      final response = await dio.get(
        "/parent/fees/paid/$studentId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      print("STATUS CODE (PAID): ${response.statusCode}");
      print("RAW RESPONSE (PAID): ${response.data}");

      if (response.statusCode == 200) {
        return FeesPaidModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Fees Paid Error: $e");
      return null;
    }
  }

  Future<TotalFeesModel?> getTotalFeesByStudentId(int studentId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      print("===== FETCH TOTAL FEES =====");
      print("Student ID: $studentId");

      final response = await dio.get(
        "/parent/fees/total/$studentId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      print("STATUS CODE (TOTAL): ${response.statusCode}");
      print("RAW RESPONSE (TOTAL): ${response.data}");

      if (response.statusCode == 200) {
        return TotalFeesModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Total Fees Error: $e");
      return null;
    }
  }

  Future<RemainingFeesModel?> getRemainingFeesByStudentId(int studentId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      print("===== FETCH REMAINING FEES =====");
      print("Student ID: $studentId");

      final response = await dio.get(
        "/parent/fees/remaining/$studentId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      print("STATUS CODE (REMAINING): ${response.statusCode}");
      print("RAW RESPONSE (REMAINING): ${response.data}");

      if (response.statusCode == 200) {
        return RemainingFeesModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Remaining Fees Error: $e");
      return null;
    }
  }
}