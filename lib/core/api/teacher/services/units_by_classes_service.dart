import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../model/response/unites_by_classes_model.dart';

class UnitsByClassesService {
  Dio? dio;

  Future<UnitsByClassesModel?> getUnitsByClasses(int classId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/units/$classId");

      if (response.statusCode == 200) {
        return UnitsByClassesModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Units: $e");
    }
    return null;
  }
}