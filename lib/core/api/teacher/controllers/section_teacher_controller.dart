import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/section_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/services/section_teacher_service.dart';

class SectionTeacherController extends ChangeNotifier {
  final SectionTeacherService service;

  SectionTeacherController(this.service);

  /// =========================
  /// state
  /// =========================
  bool isLoading = false;
  String? error;

  SectionTeacherModel? sectionsModel;

  /// =========================
  /// GET SECTIONS
  /// =========================
  Future<SectionTeacherModel?> getSections(int gradeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final model = await service.getSections(gradeId);

    if (model != null) {
      sectionsModel = model;
    } else {
      error = "Failed to load sections";
    }

    isLoading = false;
    notifyListeners();

    return model; // ✅ يرجّع الموديل
  }
}