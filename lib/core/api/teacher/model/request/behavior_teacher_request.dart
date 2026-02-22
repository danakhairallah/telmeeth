class BehaviorTeacherRequest {
  int? studentId;
  int? classTeacherId;
  int? behaviorId;
  String? description;
  bool? certificate;

  BehaviorTeacherRequest(
      {this.studentId,
      this.classTeacherId,
      this.behaviorId,
      this.description,
      this.certificate});

  BehaviorTeacherRequest.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    classTeacherId = json['class_teacher_id'];
    behaviorId = json['behavior_id'];
    description = json['description'];
    certificate = json['certificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['class_teacher_id'] = this.classTeacherId;
    data['behavior_id'] = this.behaviorId;
    data['description'] = this.description;
    data['certificate'] = this.certificate;
    return data;
  }
}