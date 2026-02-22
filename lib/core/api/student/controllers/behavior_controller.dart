import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/behavior_model.dart';
import 'package:telmeeth/core/api/student/services/behavior_services.dart';

class BehaviorController with ChangeNotifier {
  final BehaviorServices _services = BehaviorServices();

  BehaviorResponse? response;
  bool isLoading = false;
  String? message;

  Future<void> loadBehaviors() async {
    try {
      isLoading = true;
      message = null;
      notifyListeners();

      final result = await _services.getStudentBehaviors();

      if (result != null) {
        response = result;
        if (response!.behaviors!.isEmpty) {
          message = "لا يوجد سجلات سلوكية";
        }
      } else {
        message = "فشل تحميل البيانات";
      }
    } catch (e) {
      message = "حدث خطأ أثناء التحميل";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  int get positiveCount =>
      response?.behaviors?.where((b) => (b.score ?? 0) > 0).length ?? 0;

  int get negativeCount =>
      response?.behaviors?.where((b) => (b.score ?? 0) < 0).length ?? 0;
}
