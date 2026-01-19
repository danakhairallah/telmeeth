import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/unite_model.dart';

class UnitServices {
  Dio? dio;

  Future<UnitsModel?> getUnitById(int classId) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/student/units/$classId",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    print("Full response: ${response.data}"); // ✨ debug

    if (response.statusCode == 200) {
       if (response.statusCode == 200) {
  final mapData = Map<String, dynamic>.from(response.data); // مباشرة من data
  return UnitsModel.fromJson(mapData);
       }

    }

    return null;
  } catch (e) {
    print("Get Units by ID API error: $e");
    return null;
  }
}

}