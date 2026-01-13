import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/request/exam_request.dart';
import 'package:telmeeth/core/api/model/response/exam_aq.dart';
import 'package:telmeeth/core/api/model/response/exam_data.dart';
import 'package:telmeeth/core/api/model/response/exam_model.dart';
import 'package:telmeeth/core/api/model/response/exam_resuilt.dart';
import 'package:telmeeth/core/api/model/response/submit_exam_response.dart';
import 'package:telmeeth/core/api/student/services/exam_services.dart';

class ExamController with ChangeNotifier {
  final ExamServices _services = ExamServices();

  // ================= UI STATE =================
  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";

  // ================= DATA =================
  ExamModel? examModel;
  ExamDetile? examDetail;
  ExamQA? examQuestions;
  ExamResuilt? examResult;

  // ================= SUBMIT RESULT =================
  bool examSubmitSuccess = false;
  String examSubmitMessage = "";

  // ================= GET ALL EXAMS =================
  Future<void> getExam() async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      examModel = await _services.getExam();
      if (examModel == null) {
        isError = true;
        errorMessage = "Failed to fetch exams";
      }
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= GET EXAM QUESTIONS =================
  Future<void> getExamQuestions(int examId) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      examQuestions = await _services.getExamQuestions(examId);
      if (examQuestions == null) {
        isError = true;
        errorMessage = "Failed to load questions";
      }
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= SUBMIT EXAM =================
  Future<void> submitExam(int examId, ExamRequest request) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      final response = await _services.submitExamAnswers(
        examId: examId,
        request: request,
      );

      if (response != null) {
        examSubmitSuccess = response.status;
        examSubmitMessage = response.message;
      } else {
        isError = true;
        errorMessage = "Failed to submit exam answers";
      }
    } catch (e) {
      isError = true;
      errorMessage = "Error submitting exam answers: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= GET RESULT =================
  Future<void> getExamResult(int examId) async {
    isLoading = true;
    notifyListeners();

    try {
      examResult = await _services.getExamResult(examId);
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
