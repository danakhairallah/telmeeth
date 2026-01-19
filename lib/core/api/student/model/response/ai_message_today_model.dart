class AiMessageTodayModel {
  final String content;
  final String response;
  final DateTime createdAt;

  AiMessageTodayModel({
    required this.content,
    required this.response,
    required this.createdAt,
  });

  factory AiMessageTodayModel.fromJson(Map<String, dynamic> json) {
    return AiMessageTodayModel(
      content: json['content'] ?? '',
      response: json['response'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}
