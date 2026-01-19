class TeacherExamRequest {
  int? classTeacherId;
  String? dateTime;
  int? mark;
  int? duration;
  String? title;
  String? description;
  String? type;

  TeacherExamRequest(
      {this.classTeacherId,
      this.dateTime,
      this.mark,
      this.duration,
      this.title,
      this.description,
      this.type});

  TeacherExamRequest.fromJson(Map<String, dynamic> json) {
    classTeacherId = json['class_teacher_id'];
    dateTime = json['date_time'];
    mark = json['mark'];
    duration = json['duration'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_teacher_id'] = this.classTeacherId;
    data['date_time'] = this.dateTime;
    data['mark'] = this.mark;
    data['duration'] = this.duration;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}