class InteractiveLessonSubmitModel {
  bool? success;
  String? message;
  Data? data;

  InteractiveLessonSubmitModel({this.success, this.message, this.data});

  InteractiveLessonSubmitModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Answer? answer;
  int? totalParts;
  int? answeredParts;

  Data({this.answer, this.totalParts, this.answeredParts});

  Data.fromJson(Map<String, dynamic> json) {
    answer =
        json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
    totalParts = json['total_parts'];
    answeredParts = json['answered_parts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    data['total_parts'] = this.totalParts;
    data['answered_parts'] = this.answeredParts;
    return data;
  }
}

class Answer {
  int? studentId;
  int? lessonPartId;
  List<int>? answer;
  List<bool>? isCorrect;
  String? updatedAt;
  String? createdAt;
  int? id;

  Answer(
      {this.studentId,
      this.lessonPartId,
      this.answer,
      this.isCorrect,
      this.updatedAt,
      this.createdAt,
      this.id});

  Answer.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    lessonPartId = json['lesson_part_id'];
    answer = json['answer'].cast<int>();
    isCorrect = json['is_correct'].cast<bool>();
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['lesson_part_id'] = this.lessonPartId;
    data['answer'] = this.answer;
    data['is_correct'] = this.isCorrect;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}