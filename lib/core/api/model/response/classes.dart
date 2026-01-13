import 'package:telmeeth/core/api/model/response/subject.dart';

class Classes {
  int? id;
  int? curriculumId;
  int? gradeId;
  int? subjectId;
  Null? imagePath;
  Null? imageUrl;
  String? createdAt;
  String? updatedAt;
  Subject? subject;

  Classes({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.subject});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curriculumId = json['curriculum_id'];
    gradeId = json['grade_id'];
    subjectId = json['subject_id'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curriculum_id'] = this.curriculumId;
    data['grade_id'] = this.gradeId;
    data['subject_id'] = this.subjectId;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}