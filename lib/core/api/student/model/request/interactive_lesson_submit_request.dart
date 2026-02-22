class InteractiveLessonSubmitRequest {
  int? lessonPartId;
  List<String>? answer;

  InteractiveLessonSubmitRequest({this.lessonPartId, this.answer});

  InteractiveLessonSubmitRequest.fromJson(Map<String, dynamic> json) {
    lessonPartId = json['lesson_part_id'];
    answer = json['answer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson_part_id'] = this.lessonPartId;
    data['answer'] = this.answer;
    return data;
  }
}