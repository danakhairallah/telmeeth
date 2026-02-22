import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/branch_gates_model.dart';
import 'package:telmeeth/core/api/parent/model/response/branches_model.dart';
import 'package:telmeeth/core/api/parent/services/branches_service.dart';

class BranchesController extends ChangeNotifier {
  final BranchesService _service = BranchesService();

  BranchesModel? branchesModel;
  bool isLoading = false;
  String? error;
  BranchGatesModel? branchGates;



  Future<BranchesModel?> getBranchesBySchoolId(int schoolId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getBranchesBySchoolId(schoolId);

    branchesModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<BranchesModel?> getStudentSchoolBranches(int studentId) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getStudentSchoolBranches(studentId);

    branchesModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<void> fetchBranchGates() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getBranchGates();

      if (result != null) {
        branchGates = result;
      } else {
        error = "Failed to load branch gates";
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

}
