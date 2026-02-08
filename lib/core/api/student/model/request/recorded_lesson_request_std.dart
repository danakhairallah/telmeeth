class RecordedLessonRequestStd {
  int? recordedLessonId;

  RecordedLessonRequestStd({this.recordedLessonId});

  RecordedLessonRequestStd.fromJson(Map<String, dynamic> json) {
    recordedLessonId = json['recorded_lesson_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recorded_lesson_id'] = this.recordedLessonId;
    return data;
  }
}