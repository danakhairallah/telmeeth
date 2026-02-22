import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/attendance_parent_model.dart';
import 'package:telmeeth/core/api/parent/services/attendance_parent_service.dart';

class AttendanceParentController extends ChangeNotifier {
  final AttendanceParentService _service = AttendanceParentService();

  bool isLoading = false;
  AttendanceParentModel? attendanceModel;

  /// GET attendance by id
  Future<AttendanceParentModel?> fetchParentAttendance(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getParentAttendance(id);
    attendanceModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
