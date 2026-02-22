import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_essay_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_essay_post_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_essay_question_get_by_id.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_essay_question_get_model.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_essay_question_service.dart';

class TeacherEssayQuestionController extends ChangeNotifier {
  final TeacherEssayQuestionService _service =
      TeacherEssayQuestionService();

  bool isLoading = false;

  TeacherEssayQuestionGetModel? essayQuestions;
  TeacherEssayQuestionGetByIdModel? essayQuestionById;
  TeacherEssayQuestionPostModel? createdEssayQuestion;

  /// ===== Get all essay questions by task =====
  Future<TeacherEssayQuestionGetModel?> fetchEssayQuestions(int taskId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getEssayQuestionTask(taskId);
    essayQuestions = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===== Get essay question by id =====
  Future<TeacherEssayQuestionGetByIdModel?> fetchEssayQuestionById(
    int taskId,
    int id,
  ) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.getEssayQuestionTaskById(taskId, id);
    essayQuestionById = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===== Create essay question =====
  Future<TeacherEssayQuestionPostModel?> createEssayQuestion(
    TeacherEssayQuestionRequestModel request,
    int taskId,
  ) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.createEssayQuestion(request, taskId);
    createdEssayQuestion = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}