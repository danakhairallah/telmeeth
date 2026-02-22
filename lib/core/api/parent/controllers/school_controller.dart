import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/school_model.dart';
import 'package:telmeeth/core/api/parent/services/school_services.dart';

class SchoolController extends ChangeNotifier {
  final SchoolServices _service = SchoolServices();

  bool isLoading = false;
  String? errorMessage;

  SchoolModel? schoolModel;

  // ================= GET SCHOOLS =================
  Future<SchoolModel?> getSchools() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      schoolModel = await _service.getSchools();
      return schoolModel;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
