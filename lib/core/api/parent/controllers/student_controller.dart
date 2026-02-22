import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/student_model.dart';
import 'package:telmeeth/core/api/parent/services/student_service.dart';


class StudentController extends ChangeNotifier {
  final StudentService service;
  StudentController(this.service);

  bool isLoading = false;
  String? errorMessage;
  List<StudentModel> students = [];

  Future<void> loadMyStudents() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      students = await service.getMyStudents();
    } catch (e) {
      errorMessage = 'Error loading students';
      print("StudentController ERROR: $errorMessage");
      return null;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
