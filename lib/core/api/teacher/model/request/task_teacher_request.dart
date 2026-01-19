class TaskTeacherRequest {
  int? lessonId;
  String? type;
  String? title;
  String? description;
  String? deadline;
  int? mark;

  TaskTeacherRequest(
      {this.lessonId,
      this.type,
      this.title,
      this.description,
      this.deadline,
      this.mark});

  TaskTeacherRequest.fromJson(Map<String, dynamic> json) {
    lessonId = json['lesson_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    deadline = json['deadline'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson_id'] = this.lessonId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['deadline'] = this.deadline;
    data['mark'] = this.mark;
    return data;
  }
}