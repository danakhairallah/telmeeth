import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/exam_request.dart';
import 'package:telmeeth/core/api/student/model/response/exam_aq.dart';
import 'package:telmeeth/core/api/student/model/response/exam_model.dart';
import 'package:telmeeth/core/api/student/model/response/exam_resuilt.dart';
import 'package:telmeeth/core/api/student/model/response/submit_exam_response.dart';

class ExamServices {
  // ================= GET EXAMS =================
  Future<ExamModel?> getExam() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/exams",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return ExamModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Exam API error: $e");
      return null;
    }
  }

  // ================= GET QUESTIONS =================
  Future<ExamQA?> getExamQuestions(int examId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/exam/$examId/questions",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return ExamQA.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Get Exam Questions error: $e");
      return null;
    }
  }

  // ================= SUBMIT =================
  Future<SubmitExamResponse?> submitExamAnswers({
    required int examId,
    required ExamRequest request,
  }) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/student/exam/$examId/submit",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        return SubmitExamResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Submit Exam API error: $e");
      return null;
    }
  }

  // ================= RESULT =================
  Future<ExamResuilt?> getExamResult(int examId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/exam/$examId/result",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return ExamResuilt.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Get Exam Result error: $e");
      return null;
    }
  }
}
