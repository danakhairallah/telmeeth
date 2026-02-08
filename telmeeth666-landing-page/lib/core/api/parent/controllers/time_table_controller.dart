import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/time_table_model_parent.dart';
import 'package:telmeeth/core/api/parent/services/time_table_service.dart';
import 'package:telmeeth/core/api/student/model/response/time_table_model.dart';

class TimeTableControllerParent extends ChangeNotifier {
  final TimeTableService _service = TimeTableService();

  bool isLoading = false;
  String? errorMessage;

  TimeTableModelParent? tableModelParent;

  // ================= GET TIME TABLE =================
  Future<TimeTableModelParent?> getTimeTable(int studentId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      tableModelParent = await _service.getTimeTableParentById(studentId);
      return tableModelParent;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
