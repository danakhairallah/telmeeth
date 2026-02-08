import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_multi_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_update.dart';

class WorksheetMultiQuestionService {
  Dio? dio;

  Future<WorksheetMultiQuestionModel?> getMultiQuestions(int worksheetId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/worksheets/$worksheetId/mc-questions",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetMultiQuestionModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getMultiQuestions: $e");
    }
    return null;
  }

  Future<WorksheetMultiQuestionPost?> addMultiQuestion(
    int worksheetId,
    WorksheetMultiQuestionRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/worksheets/$worksheetId/mc-questions",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WorksheetMultiQuestionPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in addMultiQuestion: $e");
    }
    return null;
  }

  Future<WorksheetMultiQuestionUpdate?> updateMultiQuestion(
    int worksheetId,
    int questionId,
    WorksheetMultiQuestionRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/worksheets/$worksheetId/mc-questions/$questionId",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WorksheetMultiQuestionUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateMultiQuestion: $e");
    }
    return null;
  }

  Future<WorksheetMultiQuestionDelete?> deleteMultiQuestion(
    int worksheetId,
    int questionId,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/worksheets/$worksheetId/mc-questions/$questionId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return WorksheetMultiQuestionDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteMultiQuestion: $e");
    }
    return null;
  }
}
