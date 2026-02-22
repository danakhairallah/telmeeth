import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/unites_by_classes_model.dart';
import 'package:telmeeth/core/api/teacher/services/units_by_classes_service.dart';

class UnitsByClassesController extends ChangeNotifier {
  final UnitsByClassesService _service = UnitsByClassesService();

  bool isLoading = false;
  String? error;

  UnitsByClassesModel? units;

  int? currentClassId;

  Future<UnitsByClassesModel?> getUnits(int classId) async {
    try {
      isLoading = true;
      error = null;
      currentClassId = classId;

      notifyListeners();

      final result = await _service.getUnitsByClasses(classId);

      units = result;

      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    if (currentClassId != null) {
      await getUnits(currentClassId!);
    }
  }

  void clear() {
    units = null;
    currentClassId = null;
    error = null;
    notifyListeners();
  }
}