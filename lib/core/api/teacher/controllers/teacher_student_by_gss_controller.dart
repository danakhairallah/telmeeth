import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_student_by_gss_model.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_student_by_gss_service.dart';

class TeacherStudentByGssController extends ChangeNotifier {
  final TeacherStudentByGssService service;

  TeacherStudentByGssController(this.service);

  /// =========================
  /// state
  /// =========================
  bool isLoading = false;
  String? error;

  TeacherStudentByGssModel? studentsModel;

  /// =========================
  /// GET STUDENTS
  /// =========================
  Future<TeacherStudentByGssModel?> getTeacherStudents(
    int gradeId,
    int sectionId,
    int subjectId,
  ) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final model =
        await service.getTeacherListStudent(
      gradeId,
      sectionId,
      subjectId,
    );

    if (model != null) {
      studentsModel = model;
    } else {
      error = "Failed to load students";
    }

    isLoading = false;
    notifyListeners();

    return model; // ✅ يرجّع الموديل
  }
}