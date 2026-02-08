class HighlightData {
  int? studentId;
  int? lessonId;
  String? color;
  String? text;
  String? updatedAt;
  String? createdAt;
  int? id;

  HighlightData(
      {this.studentId,
      this.lessonId,
      this.color,
      this.text,
      this.updatedAt,
      this.createdAt,
      this.id});

  HighlightData.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    lessonId = json['lesson_id'];
    color = json['color'];
    text = json['text'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['lesson_id'] = lessonId;
    data['color'] = color;
    data['text'] = text;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}