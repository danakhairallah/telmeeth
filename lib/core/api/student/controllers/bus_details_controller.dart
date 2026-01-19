import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/bus_details_model.dart';
import '../services/bus_details_service.dart' show BusDetailsService;

class BusDetailsController with ChangeNotifier {
  final BusDetailsService _service = BusDetailsService();

  BusDetailsResponse? response;
  bool isLoading = false;
  String? error;

  Future<void> loadBusDetails() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getBusDetails();
      if (result != null && result.data.isNotEmpty) {
        response = result;
      } else {
        error = "لا يوجد بيانات للباص";
      }
    } catch (e) {
      error = "حدث خطأ أثناء التحميل";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
