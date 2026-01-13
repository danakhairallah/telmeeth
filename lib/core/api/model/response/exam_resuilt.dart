import 'package:telmeeth/core/api/model/response/questions_model.dart';

class ExamResuilt {
  bool? status;
  String? examId;
  int? studentMark;
  int? examFullMark;
  List<Questions>? questions;

  ExamResuilt(
      {this.status,
        this.examId,
        this.studentMark,
        this.examFullMark,
        this.questions});

  ExamResuilt.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    examId = json['exam_id'];
    studentMark = json['student_mark'];
    examFullMark = json['exam_full_mark'];
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
    data['student_mark'] = this.studentMark;
    data['exam_full_mark'] = this.examFullMark;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? type;
  int? questionId;
  String? question;
  int? fullMark;
  int? studentMark;
  String? studentAnswer;
  String? correctAnswer;

  Questions(
      {this.type,
        this.questionId,
        this.question,
        this.fullMark,
        this.studentMark,
        this.studentAnswer,
        this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    questionId = json['question_id'];
    question = json['question'];
    fullMark = json['full_mark'];
    studentMark = json['student_mark'];
    studentAnswer = json['student_answer'];
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['question_id'] = this.questionId;
    data['question'] = this.question;
    data['full_mark'] = this.fullMark;
    data['student_mark'] = this.studentMark;
    data['student_answer'] = this.studentAnswer;
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}
