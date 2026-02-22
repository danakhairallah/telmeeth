class MarkDetile {
  bool? success;
  Data? data;

  MarkDetile({this.success, this.data});

  MarkDetile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  List<Marks>? marks;

  Data({this.subjectId, this.subjectNameAr, this.subjectNameEn, this.marks});

  Data.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    subjectNameAr = json['subject_name_ar'];
    subjectNameEn = json['subject_name_en'];
    if (json['marks'] != null) {
      marks = <Marks>[];
      json['marks'].forEach((v) {
        marks!.add(Marks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_id'] = subjectId;
    data['subject_name_ar'] = subjectNameAr;
    data['subject_name_en'] = subjectNameEn;
    if (marks != null) {
      data['marks'] = marks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Marks {
  int? id;
  String? mark;
  int? fullMark;
  String? source;
  int? sourceId;

  Marks({this.id, this.mark, this.fullMark, this.source, this.sourceId});

  Marks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mark = json['mark'];
    fullMark = json['full_mark'];
    source = json['source'];
    sourceId = json['source_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mark'] = mark;
    data['full_mark'] = fullMark;
    data['source'] = source;
    data['source_id'] = sourceId;
    return data;
  }
}