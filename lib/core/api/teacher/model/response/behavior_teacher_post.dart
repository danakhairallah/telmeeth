class BehaviorTeacherPost {
  bool? success;
  BehaviorData? behaviorData;
  int? score;
  bool? certificate;

  BehaviorTeacherPost({this.success, this.behaviorData, this.score, this.certificate});

  BehaviorTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    behaviorData = json['data'] != null ? new BehaviorData.fromJson(json['data']) : null;
    score = json['score'];
    certificate = json['certificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.behaviorData != null) {
      data['data'] = this.behaviorData!.toJson();
    }
    data['score'] = this.score;
    data['certificate'] = this.certificate;
    return data;
  }
}

class BehaviorData {
  int? studentId;
  int? classTeacherId;
  int? behaviorId;
  String? description;
  bool? certificate;
  String? updatedAt;
  String? createdAt;
  int? id;

  BehaviorData(
      {this.studentId,
      this.classTeacherId,
      this.behaviorId,
      this.description,
      this.certificate,
      this.updatedAt,
      this.createdAt,
      this.id});

  BehaviorData.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    classTeacherId = json['class_teacher_id'];
    behaviorId = json['behavior_id'];
    description = json['description'];
    certificate = json['certificate'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['class_teacher_id'] = this.classTeacherId;
    data['behavior_id'] = this.behaviorId;
    data['description'] = this.description;
    data['certificate'] = this.certificate;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}