import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/report_model.dart';
import 'package:telmeeth/core/api/student/services/report_service.dart';

class ReportController extends ChangeNotifier {
  final ReportService _service = ReportService();

  bool isLoading = false;
  List<ReportModel> teacherReports = [];

  Future<void> loadReports() async {
    isLoading = true;
    notifyListeners();

    teacherReports = await _service.getTeacherReports();

    isLoading = false;
    notifyListeners();
  }
}
