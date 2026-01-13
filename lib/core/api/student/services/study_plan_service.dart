import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/study_plan_request.dart';
import 'package:telmeeth/core/api/model/response/study_plan_response.dart';
import 'package:telmeeth/core/api/model/response/study_plan_model.dart';

class StudyPlanService {
  /// CREATE
  Future<StudyPlanResponse?> createStudyPlan(StudyPlanRequest request) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        '/student/study-plans',
        data: request.toJson(),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      print("CREATE PLAN RESPONSE: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return StudyPlanResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('Create Study Plan Error: $e');
      return null;
    }
  }

  /// GET ALL
  Future<List<StudyPlanModel>> getStudyPlans() async {
    try {
      final dio = await ApiClient.getDio();
      final response = await dio.get('/student/study-plans');
      final List list = response.data is List ? response.data : [];
      return list.map((e) => StudyPlanModel.fromJson(e)).toList();
    } catch (e) {
      print('Get Study Plans Error: $e');
      return [];
    }
  }

  /// DELETE
  Future<bool> deleteStudyPlan(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final response = await dio.delete('/student/study-plans/$id');
      return response.statusCode == 200;
    } catch (e) {
      print('Delete Study Plan Error: $e');
      return false;
    }
  }
}
