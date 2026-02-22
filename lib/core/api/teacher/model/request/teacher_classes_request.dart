class TeacherClassesRequest {
  int? classId;
  int? sectionId;
  String? day;
  String? classTime;

  TeacherClassesRequest(
      {this.classId, this.sectionId, this.day, this.classTime});

  TeacherClassesRequest.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    sectionId = json['section_id'];
    day = json['day'];
    classTime = json['class_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_id'] = this.classId;
    data['section_id'] = this.sectionId;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    return data;
  }
}