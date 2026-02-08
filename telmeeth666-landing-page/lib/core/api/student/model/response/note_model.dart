class NoteModel {
  bool? success;
 Note? note;

  NoteModel({this.success, this.note});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      success: json['success'] as bool?,
      note: json['note'] != null
          ? Note.fromJson(json['note'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'note': note?.toJson(),
    };
  }
}


class Note {
  int? studentId;
  String? lessonId;
  String? text;
  String? updatedAt;
  String? createdAt;
  int? id;

  Note({
    this.studentId,
    this.lessonId,
    this.text,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        studentId: json['student_id'],
        lessonId: json['lesson_id']?.toString(),
        text: json['text']?.toString(),
        updatedAt: json['updated_at']?.toString(),
        createdAt: json['created_at']?.toString(),
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'student_id': studentId,
        'lesson_id': lessonId,
        'text': text,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'id': id,
      };
}
