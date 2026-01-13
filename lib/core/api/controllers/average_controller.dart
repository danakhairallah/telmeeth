import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/model/response/average_detail.dart';
import 'package:telmeeth/core/api/model/response/average_model.dart';
import 'package:telmeeth/core/api/student/services/average_services.dart';

class AverageController extends ChangeNotifier {
  final AverageServices _services = AverageServices();

  /// الحالة
  bool isLoading = false;

  /// الداتا
  AveragModel? averagModel;
  AverageDetile? averageDetile;
   String? errorMessage;

  Future<void> getAverage() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.getAverage();

      if (result != null) {
        averagModel = result;
      } else {
        errorMessage = "Failed to load Average";
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Get Marks By Subject ID
  // =========================
  Future<void> getAverageById(int id) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.getAverageById(id);

      if (result != null) {
        averageDetile = result;
      } else {
        errorMessage = "Failed to load Average details";
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Clear Details (اختياري)
  // =========================
  void clearDetails() {
    averageDetile = null;
    notifyListeners();
  }

}