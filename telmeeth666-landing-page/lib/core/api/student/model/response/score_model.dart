class ScoreModel {
  bool? success;
  List<ScoreData> data;

  ScoreModel({
    this.success,
    List<ScoreData>? data,
  }) : data = data ?? [];

  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      success: json['success'],
      data: json['data'] == null
          ? []
          : List<ScoreData>.from(
              json['data'].map((x) => ScoreData.fromJson(x)),
            ),
    );
  }
}

class ScoreData {
  String? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  int? totalMark;
  int? totalFullMark;
  double? averageMark;
  double? percentage;

  ScoreData(
      {this.subjectId,
      this.subjectNameAr,
      this.subjectNameEn,
      this.totalMark,
      this.totalFullMark,
      this.averageMark,
      this.percentage});

  ScoreData.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    subjectNameAr = json['subject_name_ar'];
    subjectNameEn = json['subject_name_en'];
    totalMark = json['total_mark'];
    totalFullMark = json['total_full_mark'];
    averageMark = json['average_mark'];
    percentage = json['percentage'];
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
    return data;
  }
}