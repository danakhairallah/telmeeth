import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_class_deatils_by_grade_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_class_model_by_grade.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_class_by_grade_service.dart';

class ClassByGradeController extends ChangeNotifier {
  final TeacherClassByGradeService _service =
  TeacherClassByGradeService();

  bool isLoading = false;
  String? error;

  TeacherClassesByGradeModel? classes;
  TeacherClassDeatilsByGradeModel? classDetailsModel; // ✅ أضفناها هنا

  int? currentGradeId;
  int? currentSubjectId;

  // ===============================
  // Get Classes By Grade
  // ===============================
  Future<TeacherClassesByGradeModel?> getClasses(
      int gradeId,
      int subjectId,
      ) async {
    try {
      isLoading = true;
      error = null;

      currentGradeId = gradeId;
      currentSubjectId = subjectId;

      notifyListeners();

      final result =
      await _service.getTeacherClassesByGrade(
        gradeId,
        subjectId,
      );

      classes = result;

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
  // Get Class Details By Grade
  // ===============================
  Future<TeacherClassDeatilsByGradeModel?> getTeacherClassDetailsByGrade(
      int gradeId,
      int sectionId,
      int subjectId,
      ) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final model = await _service.getTeacherClassDeatilsByGrade(
        gradeId,
        sectionId,
        subjectId,
      );

      if (model != null) {
        classDetailsModel = model;
      } else {
        error = "Failed to load class details";
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
    classes = null;
    classDetailsModel = null; // ✅ مهم نفضيها
    currentGradeId = null;
    currentSubjectId = null;
    error = null;
    notifyListeners();
  }
}
