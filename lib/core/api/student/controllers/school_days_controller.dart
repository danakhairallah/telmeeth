import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/school_days_model.dart';
import 'package:telmeeth/core/api/student/services/school_days_service.dart';

class SchoolDaysController extends ChangeNotifier {
  final SchoolDaysService _service = SchoolDaysService();

  bool isLoading = false;
  SchoolDaysModel? schoolDays;
  String? errorMessage;

  Future<SchoolDaysModel?> getSchoolDays() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _service.getSchoolDays();

      if (result != null) {
        schoolDays = result;
        return result;
      } else {
        errorMessage = "Failed to load school days";
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
}
