import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/service/chatbot_service_teacher.dart';
import 'package:telmeeth/core/api/teacher/model/request/chatbot_request_teacher.dart';
import 'package:telmeeth/core/api/teacher/model/response/chatbot_response_teacher.dart';

class TeacherChatbotController extends ChangeNotifier {
  ChatbotServiceTeacher? _service;

  List<ChatbotResponseTeacher> todayChats = [];
  bool isLoading = false;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    final dio = await ApiClient.getDio();
    _service = ChatbotServiceTeacher(dio);

    _initialized = true;
  }

  Future<void> fetchToday() async {
    await init();

    isLoading = true;
    notifyListeners();

    todayChats = await _service!.fetchTodayChats();

    isLoading = false;
    notifyListeners();
  }

  Future<String?> send(String message) async {
    await init();

    isLoading = true;
    notifyListeners();

    try {
      final req = ChatbotRequestTeacher(message: message);
      final res = await _service!.sendMessage(req);

      todayChats.add(
        ChatbotResponseTeacher(
          message: message,
          reply: res.reply,
        ),
      );

      isLoading = false;
      notifyListeners();
      return res.reply;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
