import 'package:flutter/material.dart';
import '../model/response/student_file_model.dart';
import '../services/student_file_service.dart';

class StudentFileController with ChangeNotifier {
  final StudentFileService _service = StudentFileService();

  bool isLoading = false;
  List<StudentFileModel>? studentFiles;
  String? errorMsg;

  Future<void> fetchStudentFiles() async {
    isLoading = true;
    errorMsg = null;
    notifyListeners();

    print("StudentFileController | Start fetchStudentFiles...");

    try {
      final result = await _service.getStudentFiles();
      print("StudentFileController | Fetched result: $result");
      if (result != null && result.isNotEmpty) {
        studentFiles = result;
        print("StudentFileController | studentFiles set, count: ${studentFiles?.length}");
      } else {
        studentFiles = [];
        errorMsg = "No student files found";
        print("StudentFileController | No student files found");
      }
    } catch (e) {
      errorMsg = "Failed to load student files";
      print("StudentFileController | Exception: $e");
    }
    isLoading = false;
    print("StudentFileController | isLoading=false, notifyListeners");
    notifyListeners();
  }
}
