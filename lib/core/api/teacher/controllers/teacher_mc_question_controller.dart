import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_mc_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_get_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_by_id.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_update.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_delete.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_mc_question_service.dart';

class TeacherMcQuestionController extends ChangeNotifier {
  final TeacherMcQuestionService _service = TeacherMcQuestionService();

  bool isLoading = false;

  TeacherMcQuestionGetModel? mcQuestions;
  TeacherMcQuestionGetByIdModel? mcQuestionById;
  TeacherMcQuestionPostModel? createResult;
  TeacherMcQuestionUpdateModel? updateResult;
  TeacherMcQuestionDeleteModel? deleteResult;

  /// ===== Get MC Questions By Task =====
  Future<TeacherMcQuestionGetModel?> getMcQuestions(int taskId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getMcQuestionTask(taskId);
    mcQuestions = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===== Get MC Question By ID =====
  Future<TeacherMcQuestionGetByIdModel?> getMcQuestionById(
      int taskId, int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getMcQuestionTaskById(taskId, id);
    mcQuestionById = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===== Create MC Question =====
  Future<TeacherMcQuestionPostModel?> createMcQuestion(
      TeacherMcQuestionRequestModel request, int taskId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.createMcQuestion(request, taskId);
    createResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===== Update MC Question =====
  Future<TeacherMcQuestionUpdateModel?> updateMcQuestion(
      TeacherMcQuestionRequestModel request, int taskId, int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateMcQuestion(request, taskId, id);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// ===== Delete MC Question =====
  Future<TeacherMcQuestionDeleteModel?> deleteMcQuestion(
      int taskId, int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteMcQuestionTask(taskId, id);
    deleteResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}