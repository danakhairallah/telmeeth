class AveragModel {
  bool? success;
  List<Data>? data;
  GrandTotal? grandTotal;

  AveragModel({this.success, this.data, this.grandTotal});

  AveragModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    grandTotal = json['grand_total'] != null
        ? new GrandTotal.fromJson(json['grand_total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.grandTotal != null) {
      data['grand_total'] = this.grandTotal!.toJson();
    }
    return data;
  }
}

class Data {
  int? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  int? totalMark;
  int? totalFullMark;
  double? averageMark;
  double? percentage;
  List<Marks>? marks;

  Data(
      {this.subjectId,
      this.subjectNameAr,
      this.subjectNameEn,
      this.totalMark,
      this.totalFullMark,
      this.averageMark,
      this.percentage,
      this.marks});

  Data.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    subjectNameAr = json['subject_name_ar'];
    subjectNameEn = json['subject_name_en'];
    totalMark = json['total_mark'];
    totalFullMark = json['total_full_mark'];
    averageMark = json['average_mark'];
    percentage = json['percentage'];
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
    data['total_mark'] = this.totalMark;
    data['total_full_mark'] = this.totalFullMark;
    data['average_mark'] = this.averageMark;
    data['percentage'] = this.percentage;
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

class GrandTotal {
  int? totalMark;
  int? totalFullMark;
  double? percentage;

  GrandTotal({this.totalMark, this.totalFullMark, this.percentage});

  GrandTotal.fromJson(Map<String, dynamic> json) {
    totalMark = json['total_mark'];
    totalFullMark = json['total_full_mark'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_mark'] = this.totalMark;
    data['total_full_mark'] = this.totalFullMark;
    data['percentage'] = this.percentage;
    return data;
  }
}