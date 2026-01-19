class TaskTeacherPost {
  bool? success;
  String? message;
  DataTaskPost? dataTaskPost;

  TaskTeacherPost({this.success, this.message, this.dataTaskPost});

  TaskTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    dataTaskPost = json['data'] != null ? new DataTaskPost.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dataTaskPost != null) {
      data['data'] = this.dataTaskPost!.toJson();
    }
    return data;
  }
}

class DataTaskPost {
  int? classTeacherId;
  int? lessonId;
  String? type;
  String? title;
  String? description;
  String? deadline;
  int? mark;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataTaskPost(
      {this.classTeacherId,
      this.lessonId,
      this.type,
      this.title,
      this.description,
      this.deadline,
      this.mark,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataTaskPost.fromJson(Map<String, dynamic> json) {
    classTeacherId = json['class_teacher_id'];
    lessonId = json['lesson_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    deadline = json['deadline'];
    mark = json['mark'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_teacher_id'] = this.classTeacherId;
    data['lesson_id'] = this.lessonId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['deadline'] = this.deadline;
    data['mark'] = this.mark;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}