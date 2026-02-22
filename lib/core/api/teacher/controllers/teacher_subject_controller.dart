import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/list_subject_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_subject_model.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_subject_service.dart';

class SubjectController extends ChangeNotifier {
  final TeacherSubjectService _service = TeacherSubjectService();

  bool isLoading = false;
  String? error;

  TeacherSubjectModel? subjects;
  ListSubjectTeacherModel? listSubjectsModel; // ✅ أضفناه هنا

  int? currentGradeId;

  // ===============================
  // Get Subjects By Grade
  // ===============================
  Future<TeacherSubjectModel?> getTeacherSubjects(int gradeId) async {
    try {
      isLoading = true;
      error = null;
      currentGradeId = gradeId;
      notifyListeners();

      final result = await _service.getTeacherSubject(gradeId);

      subjects = result;

      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ===============================
  // Get List Subjects (Grade + Section)
  // ===============================
  Future<ListSubjectTeacherModel?> getTeacherListSubjects(
      int gradeId,
      int sectionId,
      ) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final model =
      await _service.getTeacherListSubject(gradeId, sectionId);

      if (model != null) {
        listSubjectsModel = model; // ✅ صححنا الاسم
      } else {
        error = "Failed to load subjects";
      }

      return model;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ===============================
  // Clear
  // ===============================
  void clear() {
    subjects = null;
    listSubjectsModel = null; // ✅ مهم نفرغها
    currentGradeId = null;
    error = null;
    notifyListeners();
  }
}
