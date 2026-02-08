import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_essay_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_update.dart';

class WorksheetEssayQuestionService {
  Dio? dio;

  Future<WorksheetEssayQuestionModel?> getEssayQuestions(int worksheetId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/worksheets/$worksheetId/essay-questions",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return WorksheetEssayQuestionModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getEssayQuestions: $e");
    }
    return null;
  }

  Future<WorksheetEssayQuestionPost?> addEssayQuestion(
    int worksheetId,
    WorksheetEssayQuestionRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/worksheets/$worksheetId/essay-questions",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WorksheetEssayQuestionPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in addEssayQuestion: $e");
    }
    return null;
  }

  Future<WorksheetEssayQuestionUpdate?> updateEssayQuestion(
    int worksheetId,
    int questionId,
    WorksheetEssayQuestionRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/worksheets/$worksheetId/essay-questions/$questionId",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WorksheetEssayQuestionUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateEssayQuestion: $e");
    }
    return null;
  }

  Future<WorksheetEssayQuestionDelete?> deleteEssayQuestion(
    int worksheetId,
    int questionId,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/worksheets/$worksheetId/essay-questions/$questionId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return WorksheetEssayQuestionDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteEssayQuestion: $e");
    }
    return null;
  }
}
