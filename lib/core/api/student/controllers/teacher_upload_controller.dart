import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/std_teacher_uplode_subject_model.dart';
import 'package:telmeeth/core/api/student/model/response/teacher_upload_model.dart';
import 'package:telmeeth/core/api/student/services/teacher_upload_service.dart';

class TeacherUploadController with ChangeNotifier {
  final TeacherUploadService _service = TeacherUploadService();

  bool isLoading = false;
  List<TeacherUploadModel> uploads = [];
  String? errorMsg;

  StdTeacherUplodeSubjectModel? _teacherUplodeSubjectModel; // ✅ تعريف المتغير
  StdTeacherUplodeSubjectModel? get teacherUplodeSubjectModel => _teacherUplodeSubjectModel; // ✅ getter

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
    } finally {
      isLoading = false;
      notifyListeners();
    }
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
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<StdTeacherUplodeSubjectModel?> fetchTeacherUploads(int subjectId) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await _service.getTeacherUplodeById(subjectId);
      _teacherUplodeSubjectModel = result; // ✅ هيك صح
      return result;
    } catch (e) {
      errorMsg = "Failed to fetch teacher uploads by subject";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}