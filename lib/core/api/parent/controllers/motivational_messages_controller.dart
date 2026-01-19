import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/request/create_motivational_message_request.dart';
import 'package:telmeeth/core/api/parent/model/response/motivational_message_model.dart';
import 'package:telmeeth/core/api/parent/model/response/student_model.dart';
import 'package:telmeeth/core/api/parent/services/student_service.dart';
import '../services/motivational_messages_service.dart';

class MotivationalMessagesController extends ChangeNotifier {
  final MotivationalMessagesService service;
  final StudentService studentService;


  MotivationalMessagesController(this.service, this.studentService);

  // ======================
  // States
  // ======================
  bool isLoading = false;
  String? errorMessage;

  List<MotivationalMessageModel> messages = [];

  // ======================
  // Load Messages
  // ======================
  Future<void> loadMessages() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final msgs = await service.getMessages();
      final students = await studentService.getMyStudents();

      for (final msg in msgs) {
        final student = students.firstWhere(
              (s) => s.id == msg.studentId,
          orElse: () => StudentModel(id: 0, nameAr: 'Unknown', nameEn: 'Unknown'),
        );

        msg.studentName = student.nameAr;
      }

      messages = msgs;
    } catch (e) {
      errorMessage = 'Failed to load messages';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ======================
  // Create Message
  // ======================
  Future<void> createMessage({
    required int studentId,
    required String message,
    File? image,
  }) async {
    print("🚩 [MotivationalMessagesController] createMessage started");
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      print("⌛ Creating message for studentId: $studentId, message: $message");
      await service.create(
        CreateMotivationalMessageRequest(
          studentId: studentId,
          message: message,
          image: image,
        ),
      );
      print("✅ Message created successfully. Reloading messages...");
      await loadMessages();
    } catch (e) {
      errorMessage = 'Failed to create message';
      print("❌ Error creating message: $e");
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
      print("🏁 createMessage finished");
    }
  }

  // ======================
  // Update Message
  // ======================
  Future<void> updateMessage({
    required int id,
    required String message,
    File? image,
  }) async {
    print("🚩 [MotivationalMessagesController] updateMessage started for id: $id");
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      print("⌛ Updating message id: $id with new message: $message");
      await service.update(id, message, image);
      print("✅ Message updated. Reloading messages...");
      await loadMessages();
    } catch (e) {
      errorMessage = 'Failed to update message';
      print("❌ Error updating message: $e");
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
      print("🏁 updateMessage finished");
    }
  }

  // ======================
  // Delete Message
  // ======================
  Future<void> deleteMessage(int id) async {
    print("🚩 [MotivationalMessagesController] deleteMessage started for id: $id");
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      print("⌛ Deleting message with id: $id");
      await service.delete(id);
      messages.removeWhere((e) => e.id == id);
      print("✅ Message deleted.");
    } catch (e) {
      errorMessage = 'Failed to delete message';
      print("❌ Error deleting message: $e");
    } finally {
      isLoading = false;
      notifyListeners();
      print("🏁 deleteMessage finished");
    }
  }

  // ======================
  // Helper (OPTIONAL)
  // مؤقتاً لربط الاسم بالـ ID
  // ======================
  int? getStudentIdByName(String name) {
    // ❗ هذا مؤقت فقط
    final fakeStudents = [
      {'id': 1, 'name': 'Ahmed'},
      {'id': 2, 'name': 'Sara'},
      {'id': 3, 'name': 'Child'},
    ];

    final match = fakeStudents.firstWhere(
          (e) => e['name'] == name,
      orElse: () => {},
    );
    print("🔍 getStudentIdByName for name: $name => id: ${match['id']}");
    return match['id'] as int?;
  }
}
