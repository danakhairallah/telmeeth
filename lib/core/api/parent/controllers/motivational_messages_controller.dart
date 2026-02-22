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

  bool isLoading = false;
  String? errorMessage;

  List<MotivationalMessageModel> messages = [];
  List<MotivationalMessageModel> messagesForChild = [];

  // ======================
  // Load All Messages
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
  // Load Messages For One Child
  // ======================
  Future<void> loadMessagesByStudent(int studentId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      await loadMessages(); // تجيب الكل للأب

      messagesForChild =
          messages.where((m) => m.studentId == studentId).toList();
    } catch (e) {
      errorMessage = 'Failed to load messages';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ======================
  // Create Message (to this child)
  // ======================
  Future<void> createMessage({
    required int studentId,
    required String message,
    File? image,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await service.create(
        CreateMotivationalMessageRequest(
          studentId: studentId,
          message: message,
          image: image,
        ),
      );

      // ✅ بعد الانشاء: اعادة تحميل رسائل نفس الطفل
      await loadMessagesByStudent(studentId);
    } catch (e) {
      errorMessage = 'Failed to create message';
    } finally {
      isLoading = false;
      notifyListeners();
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
    isLoading = true;
    notifyListeners();

    try {
      await service.update(id, message, image);
      await loadMessagesByStudent(
        messages.firstWhere((m) => m.id == id).studentId,
      );
    } catch (e) {
      errorMessage = 'Failed to update message';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  // ======================
  // Delete Message
  // ======================
  Future<void> deleteMessage({
    required int id,
    required int studentId,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await service.delete(id);

      // احذف من القائمة العامة
      messages.removeWhere((e) => e.id == id);

      // احذف من قائمة الطفل الحالية
      messagesForChild.removeWhere((e) => e.id == id);

    } catch (e) {
      errorMessage = 'Failed to delete message';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}
