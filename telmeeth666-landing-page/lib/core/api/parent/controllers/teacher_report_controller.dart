import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/teacher_report_model.dart';
import 'package:telmeeth/core/api/parent/services/teacher_report_service.dart';

class TeacherReportController extends ChangeNotifier {
  final TeacherReportService _service = TeacherReportService();

  bool isLoading = false;
  String? errorMessage;

  TeacherReportModel? reportModel;

  Future<TeacherReportModel?> getReports(int studentId) async {
    try {
      isLoading = true;
      notifyListeners();

      reportModel = await _service.getTeacherReports(studentId);
      return reportModel;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
