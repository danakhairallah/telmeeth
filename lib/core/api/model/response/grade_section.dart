import 'package:telmeeth/core/api/model/response/grade.dart';

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
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    section =
        json['section'] != null ? new Grade.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['grade_id'] = this.gradeId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    return data;
  }
}