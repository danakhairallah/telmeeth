class ExamQuestionTeacherModel {
  bool? success;
  List<ExamDataT>? examDataT;

  ExamQuestionTeacherModel({this.success, this.examDataT});

  ExamQuestionTeacherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      examDataT = <ExamDataT>[];
      json['data'].forEach((v) {
        examDataT!.add(new ExamDataT.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.examDataT != null) {
      data['data'] = this.examDataT!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExamDataT {
  int? examId;
  String? question;
  String? hint;
  String? mark;
  String? imageUrl;
  String? imagePath;
  String? updatedAt;
  String? createdAt;
  int? id;

  ExamDataT(
      {this.examId,
      this.question,
      this.hint,
      this.mark,
      this.imageUrl,
      this.imagePath,
      this.updatedAt,
      this.createdAt,
      this.id});

  ExamDataT.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    question = json['question'];
    hint = json['hint'];
    mark = json['mark'];
    imageUrl = json['image_url'];
    imagePath = json['image_path'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_id'] = this.examId;
    data['question'] = this.question;
    data['hint'] = this.hint;
    data['mark'] = this.mark;
    data['image_url'] = this.imageUrl;
    data['image_path'] = this.imagePath;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}