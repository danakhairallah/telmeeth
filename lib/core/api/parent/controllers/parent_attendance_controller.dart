import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/parent/model/response/parent_attendance_model.dart';
import 'package:telmeeth/core/api/parent/services/parent_attendance_service.dart';

class ParentAttendanceController extends ChangeNotifier {
  final ParentAttendanceService _service = ParentAttendanceService();
  ParentAttendance? parentAttendance;
  bool isLoading = false;

  Future<ParentAttendance?> getAttendanceById(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await _service.getParentAttendanceById(id);
      parentAttendance = result;
      return result;
    } catch (e) {
      print("ParentAttendanceController error: $e");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
