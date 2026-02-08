import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/school_days_model.dart';

class SchoolDaysService {
  Dio? dio;

  Future<SchoolDaysModel?> getSchoolDays() async {
    try {
      Dio dio = await ApiClient.getDio();

      final response = await dio.get("/student/school-days");

      if (response.statusCode == 200) {
        return SchoolDaysModel.fromJson(response.data);
      }
      print("School Days API Response: ${response.data}");

      return null;
    } catch (e) {
      print("School Days API error: $e");
      return null;
    }
  }

}