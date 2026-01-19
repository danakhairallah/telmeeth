class AnnouncementTeacher {
  final int id;
  final int classTeacherId;
  final String text;
  final String? fileUrl;
  final String priority;
  final DateTime dateTime;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  AnnouncementTeacher({
    required this.id,
    required this.classTeacherId,
    required this.text,
    this.fileUrl,
    required this.priority,
    required this.dateTime,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AnnouncementTeacher.fromJson(Map<String, dynamic> json) {
    return AnnouncementTeacher(
      id: json['id'],
      classTeacherId: json['class_teacher_id'],
      text: json['text'],
      fileUrl: json['file_url'],
      priority: json['priority'],
      dateTime: DateTime.parse(json['date_time']),
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
