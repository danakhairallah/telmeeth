import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/semester_days_model.dart';
import 'package:telmeeth/core/api/parent/services/semester_days_service.dart';

class SemesterDaysController extends ChangeNotifier {
  final SemesterDaysService _service;

  SemesterDaysController(this._service);

  bool isLoading = false;
  String? error;

  SemesterDaysModel? semesterDaysModel;

  Future<void> fetchSemesterDays(int studentId) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getSemsterDays(studentId);
      if (result != null) {
        semesterDaysModel = result;
      } else {
        error = "Failed to load semester days";
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}