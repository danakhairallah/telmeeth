class SendMessageRequest {
  final int studentId;
  final String senderType;
  final String senderName;
  final String content;

  SendMessageRequest({
    required this.studentId,
    required this.senderType,
    required this.senderName,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'sender_type': senderType,
      'sender_name': senderName,
      'content': content,
    };
  }
}
