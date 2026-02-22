import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/worksheet_parent_model.dart';
import 'package:telmeeth/core/api/parent/services/worksheet_parent_service.dart';

class WorksheetParentController extends ChangeNotifier {
  final WorksheetParentService _service = WorksheetParentService();

  bool isLoading = false;
  WorksheetParentModel? worksheetParentModel;

  Future<WorksheetParentModel?> fetchParentWorksheet(
    int studentId,
    int worksheetId,
  ) async {
    isLoading = true;
    notifyListeners();

    final result =
        await _service.getParentWorksheet(studentId, worksheetId);

    worksheetParentModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}