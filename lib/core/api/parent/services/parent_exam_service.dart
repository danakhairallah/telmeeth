import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/parent_exam_model.dart';

class ParentExamService {
  Dio? dio;

  Future<ParentExamModel?> getParentExams(int studentId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/parent/exams/$studentId",
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      if (response.statusCode == 200 &&
          response.data['success'] == true) {
        return ParentExamModel.fromJson(response.data);
      }

      return null;

    } catch (e) {
      if (e is DioException) {
        print("Dio error: ${e.response?.data}");
      } else {
        print("Unexpected error: $e");
      }
      return null;

    }
  }}
