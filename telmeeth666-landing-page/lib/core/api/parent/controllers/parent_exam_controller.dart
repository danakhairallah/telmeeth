import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/parent_exam_model.dart';
import 'package:telmeeth/core/api/parent/services/parent_exam_service.dart';

class ParentExamController extends ChangeNotifier {
  final ParentExamService _service = ParentExamService();

  ParentExamModel? parentExamModel;
  bool isLoading = false;

  Future<ParentExamModel?> getParentExams(int studentId) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await _service.getParentExams(studentId);

      parentExamModel = result;

      return result;
    } catch (e) {
      print("ParentExamController error: $e");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
