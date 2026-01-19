class ChatbotResponseTeacher {
  final String reply;
  final String? message;
  final String? response;
  final DateTime? createdAt;

  ChatbotResponseTeacher({
    required this.reply,
    this.message,
    this.response,
    this.createdAt,
  });

  factory ChatbotResponseTeacher.fromJson(Map<String, dynamic> json) {
    return ChatbotResponseTeacher(
      reply: json['reply'] ?? '',
      message: json['message'],
      response: json['response'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
    );
  }
}
