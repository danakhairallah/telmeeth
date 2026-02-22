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
        data!.add(Data.fromJson(v));
      });
    }
    grandTotal = json['grand_total'] != null
        ? GrandTotal.fromJson(json['grand_total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (grandTotal != null) {
      data['grand_total'] = grandTotal!.toJson();
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
        marks!.add(Marks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_id'] = subjectId;
    data['subject_name_ar'] = subjectNameAr;
    data['subject_name_en'] = subjectNameEn;
    data['total_mark'] = totalMark;
    data['total_full_mark'] = totalFullMark;
    data['average_mark'] = averageMark;
    data['percentage'] = percentage;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_mark'] = totalMark;
    data['total_full_mark'] = totalFullMark;
    data['percentage'] = percentage;
    return data;
  }
}