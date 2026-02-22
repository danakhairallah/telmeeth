import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/services/chatbot_service_teacher.dart';
import 'package:telmeeth/core/api/teacher/model/request/chatbot_request_teacher.dart';
import 'package:telmeeth/core/api/teacher/model/response/chatbot_response_teacher.dart';

class TeacherChatbotController extends ChangeNotifier {
  ChatbotServiceTeacher? _service;

  List<ChatbotResponseTeacher> todayChats = [];

  /// ✅ لودينغ التاريخ/الجلب (يظهر بالنص)
  bool isLoading = false;

  /// ✅ لودينغ الإرسال (يظهر على زر السهم)
  bool isSending = false;

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

    try {
      todayChats = await _service!.fetchTodayChats();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> send(String message) async {
    await init();

    isSending = true;
    notifyListeners();

    try {
      final req = ChatbotRequestTeacher(message: message);
      final res = await _service!.sendMessage(req);

      // نفس منطقك: نضيف الرسالة محليًا
      todayChats.add(
        ChatbotResponseTeacher(
          message: message,
          reply: res.reply,
        ),
      );

      return res.reply;
    } catch (e) {
      return null;
    } finally {
      isSending = false;
      notifyListeners();
    }
  }
}