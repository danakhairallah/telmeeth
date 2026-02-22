class WorksheetTeacherRequest {
  String? title;
  String? type;
  List<int>? unitId;
  List<int>? lessonId;

  WorksheetTeacherRequest({this.title, this.type, this.unitId, this.lessonId});

  WorksheetTeacherRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    unitId = json['unit_id'].cast<int>();
    lessonId = json['lesson_id'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    return data;
  }
}