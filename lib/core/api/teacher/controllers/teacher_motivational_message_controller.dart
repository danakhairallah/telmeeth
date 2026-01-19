import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_motivational_message.dart';
import 'package:telmeeth/core/api/teacher/service/teacher_motivational_message_service.dart';

class MotivationMessageControllerTeacher with ChangeNotifier {
  final MotivationMessageServiceTeacher service;
  MotivationMessageControllerTeacher(this.service);

  List<MotivationMessageTeacher> messages = [];
  bool isLoading = false;

  Future<void> fetchAll() async {
    isLoading = true;
    notifyListeners();
    messages = await service.getAllMessages();
    isLoading = false;
    notifyListeners();
  }

  Future<void> add({
    required int studentId,
    required int classTeacherId,
    required String message,
    File? image,
  }) async {
    isLoading = true;
    notifyListeners();
    final msg = await service.addMessage(
      studentId: studentId,
      classTeacherId: classTeacherId,
      message: message,
      image: image,
    );
    if (msg != null) {
      messages.insert(0, msg);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> update({
    required int id,
    required String message,
    File? image,
  }) async {
    isLoading = true;
    notifyListeners();
    final updated = await service.updateMessage(id: id, message: message, image: image);
    if (updated != null) {
      final idx = messages.indexWhere((e) => e.id == id);
      if (idx != -1) {
        messages[idx] = updated;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> delete(int id) async {
    isLoading = true;
    notifyListeners();
    final success = await service.deleteMessage(id);
    if (success) {
      messages.removeWhere((e) => e.id == id);
    }
    isLoading = false;
    notifyListeners();
  }
}
