import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/response/subject_model.dart';
import 'package:telmeeth/core/api/model/response/unite_model.dart';
import 'package:telmeeth/core/api/student/services/subject_services.dart';

class SubjectController with ChangeNotifier{
  final SubjectServices _services = SubjectServices();

  SubjectModel? subjectModel;
  bool isLoading = false;

  // ================= GET =================
  Future<void> getSubjects() async {
    isLoading = true;
    notifyListeners();

    try {
      subjectModel = await _services.getSubjects();
    } catch (e) {
      print("Get Subjects Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<UnitsModel?> getUnitById(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      final UnitsModel? unitsModel = await _services.getUnitById(id);
      return unitsModel;
    } catch (e) {
      print("Get Unit by ID Error: $e");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}