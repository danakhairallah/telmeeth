import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/student/model/response/bus_details_model.dart';
import 'package:telmeeth/core/api/api_client.dart';

class BusDetailsService {
  Future<BusDetailsResponse?> getBusDetails() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/bus-details",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("BUS API RAW RESPONSE: ${response.data}");

      if (response.statusCode == 200) {
        return BusDetailsResponse.fromJson(
            Map<String, dynamic>.from(response.data));
      }
      return null;
    } catch (e) {
      print("BusDetails API error: $e");
      return null;
    }
  }
}
