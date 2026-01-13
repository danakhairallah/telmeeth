import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/response/unite_model.dart';
import 'package:telmeeth/core/api/student/services/unit_services.dart';


class UnitController with ChangeNotifier {
  final UnitServices _unitServices = UnitServices();

  UnitsModel? unit;
  bool isLoading = false;
  String? message; // رسالة الخطأ أو المعلومات

  /// جلب الوحدة بناءً على Class ID
  Future<void> getUnitById(int classId) async {
    try {
      isLoading = true;
      message = null;
      notifyListeners();

      final result = await _unitServices.getUnitById(classId);

      if (result != null) {
        unit = result;

        if (unit!.units == null || unit!.units!.isEmpty) {
          message = "لا توجد وحدات لهذه الشعبة";
        } else {
          message = null;
        }
      } else {
        unit = null;
        message = "لا توجد وحدات لهذه الشعبة";
      }
    } catch (e) {
      unit = null;
      message = "حدث خطأ أثناء تحميل الوحدات";
      print("Error in getUnitById: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

