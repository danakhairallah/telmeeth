import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/teacher_upload_model.dart';
import 'package:telmeeth/core/api/student/services/teacher_upload_service.dart';

class TeacherUploadController with ChangeNotifier {
  final TeacherUploadService _service = TeacherUploadService();

  bool isLoading = false;
  List<TeacherUploadModel> uploads = [];
  String? errorMsg;

  Future<void> fetchUploadsByUnit(int unitId) async {
    isLoading = true;
    errorMsg = null;
    notifyListeners();
    try {
      final result = await _service.getUploadsByUnit(unitId);
      if (result != null) {
        uploads = result;
      } else {
        uploads = [];
        errorMsg = "No uploads found";
      }
    } catch (e) {
      uploads = [];
      errorMsg = "Failed to fetch uploads";
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchUploadsByLesson(int lessonId) async {
    isLoading = true;
    errorMsg = null;
    notifyListeners();
    try {
      final result = await _service.getUploadsByLesson(lessonId);
      if (result != null) {
        uploads = result;
      } else {
        uploads = [];
        errorMsg = "No uploads found";
      }
    } catch (e) {
      uploads = [];
      errorMsg = "Failed to fetch uploads";
    }
    isLoading = false;
    notifyListeners();
  }
}
