import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/model/response/attendance.dart';
import 'package:telmeeth/core/api/student/services/attendance_services.dart';

class AttendanceController extends ChangeNotifier {
  AttendanceServices _services = AttendanceServices();

  AttendanceModel? attendance;
  bool isLoading = false;

  Future<void> getAttendance() async {
    isLoading = true;
    notifyListeners();

    attendance = await _services.getAttendance();

    isLoading = false;
    notifyListeners();
  }
}


