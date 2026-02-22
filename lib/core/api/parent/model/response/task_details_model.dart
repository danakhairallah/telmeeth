// To parse this JSON data, do
//
//     final taskDetailsModel = taskDetailsModelFromJson(jsonString);

import 'dart:convert';

TaskDetailsModel taskDetailsModelFromJson(String str) => TaskDetailsModel.fromJson(json.decode(str));

String taskDetailsModelToJson(TaskDetailsModel data) => json.encode(data.toJson());

class TaskDetailsModel {
    bool? success;
    Task? task;

    TaskDetailsModel({
        this.success,
        this.task,
    });

    factory TaskDetailsModel.fromJson(Map<String, dynamic> json) => TaskDetailsModel(
        success: json["success"],
        task: json["task"] == null ? null : Task.fromJson(json["task"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "task": task?.toJson(),
    };
}

class Task {
    int? id;
    String? title;
    String? description;
    DateTime? deadline;
    String? status;
    String? remainingTime;
    bool? isSubmitted;
    int? studentMark;
    int? totalMark;
    dynamic teacher;
    String? subject;
    List<MultipleChoice>? multipleChoice;
    List<EssayQuestion>? essayQuestions;

    Task({
        this.id,
        this.title,
        this.description,
        this.deadline,
        this.status,
        this.remainingTime,
        this.isSubmitted,
        this.studentMark,
        this.totalMark,
        this.teacher,
        this.subject,
        this.multipleChoice,
        this.essayQuestions,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        status: json["status"],
        remainingTime: json["remaining_time"],
        isSubmitted: json["is_submitted"],
        studentMark: json["student_mark"],
        totalMark: json["total_mark"],
        teacher: json["teacher"],
        subject: json["subject"],
        multipleChoice: json["multiple_choice"] == null ? [] : List<MultipleChoice>.from(json["multiple_choice"]!.map((x) => MultipleChoice.fromJson(x))),
        essayQuestions: json["essay_questions"] == null ? [] : List<EssayQuestion>.from(json["essay_questions"]!.map((x) => EssayQuestion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "deadline": deadline?.toIso8601String(),
        "status": status,
        "remaining_time": remainingTime,
        "is_submitted": isSubmitted,
        "student_mark": studentMark,
        "total_mark": totalMark,
        "teacher": teacher,
        "subject": subject,
        "multiple_choice": multipleChoice == null ? [] : List<dynamic>.from(multipleChoice!.map((x) => x.toJson())),
        "essay_questions": essayQuestions == null ? [] : List<dynamic>.from(essayQuestions!.map((x) => x.toJson())),
    };
}

class EssayQuestion {
    int? questionId;
    String? question;
    String? studentAnswer;
    String? markGiven;
    int? maxMark;

    EssayQuestion({
        this.questionId,
        this.question,
        this.studentAnswer,
        this.markGiven,
        this.maxMark,
    });

    factory EssayQuestion.fromJson(Map<String, dynamic> json) => EssayQuestion(
        questionId: json["question_id"],
        question: json["question"],
        studentAnswer: json["student_answer"],
        markGiven: json["mark_given"],
        maxMark: json["max_mark"],
    );

    Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "question": question,
        "student_answer": studentAnswer,
        "mark_given": markGiven,
        "max_mark": maxMark,
    };
}

class MultipleChoice {
    int? questionId;
    String? question;
    Options? options;
    String? correctAnswer;
    String? studentAnswer;
    int? isCorrect;
    int? mark;

    MultipleChoice({
        this.questionId,
        this.question,
        this.options,
        this.correctAnswer,
        this.studentAnswer,
        this.isCorrect,
        this.mark,
    });

    factory MultipleChoice.fromJson(Map<String, dynamic> json) => MultipleChoice(
        questionId: json["question_id"],
        question: json["question"],
        options: json["options"] == null ? null : Options.fromJson(json["options"]),
        correctAnswer: json["correct_answer"],
        studentAnswer: json["student_answer"],
        isCorrect: json["is_correct"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "question": question,
        "options": options?.toJson(),
        "correct_answer": correctAnswer,
        "student_answer": studentAnswer,
        "is_correct": isCorrect,
        "mark": mark,
    };
}

class Options {
    String? a;
    String? b;
    String? c;
    String? d;

    Options({
        this.a,
        this.b,
        this.c,
        this.d,
    });

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "b": b,
        "c": c,
        "d": d,
    };
}
