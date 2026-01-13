class MarkDetile {
  bool? success;
  Data? data;

  MarkDetile({this.success, this.data});

  MarkDetile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
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
        marks!.add(new Marks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['subject_name_ar'] = this.subjectNameAr;
    data['subject_name_en'] = this.subjectNameEn;
    if (this.marks != null) {
      data['marks'] = this.marks!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mark'] = this.mark;
    data['full_mark'] = this.fullMark;
    data['source'] = this.source;
    data['source_id'] = this.sourceId;
    return data;
  }
}