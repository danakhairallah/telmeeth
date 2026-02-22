import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/list_grades_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_grades_model.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_grades_service.dart';

class TeacherGradesController extends ChangeNotifier {
  final TeacherGradesService _service = TeacherGradesService();

  bool isLoading = false;
  String? error;

  TeacherGradesModel? grades;
  ListGradesTeacherModel? listGradesModel; // ✅ أضفناه هنا

  // ===============================
  // Get Teacher Grades (Model 1)
  // ===============================
  Future<TeacherGradesModel?> getTeacherGrades() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getTeacherGrades();

      grades = result;

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
  // Get List Teacher Grades (Model 2)
  // ===============================
  Future<ListGradesTeacherModel?> getListTeacherGrades() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final model = await _service.getListTeacherGrades();

      if (model != null) {
        listGradesModel = model; // ✅ صححنا الاسم
      } else {
        error = "Failed to load grades";
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
    grades = null;
    listGradesModel = null; // ✅ مهم نفرغها
    error = null;
    notifyListeners();
  }
}
