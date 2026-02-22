import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/student_discounts_model.dart';
import 'package:telmeeth/core/api/parent/services/discounts_services.dart';

class DiscountsController with ChangeNotifier {
  final DiscountsServices _services = DiscountsServices();

  ParentStudentDiscountsResponse? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadDiscounts() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.getStudentDiscounts();

      if (result == null) {
        errorMessage = "Failed to load discounts";
        response = null;
      } else {
        response = result;
      }

    } catch (e) {
      errorMessage = "حدث خطأ أثناء التحميل";
      response = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
