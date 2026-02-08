import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/multi_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_update.dart';
import 'package:telmeeth/core/api/teacher/services/multi_question_teacher_service.dart';

class MultiQuestionTeacherController extends ChangeNotifier {
  final MultiQuestionTeacherService _service = MultiQuestionTeacherService();

  bool isLoading = false;

  ExamMultiQuestionModel? questionsModel;
  ExamMultiQuestionDetails? questionDetails;
  ExamMultiQuestionPost? postResult;
  ExamMultiQuestionUpdate? updateResult;
  ExamMultiQuestionDelete? deleteResult;

  /// ===================== GET ALL =====================
  Future<ExamMultiQuestionModel?> fetchMultiQuestions(int examId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getMultiQuestions(examId);
    questionsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===================== GET DETAILS =====================
  Future<ExamMultiQuestionDetails?> fetchMultiQuestionDetails(
      int examId, int questionId) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.getMultiQuestionDetails(examId, questionId);
    questionDetails = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===================== POST =====================
  Future<ExamMultiQuestionPost?> addMultiQuestion(
      int examId, MCQuestionRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addMultiQuestion(examId, request);
    postResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===================== UPDATE =====================
  Future<ExamMultiQuestionUpdate?> updateMultiQuestion(
      int examId, int questionId, MCQuestionRequest request) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.updateMultiQuestion(examId, questionId, request);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===================== DELETE =====================
  Future<ExamMultiQuestionDelete?> deleteMultiQuestion(
      int examId, int questionId) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.deleteMultiQuestion(examId, questionId);
    deleteResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
