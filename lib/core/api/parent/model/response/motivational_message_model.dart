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
    return MotivationalMessageModel(
      id: json['id'],
      studentId: json['student_id'],
      studentName: json['student']?['name'] ?? '',
      message: json['message'] ?? '',
      imageUrl: json['image_url'],
    );
  }
}
