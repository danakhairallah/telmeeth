class UplodesTeacherModel {
  bool? success;
  List<UplodeData>? uplodeData;

  UplodesTeacherModel({this.success, this.uplodeData});

  UplodesTeacherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      uplodeData = <UplodeData>[];
      json['data'].forEach((v) {
        uplodeData!.add(new UplodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.uplodeData != null) {
      data['data'] = this.uplodeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UplodeData {
  int? id;
  int? teacherId;
  String? type;
  String? title;
  String? description;
  String? filePath;
  String? fileUrl;
  List<String>? unitId;
  List<String>? lessonId;
  String? createdAt;
  String? updatedAt;

  UplodeData(
      {this.id,
      this.teacherId,
      this.type,
      this.title,
      this.description,
      this.filePath,
      this.fileUrl,
      this.unitId,
      this.lessonId,
      this.createdAt,
      this.updatedAt});

  UplodeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    filePath = json['file_path'];
    fileUrl = json['file_url'];
    unitId = json['unit_id'].cast<String>();
    lessonId = json['lesson_id'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['file_path'] = this.filePath;
    data['file_url'] = this.fileUrl;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}