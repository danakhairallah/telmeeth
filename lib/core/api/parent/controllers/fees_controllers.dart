import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/fees_paid_model.dart';
import 'package:telmeeth/core/api/parent/model/response/remianing_fees_model.dart';
import 'package:telmeeth/core/api/parent/model/response/total_fees_model.dart';
import 'package:telmeeth/core/api/parent/services/fees_service.dart';

class FeesController extends ChangeNotifier {
  final FeesService _service = FeesService();

  bool isLoading = false;

  FeesPaidModel? feesPaidModel;
  TotalFeesModel? totalFeesModel;
  RemainingFeesModel? remainingFeesModel;

  Future<FeesPaidModel?> fetchFeesPaid(int studentId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getFeesPaidByStudentId(studentId);
    feesPaidModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<TotalFeesModel?> fetchTotalFees(int studentId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTotalFeesByStudentId(studentId);
    totalFeesModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<RemainingFeesModel?> fetchRemainingFees(int studentId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getRemainingFeesByStudentId(studentId);
    remainingFeesModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
