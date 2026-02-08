import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/branches_model.dart';
import 'package:telmeeth/core/api/parent/services/branches_service.dart';

class BranchesController extends ChangeNotifier {
  final BranchesService _service = BranchesService();

  BranchesModel? branchesModel;
  bool isLoading = false;

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
}
