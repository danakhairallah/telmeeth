class ExamQA {
  bool? status;
  String? examId;
  List<Questions>? questions;

  ExamQA({this.status, this.examId, this.questions});

  ExamQA.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    examId = json['exam_id'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['exam_id'] = this.examId;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? type;
  int? id;
  String? question;
  Null? options;
  String? hint;
  Null? imageUrl;
  int? mark;
  String? createdAt;

  Questions(
      {this.type,
      this.id,
      this.question,
      this.options,
      this.hint,
      this.imageUrl,
      this.mark,
      this.createdAt});

  Questions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    question = json['question'];
    options = json['options'];
    hint = json['hint'];
    imageUrl = json['image_url'];
    mark = json['mark'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['question'] = this.question;
    data['options'] = this.options;
    data['hint'] = this.hint;
    data['image_url'] = this.imageUrl;
    data['mark'] = this.mark;
    data['created_at'] = this.createdAt;
    return data;
  }
}