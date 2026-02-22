class ExamMultiQuestionModel {
  bool? success;
  List<MultiQuestionData>? multiQuestionData;

  ExamMultiQuestionModel({this.success, this.multiQuestionData});

  ExamMultiQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      multiQuestionData = <MultiQuestionData>[];
      json['data'].forEach((v) {
        multiQuestionData!.add(new MultiQuestionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.multiQuestionData != null) {
      data['data'] = this.multiQuestionData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MultiQuestionData {
  int? id;
  int? examId;
  String? question;
  List<String>? options;
  String? correctAnswer;
  int? mark;
  String? imagePath;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  MultiQuestionData(
      {this.id,
      this.examId,
      this.question,
      this.options,
      this.correctAnswer,
      this.mark,
      this.imagePath,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  MultiQuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
    mark = json['mark'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_id'] = this.examId;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correct_answer'] = this.correctAnswer;
    data['mark'] = this.mark;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}