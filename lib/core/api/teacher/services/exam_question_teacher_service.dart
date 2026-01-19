import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/exam_question_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_update.dart';

class ExamQuestionTeacherService {
  Dio? dio;

  Future<ExamQuestionTeacherModel?> getExamQuestions(int examId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/exams/$examId/essay-questions",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamQuestionTeacherModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Exam Questions Error: $e");
      return null;
    }
  }

  Future<ExamQuestionPost?> addExamQuestion(
      int examId, QuestionRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/exams/$examId/essay-questions",
        data: await request.toFormData(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamQuestionPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Add Exam Question Error: $e");
      return null;
    }
  }

  Future<ExamQuestionDetails?> getExamQuestionDetails(
      int examId, int questionId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/exams/$examId/essay-questions/$questionId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamQuestionDetails.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Exam Question Details Error: $e");
      return null;
    }
  }

  Future<ExamQuestionUpdate?> updateEssayQuestion(
      int examId, int questionId, QuestionRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/teacher/exams/$examId/essay-questions/$questionId",
        data: await request.toFormData(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamQuestionUpdate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Update Essay Question Error: $e");
      return null;
    }
  }

  Future<ExamQuestionDelete?> deleteEssayQuestion(
      int examId, int questionId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/exams/$examId/essay-questions/$questionId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return ExamQuestionDelete.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Delete Essay Question Error: $e");
      return null;
    }
  }
}
