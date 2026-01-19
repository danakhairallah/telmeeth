import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/request/study_plan_request.dart';
import 'package:telmeeth/core/api/student/model/response/study_plan_model.dart';
import 'package:telmeeth/core/api/student/model/response/study_plan_response.dart';
import 'package:telmeeth/core/api/student/services/study_plan_service.dart';

class StudyPlanController with ChangeNotifier {
  final StudyPlanService _service = StudyPlanService();

  bool isLoading = false;
  List<StudyPlanModel> plans = [];
  StudyPlanResponse? response;

  // CREATE
  Future<void> createPlan(StudyPlanRequest request) async {
    isLoading = true;
    notifyListeners();
    try {
      print("SENDING REQUEST: ${request.toJson()}");
      response = await _service.createStudyPlan(request);
      print("RESPONSE: $response");
      await getStudyPlans();
    } catch(e) {
      print("CREATE ERROR: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // GET ALL (المفقودة عندك!)
  Future<void> getStudyPlans() async {
    isLoading = true;
    notifyListeners();
    try {
      plans = await _service.getStudyPlans();
      print("PLANS RESPONSE: $plans"); // اطبع القائمة في الكونسول
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // DELETE
  Future<bool> deleteStudyPlan(int id) async {
    isLoading = true;
    notifyListeners();
    try {
      final success = await _service.deleteStudyPlan(id);
      if (success) {
        await getStudyPlans();
      }
      return success;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    response = null;
    notifyListeners();
  }
}
