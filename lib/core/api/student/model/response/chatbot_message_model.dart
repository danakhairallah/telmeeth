class ChatbotMessageModel {
  final String message;
  final String response;
  final DateTime createdAt;

  ChatbotMessageModel({
    required this.message,
    required this.response,
    required this.createdAt,
  });

  factory ChatbotMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatbotMessageModel(
      message: json['message'] ?? '',
      response: json['response'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
    );
  }
}

// lib/core/api/student/model/response/chatbot_reply_model.dart
class ChatbotReplyModel {
  final String reply;

  ChatbotReplyModel({required this.reply});

  factory ChatbotReplyModel.fromJson(Map<String, dynamic> json) {
    return ChatbotReplyModel(
      reply: json['reply'] ?? '',
    );
  }
}
