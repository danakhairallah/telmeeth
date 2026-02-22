import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/question_bank_model.dart';
import 'package:telmeeth/core/api/student/services/question_bank_service.dart';

class QuestionBankController extends ChangeNotifier {
  final QuestionBankService _service = QuestionBankService();

  bool isLoading = false;
  QuestionBankModel? questionBank;
  String? errorMessage;

  Future<QuestionBankModel?> getQuestionBankById(int lessonId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _service.getQuestionBankById(lessonId);

      if (result != null) {
        questionBank = result;
        return result;
      } else {
        errorMessage = "Failed to load question bank";
        return null;
      }
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    questionBank = null;
    errorMessage = null;
    notifyListeners();
  }
}
