import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/attendance_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_detailes.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_put.dart';
import 'package:telmeeth/core/api/teacher/services/attendance_teacher_service.dart';

class AttendanceTeacherController extends ChangeNotifier {
  final AttendanceTeacherService _service = AttendanceTeacherService();

  bool isLoading = false;

  AttendanceTeacherModel? attendanceList;
  AttendanceTeacherDetails? attendanceDetails;
  AttendanceTeacherPost? attendancePost;
  AttendanceTeacherPut? attendancePut;
  AttendanceTeacherDelete? attendanceDelete;

  // GET ALL
  Future<AttendanceTeacherModel?> fetchTeacherAttendances() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherAttendances();
    attendanceList = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // GET BY ID
  Future<AttendanceTeacherDetails?> fetchAttendanceById(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getAttendanceById(id);
    attendanceDetails = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // POST
  Future<AttendanceTeacherPost?> addAttendance(
      AttendanceTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addAttendance(request);
    attendancePost = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // PUT
  Future<AttendanceTeacherPut?> updateAttendance(
      int id, AttendanceTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateAttendance(id, request);
    attendancePut = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // DELETE
  Future<AttendanceTeacherDelete?> deleteAttendance(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteAttendance(id);
    attendanceDelete = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
