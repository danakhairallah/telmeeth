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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['lesson_id'] = this.lessonId;
    data['color'] = this.color;
    data['text'] = this.text;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}