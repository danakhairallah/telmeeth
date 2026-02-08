
import 'package:flutter/material.dart';
import '../model/response/student_upload_model.dart';
import '../services/student_upload_service.dart';

class StudentUploadController with ChangeNotifier {
  final StudentUploadService _service = StudentUploadService();

  bool isLoading = false;
  List<StudentUploadModel>? uploads;
  String? errorMsg;

  // Fetch by unit
  Future<void> fetchUploadsByUnit(String unitId) async {
    isLoading = true;
    errorMsg = null;
    uploads = null;
    notifyListeners();

    try {
      final result = await _service.getUploadsByUnit(unitId);
      if (result != null && result.isNotEmpty) {
        uploads = result;
      } else {
        uploads = [];
        errorMsg = "No uploads found for this unit.";
      }
    } catch (e) {
      errorMsg = "Failed to load uploads.";
    }
    isLoading = false;
    notifyListeners();
  }

  // Fetch by lesson
  Future<void> fetchUploadsByLesson(String lessonId) async {
    isLoading = true;
    errorMsg = null;
    uploads = null;
    notifyListeners();

    try {
      final result = await _service.getUploadsByLesson(lessonId);
      if (result != null && result.isNotEmpty) {
        uploads = result;
      } else {
        uploads = [];
        errorMsg = "No uploads found for this lesson.";
      }
    } catch (e) {
      errorMsg = "Failed to load uploads.";
    }
    isLoading = false;
    notifyListeners();
  }
}
