
class ReportModel {
  final int id;
  final String text;
  final List<String> attachments;
  final DateTime createdAt;
  final Teacher teacher;
  final Subject subject;

  ReportModel({
    required this.id,
    required this.text,
    required this.attachments,
    required this.createdAt,
    required this.teacher,
    required this.subject,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      text: json['text'],
      attachments: List<String>.from(json['attachments'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
      teacher: Teacher.fromJson(json['teacher']),
      subject: Subject.fromJson(json['subject']),
    );
  }
}

class Teacher {
  final int id;
  final String nameAr;
  final String nameEn;

  Teacher({required this.id, required this.nameAr, required this.nameEn});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
    );
  }
}

class Subject {
  final int id;
  final String nameAr;
  final String nameEn;

  Subject({required this.id, required this.nameAr, required this.nameEn});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
    );
  }
}
