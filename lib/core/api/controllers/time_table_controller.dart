import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/model/response/time_table_model.dart';
import 'package:telmeeth/core/api/student/services/time_table_services.dart';

class TimeTableController with ChangeNotifier{
  final TimeTableServices _services = TimeTableServices();

  TimeTableModel? tableModel;
  bool isLoading = false;

  // ================= GET =================
  Future<void> getTimeTable() async {
    isLoading = true;
    notifyListeners();

    try {
      tableModel = await _services.getTimeTable();
    } catch (e) {
      print("Get TimeTable Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}