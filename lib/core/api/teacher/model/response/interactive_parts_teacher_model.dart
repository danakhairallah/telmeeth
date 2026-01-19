class InteractivePartsModel {
  bool? status;
  List<InteractivePartsData>? data;

  InteractivePartsModel({this.status, this.data});

  InteractivePartsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <InteractivePartsData>[];
      json['data'].forEach((v) {
        data!.add(new InteractivePartsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InteractivePartsData {
  int? id;
  String? interactiveLessonId;
  List<String>? videoPath;   // <-- غيرت Null لـ String
  List<String>? videoUrl;    // <-- غيرت Null لـ String
  List<String>? questions;
  List<String>? options;
  List<String>? correctAnswer;
  String? timeInSeconds;
  String? description;       // <-- غيرت Null لـ String
  String? createdAt;
  String? updatedAt;

  InteractivePartsData({
    this.id,
    this.interactiveLessonId,
    this.videoPath,
    this.videoUrl,
    this.questions,
    this.options,
    this.correctAnswer,
    this.timeInSeconds,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  InteractivePartsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interactiveLessonId = json['interactive_lesson_id'];
    videoPath = json['video_path'] != null
        ? List<String>.from(json['video_path'])
        : [];
    videoUrl = json['video_url'] != null
        ? List<String>.from(json['video_url'])
        : [];
    questions = json['questions'] != null
        ? List<String>.from(json['questions'])
        : [];
    options = json['options'] != null
        ? List<String>.from(json['options'])
        : [];
    correctAnswer = json['correct_answer'] != null
        ? List<String>.from(json['correct_answer'])
        : [];
    timeInSeconds = json['time_in_seconds']?.toString();
    description = json['description']?.toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['interactive_lesson_id'] = interactiveLessonId;
    data['video_path'] = videoPath;
    data['video_url'] = videoUrl;
    data['questions'] = questions;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    data['time_in_seconds'] = timeInSeconds;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
