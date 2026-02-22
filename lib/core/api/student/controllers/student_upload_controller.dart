
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/student_uplode_subject_model.dart';
import '../model/response/student_upload_model.dart';
import '../services/student_upload_service.dart';

class StudentUploadController with ChangeNotifier {
  final StudentUploadService _service = StudentUploadService();

  bool isLoading = false;
  List<StudentUploadModel>? uploads;
  String? errorMsg;

  StudentUplodeSubjectModel? _studentUplodeSubjectModel;        // ✅ تعريف المتغير
  StudentUplodeSubjectModel? get studentUplodeSubjectModel => _studentUplodeSubjectModel; // ✅ getter

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
    } finally {
      isLoading = false;
      notifyListeners();
    }
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
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<StudentUplodeSubjectModel?> fetchStudentUploads(int subjectId) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await _service.getUnitById(subjectId);
      _studentUplodeSubjectModel = result;  // ✅ هيك صح
      return result;
    } catch (e) {
      errorMsg = "Failed to load student uploads by subject.";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}