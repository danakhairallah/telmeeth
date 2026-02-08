
import 'package:telmeeth/core/api/student/model/response/grade.dart';

class GradeSection {
  int? id;
  int? gradeId;
  int? sectionId;
  String? createdAt;
  String? updatedAt;
  Grade? grade;
  Grade? section;

  GradeSection(
      {this.id,
        this.gradeId,
        this.sectionId,
        this.createdAt,
        this.updatedAt,
        this.grade,
        this.section});

  GradeSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    sectionId = json['section_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
    section =
    json['section'] != null ? Grade.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['grade_id'] = gradeId;
    data['section_id'] = sectionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (grade != null) {
      data['grade'] = grade!.toJson();
    }
    if (section != null) {
      data['section'] = section!.toJson();
    }
    return data;
  }
}