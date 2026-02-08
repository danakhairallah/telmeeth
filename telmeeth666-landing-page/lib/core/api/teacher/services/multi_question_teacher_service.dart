import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/multi_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_update.dart';

class MultiQuestionTeacherService {
  Dio? dio;

  Future<ExamMultiQuestionModel?> getMultiQuestions(int examId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/exams/$examId/mc-questions",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamMultiQuestionModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get MC Questions Error: $e");
      return null;
    }
  }

  Future<ExamMultiQuestionPost?> addMultiQuestion(
      int examId, MCQuestionRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/exams/$examId/mc-questions",
        data: await request.toFormData(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamMultiQuestionPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Add MC Question Error: $e");
      return null;
    }
  }

  Future<ExamMultiQuestionDetails?> getMultiQuestionDetails(
    int examId, int questionId) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/teacher/exams/$examId/mc-questions/$questionId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return ExamMultiQuestionDetails.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get MC Question Details Error: $e");
    return null;
  }
}

Future<ExamMultiQuestionUpdate?> updateMultiQuestion(
      int examId, int questionId , MCQuestionRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/exams/$examId/mc-questions/$questionId",
        data: await request.toFormData(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamMultiQuestionUpdate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Add MC Question Error: $e");
      return null;
    }
  }

  Future<ExamMultiQuestionDelete?> deleteMultiQuestion(
    int examId, int questionId) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.delete(
      "/teacher/exams/$examId/mc-questions/$questionId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      return ExamMultiQuestionDelete.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Delete MC Question Error: $e");
    return null;
  }
}


}