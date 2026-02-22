import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_essay_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_question_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_update.dart';
import 'package:telmeeth/core/api/teacher/services/worksheet_essay_question_service.dart';

class WorksheetEssayQuestionController extends ChangeNotifier {
  final WorksheetEssayQuestionService _service =
      WorksheetEssayQuestionService();

  bool isLoading = false;

  WorksheetEssayQuestionModel? essayQuestionsModel;
  WorksheetEssayQuestionPost? postModel;
  WorksheetEssayQuestionUpdate? updateModel;
  WorksheetEssayQuestionDelete? deleteModel;

  /// GET
  Future<WorksheetEssayQuestionModel?> fetchEssayQuestions(int worksheetId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getEssayQuestions(worksheetId);
    essayQuestionsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// POST (Add)
  Future<WorksheetEssayQuestionPost?> addEssayQuestion(
    int worksheetId,
    WorksheetEssayQuestionRequest request,
  ) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addEssayQuestion(worksheetId, request);
    postModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// UPDATE
  Future<WorksheetEssayQuestionUpdate?> updateEssayQuestion(
    int worksheetId,
    int questionId,
    WorksheetEssayQuestionRequest request,
  ) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.updateEssayQuestion(worksheetId, questionId, request);
    updateModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// DELETE
  Future<WorksheetEssayQuestionDelete?> deleteEssayQuestion(
    int worksheetId,
    int questionId,
  ) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.deleteEssayQuestion(worksheetId, questionId);
    deleteModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
