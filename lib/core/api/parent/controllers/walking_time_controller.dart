import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/walking_time_model.dart';
import 'package:telmeeth/core/api/parent/services/walking_time_service.dart';

class WalkingTimeController extends ChangeNotifier {
  final WalkingTimeService _service = WalkingTimeService();

  bool isLoading = false;
  WalkingTimeModel? walkingTimeModel;

  Future<WalkingTimeModel?> fetchWalkingTime(int studentId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getWalkingTimeByStudentId(studentId);
    walkingTimeModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
