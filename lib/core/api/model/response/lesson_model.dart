class LessonModel {
  String? unitId;
  List<Lessons>? lessons;

  LessonModel({this.unitId, this.lessons});

  LessonModel.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_id'] = this.unitId;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  String? name;
  Null? filePath;
  String? fileUrl;
  String? summary;

  Lessons({this.id, this.name, this.filePath, this.fileUrl, this.summary});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    filePath = json['file_path'];
    fileUrl = json['file_url'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file_path'] = this.filePath;
    data['file_url'] = this.fileUrl;
    data['summary'] = this.summary;
    return data;
  }
}