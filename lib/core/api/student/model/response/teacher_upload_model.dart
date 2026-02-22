class TeacherUploadModel {
  final int id;
  final int teacherId;
  final String type;
  final String title;
  final String? description;
  final String filePath;
  final String fileUrl;
  final List<String> unitId;
  final List<String> lessonId;
  final String createdAt;
  final String updatedAt;

  TeacherUploadModel({
    required this.id,
    required this.teacherId,
    required this.type,
    required this.title,
    this.description,
    required this.filePath,
    required this.fileUrl,
    required this.unitId,
    required this.lessonId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherUploadModel.fromJson(Map<String, dynamic> json) {
    return TeacherUploadModel(
      id: json['id'],
      teacherId: json['teacher_id'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      filePath: json['file_path'],
      fileUrl: json['file_url'],
      unitId: (json['unit_id'] as List?)?.map((e) => e.toString()).toList() ?? [],
      lessonId: (json['lesson_id'] as List?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
