class TaskResultResponse {
  bool? status;
  String? taskId;
  int? studentMark;
  int? taskFullMark;
  List<TaskResultQuestion>? questions;

  TaskResultResponse({
    required this.status,
    required this.taskId,
    required this.studentMark,
    required this.taskFullMark,
    required this.questions,
  });

  factory TaskResultResponse.fromJson(Map<String, dynamic> json) {
    return TaskResultResponse(
      status: json['status'],
      taskId: json['task_id'].toString(),
      studentMark: json['student_mark'],
      taskFullMark: json['task_full_mark'],
      questions: (json['questions'] as List)
          .map((e) => TaskResultQuestion.fromJson(e))
          .toList(),
    );
  }
}

class TaskResultQuestion {
  String? type;
  int? questionId;
  String? question;
  int? fullMark;
  int? studentMark;
  String? studentAnswer;
  String? correctAnswer;

  TaskResultQuestion({
    required this.type,
    required this.questionId,
    required this.question,
    required this.fullMark,
    required this.studentMark,
    required this.studentAnswer,
    required this.correctAnswer,
  });

  factory TaskResultQuestion.fromJson(Map<String, dynamic> json) {
    return TaskResultQuestion(
      type: json['type'],
      questionId: json['question_id'],
      question: json['question'],
      fullMark: json['full_mark'],
      studentMark: json['student_mark'],
      studentAnswer: json['student_answer'],
      correctAnswer: json['correct_answer'],
    );
  }
}
