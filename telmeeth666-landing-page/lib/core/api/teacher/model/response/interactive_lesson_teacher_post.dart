class InteractiveLessonTeacherPost {
  bool? success;
  String? message;
  InteractivePostData? data;

  InteractiveLessonTeacherPost({this.success, this.message, this.data});

  InteractiveLessonTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new InteractivePostData.fromJson(json['data']) : null;
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

class InteractivePostData {
  int? teacherId;
  int? lessonId;
  String? sectionId;
  String? title;
  String? description;
  String? videoPath;
  String? updatedAt;
  String? createdAt;
  int? id;

  InteractivePostData(
      {this.teacherId,
      this.lessonId,
      this.sectionId,
      this.title,
      this.description,
      this.videoPath,
      this.updatedAt,
      this.createdAt,
      this.id});

  InteractivePostData.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    lessonId = json['lesson_id'];
    sectionId = json['section_id'];
    title = json['title'];
    description = json['description'];
    videoPath = json['video_path'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['lesson_id'] = this.lessonId;
    data['section_id'] = this.sectionId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['video_path'] = this.videoPath;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}