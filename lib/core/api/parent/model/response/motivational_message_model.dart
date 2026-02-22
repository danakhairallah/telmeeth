class MotivationalMessageModel {
  final int id;
  final int studentId;
  final String message;
  final String? imageUrl;
  String? studentName;

  MotivationalMessageModel({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.message,
    this.imageUrl,
  });

  factory MotivationalMessageModel.fromJson(Map<String, dynamic> json) {
    String? fullImageUrl;

    if (json['image_url'] != null &&
        json['image_url'].toString().isNotEmpty) {
      fullImageUrl =
      "https://api.telmeeth.net/${json['image_url']}";
    }

    return MotivationalMessageModel(
      id: json['id'],
      studentId: json['student_id'],
      studentName: json['student']?['name_ar'] ?? '',
      message: json['message'] ?? '',
      imageUrl: fullImageUrl,
    );
  }
}
