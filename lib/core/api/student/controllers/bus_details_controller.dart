import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/bus_details_model.dart';
import 'package:telmeeth/core/api/student/services/bus_details_service.dart';

class BusDetailsController extends ChangeNotifier {
  final BusDetailsService _service = BusDetailsService();

  bool isLoading = false;
  BusDetailsModel? busDetails;
  String? errorMessage;

  Future<BusDetailsModel?> getBusDetails() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _service.getBusDetails();

      if (result != null) {
        busDetails = result;
        return result;
      } else {
        errorMessage = "Failed to load bus details";
        return null;
      }
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  void clear() {
    busDetails = null;
    errorMessage = null;
    notifyListeners();
  }
}
