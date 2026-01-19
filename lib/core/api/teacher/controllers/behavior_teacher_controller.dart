import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/behavior_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/behavior_teacher_service.dart';

class BehaviorTeacherController extends ChangeNotifier {
  final BehaviorTeacherService _service = BehaviorTeacherService();

  bool isLoading = false;

  // Get All
  List<BehaviorTeacherModel>? behaviorsList;

  // Get By Id
  BehaviorTeacherModel? behaviorDetails;

  // Post
  BehaviorTeacherPost? addResult;

  // Update
  BehaviorTeacherUpdate? updateResult;

  // Delete
  BehaviorTeacherDelete? deleteResult;

  // ================= Get All =================
  Future<List<BehaviorTeacherModel>?> fetchTeacherBehaviors() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherBehaviors();
    behaviorsList = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // ================= Get By Id =================
  Future<BehaviorTeacherModel?> fetchBehaviorById(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getBehaviorById(id);
    behaviorDetails = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // ================= Add =================
  Future<BehaviorTeacherPost?> addBehavior(
      BehaviorTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addBehavior(request);
    addResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // ================= Update =================
  Future<BehaviorTeacherUpdate?> updateBehavior(
      int id,
      BehaviorTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateBehavior(id, request);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // ================= Delete =================
  Future<BehaviorTeacherDelete?> deleteBehavior(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteBehavior(id);
    deleteResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
