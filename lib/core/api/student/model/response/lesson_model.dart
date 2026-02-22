class LessonModel {
  String? unitId;
  List<Lessons>? lessons;

  LessonModel({this.unitId, this.lessons});

  LessonModel.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit_id'] = unitId;
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  String? name;
  Null filePath;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['file_path'] = filePath;
    data['file_url'] = fileUrl;
    data['summary'] = summary;
    return data;
  }
}