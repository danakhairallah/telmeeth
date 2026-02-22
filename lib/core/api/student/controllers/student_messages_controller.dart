import 'package:flutter/material.dart';
import '../services/student_messages_service.dart';
import '../model/response/student_messages_response.dart';

class StudentMessagesController extends ChangeNotifier {
  final StudentMessagesService service = StudentMessagesService();

  bool isLoading = false;
  StudentMessagesResponse? parentMessages;
  StudentMessagesResponse? teacherMessages;

  Future<void> loadParentMessages() async {
    isLoading = true;
    notifyListeners();

    parentMessages = await service.getParentMessages();
    print("PARENT MSGS ==> ${parentMessages?.messages}");

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadTeacherMessages() async {
    isLoading = true;
    notifyListeners();

    try {
      teacherMessages = await service.getTeacherMessages();
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}
