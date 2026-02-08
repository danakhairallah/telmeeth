import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/unite_model.dart';

class UnitServices {
  Dio? dio;

  Future<UnitsModel?> getUnitById(int classId) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.get("/student/units/$classId");

    print("Full response: ${response.data}");

    if (response.statusCode == 200) {
       if (response.statusCode == 200) {
  final mapData = Map<String, dynamic>.from(response.data);
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