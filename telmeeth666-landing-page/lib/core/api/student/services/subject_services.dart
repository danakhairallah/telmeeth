import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/subject_model.dart';
import 'package:telmeeth/core/api/student/model/response/unite_model.dart';

class SubjectServices {
  Dio? dio;

   Future<SubjectModel?> getSubjects() async {
    try {
      Dio dio = await ApiClient.getDio();

      final response = await dio.get("/student/subjects");

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

      final response = await dio.get("/student/units/$id");

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