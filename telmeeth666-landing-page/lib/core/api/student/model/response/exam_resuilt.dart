
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
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['exam_id'] = examId;
    data['student_mark'] = studentMark;
    data['exam_full_mark'] = examFullMark;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['question_id'] = questionId;
    data['question'] = question;
    data['full_mark'] = fullMark;
    data['student_mark'] = studentMark;
    data['student_answer'] = studentAnswer;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}
