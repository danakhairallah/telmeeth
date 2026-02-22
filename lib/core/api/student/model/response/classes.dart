
import 'package:telmeeth/core/api/student/model/response/subject.dart';

class Classes {
  int? id;
  int? curriculumId;
  int? gradeId;
  int? subjectId;
  Null imagePath;
  Null imageUrl;
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
    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['curriculum_id'] = curriculumId;
    data['grade_id'] = gradeId;
    data['subject_id'] = subjectId;
    data['image_path'] = imagePath;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    return data;
  }
}