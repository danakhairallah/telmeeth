class MessageModel {
  final int id;
  final String content;
  final String senderName;
  final DateTime createdAt;
  final String? imageUrl;

  MessageModel({
    required this.id,
    required this.content,
    required this.senderName,
    required this.createdAt,
    this.imageUrl,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      content: json['message'] ?? '',
      senderName: json['parent']?['name_ar']
          ?? json['parent']?['name_en']
          ?? 'Parent',
      createdAt: DateTime.parse(json['created_at']),
      imageUrl: json['image_url'],
    );
  }
}
