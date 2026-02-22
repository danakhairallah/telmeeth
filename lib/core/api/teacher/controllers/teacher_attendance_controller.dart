import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_attendance_request_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_attendance_get_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_attendance_post_model.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_attendance_service.dart';

class TeacherAttendanceController extends ChangeNotifier {
  final TeacherAttendanceService service;

  TeacherAttendanceController(this.service);

  /// =========================
  /// state
  /// =========================
  bool isLoading = false;
  bool isPosting = false;

  String? error;

  TeacherAttendanceGetModel? attendanceModel;
  TeacherAttendancePostModel? postModel;

  /// =========================
  /// GET
  /// =========================
  Future<TeacherAttendanceGetModel?> getTeacherAttendances() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final model = await service.getTeacherAttendances();

    if (model != null) {
      attendanceModel = model;
    } else {
      error = "Failed to load attendance";
    }

    isLoading = false;
    notifyListeners();

    return model; // ✅ يرجع الموديل
  }

  /// =========================
  /// POST
  /// =========================
  Future<TeacherAttendancePostModel?> addTeacherAttendance(
      TeacherAttendanceRequestModel request) async {
    isPosting = true;
    error = null;
    notifyListeners();

    final model = await service.addTeacherAttendance(request);

    if (model != null) {
      postModel = model;
    } else {
      error = "Failed to add attendance";
    }

    isPosting = false;
    notifyListeners();

    return model; // ✅ يرجع الموديل
  }
}