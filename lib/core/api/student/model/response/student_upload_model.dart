
class StudentUploadModel {
  final int id;
  final String type;
  final String title;
  final String description;
  final String filePath;
  final String fileUrl;
  final String unitId;
  final int lessonId;
  final String? createdAt;
  final String? updatedAt;

  StudentUploadModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.filePath,
    required this.fileUrl,
    required this.unitId,
    required this.lessonId,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentUploadModel.fromJson(Map<String, dynamic> json) {
    return StudentUploadModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      filePath: json['file_path'],
      fileUrl: json['file_url'],
      unitId: json['unit_id'].toString(),
      lessonId: json['lesson_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
