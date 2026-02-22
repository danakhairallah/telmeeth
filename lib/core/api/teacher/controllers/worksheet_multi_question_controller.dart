import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_multi_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_update.dart';
import 'package:telmeeth/core/api/teacher/services/worksheet_multi_question_service.dart';

class WorksheetMultiQuestionController extends ChangeNotifier {
  final WorksheetMultiQuestionService _service = WorksheetMultiQuestionService();

  bool isLoading = false;

  WorksheetMultiQuestionModel? multiQuestionsModel;
  WorksheetMultiQuestionPost? postModel;
  WorksheetMultiQuestionUpdate? updateModel;
  WorksheetMultiQuestionDelete? deleteModel;

  /// GET
  Future<WorksheetMultiQuestionModel?> fetchMultiQuestions(int worksheetId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getMultiQuestions(worksheetId);
    multiQuestionsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// POST (Add)
  Future<WorksheetMultiQuestionPost?> addMultiQuestion(
    int worksheetId,
    WorksheetMultiQuestionRequest request,
  ) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addMultiQuestion(worksheetId, request);
    postModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// UPDATE
  Future<WorksheetMultiQuestionUpdate?> updateMultiQuestion(
    int worksheetId,
    int questionId,
    WorksheetMultiQuestionRequest request,
  ) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateMultiQuestion(worksheetId, questionId, request);
    updateModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// DELETE
  Future<WorksheetMultiQuestionDelete?> deleteMultiQuestion(
    int worksheetId,
    int questionId,
  ) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteMultiQuestion(worksheetId, questionId);
    deleteModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
