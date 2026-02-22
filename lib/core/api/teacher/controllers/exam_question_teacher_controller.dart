import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/exam_question_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/exam_question_update.dart';
import 'package:telmeeth/core/api/teacher/services/exam_question_teacher_service.dart';

class ExamQuestionTeacherController extends ChangeNotifier {
  final ExamQuestionTeacherService _service = ExamQuestionTeacherService();

  bool isLoading = false;

  ExamQuestionTeacherModel? questionsModel;
  ExamQuestionDetails? questionDetailsModel;
  ExamQuestionPost? postResult;
  ExamQuestionUpdate? updateResult;
  ExamQuestionDelete? deleteResult;

  /// GET كل أسئلة الـ Essay للامتحان
  Future<ExamQuestionTeacherModel?> fetchExamQuestions(int examId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getExamQuestions(examId);
    questionsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// GET تفاصيل سؤال محدد
  Future<ExamQuestionDetails?> fetchExamQuestionDetails(
      int examId, int questionId) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.getExamQuestionDetails(examId, questionId);
    questionDetailsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// POST إضافة سؤال Essay
  Future<ExamQuestionPost?> addExamQuestion(
      int examId, QuestionRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addExamQuestion(examId, request);
    postResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// PUT تعديل سؤال Essay
  Future<ExamQuestionUpdate?> updateExamQuestion(
      int examId, int questionId, QuestionRequest request) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.updateEssayQuestion(examId, questionId, request);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// DELETE سؤال Essay
  Future<ExamQuestionDelete?> deleteExamQuestion(
      int examId, int questionId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteEssayQuestion(examId, questionId);
    deleteResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
