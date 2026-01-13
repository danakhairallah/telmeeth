import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/request/schrdual_request.dart';
import 'package:telmeeth/core/api/model/response/schedual_model.dart';
import 'package:telmeeth/core/api/model/response/schedual_response.dart';
import 'package:telmeeth/core/api/student/services/schedual_services.dart';

class SchedualController with ChangeNotifier {
  final SchedualServices _services = SchedualServices();

  SchedulesResponse? schedulesResponse;
  bool isLoading = false;

  // ================= GET ALL =================
  Future<void> getScheduals() async {
    isLoading = true;
    notifyListeners();

    try {
      schedulesResponse = await _services.getScheduals();
    } catch (e) {
      print("Get Scheduals Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= ADD =================
  Future<void> addSchedual(SchedualRequest request,) async {
    try {
      final ScheduleModel? newSchedule =
          await _services.addSchedual(request);

      if (newSchedule != null) {
        schedulesResponse ??=
            SchedulesResponse(success: true, data: []);
        schedulesResponse!.data.insert(0, newSchedule); // الجديد فوق
        notifyListeners();
      }
    } catch (e) {
      print("Add Schedual Error: $e");
    }
  }

  // ================= GET BY ID =================
  Future<ScheduleModel?> getSchedualById(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      final ScheduleModel? schedule =
          await _services.getSchedualById(id);
      return schedule;
    } catch (e) {
      print("Get Schedual by ID Error: $e");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= UPDATE =================
  Future<void> updateSchedual({
    required int id,
    required SchedualRequest request,
  }) async {
    try {
      final ScheduleModel? updated =
          await _services.updateSchedual(id, request);

      if (updated != null && schedulesResponse != null) {
        final index = schedulesResponse!.data
            .indexWhere((s) => s.id == id);

        if (index != -1) {
          schedulesResponse!.data[index] = updated;
          notifyListeners();
        }
      }
    } catch (e) {
      print("Update Schedual Error: $e");
    }
  }

  // ================= DELETE =================
  Future<void> deleteSchedual({required int id}) async {
    try {
      final success = await _services.deleteSchedual(id);

      if (success) {
        schedulesResponse?.data
            .removeWhere((s) => s.id == id);
        notifyListeners();
      }
    } catch (e) {
      print("Delete Schedual Error: $e");
    }
  }
}
