class AiMessageResponse {
  final String reply;

  AiMessageResponse({required this.reply});

  factory AiMessageResponse.fromJson(Map<String, dynamic> json) {
    return AiMessageResponse(
      reply: json['reply'] ?? '',
    );
  }
}
