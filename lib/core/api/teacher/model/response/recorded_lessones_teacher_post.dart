class RecordedLessonesTeacherPost {
  bool? success;
  String? message;
  DataRL? data;

  RecordedLessonesTeacherPost({this.success, this.message, this.data});

  RecordedLessonesTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataRL.fromJson(json['data']) : null;
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

class DataRL {
  int? teacherId;
  int? lessonId;
  String? sectionId;
  String? title;
  String? description;
  String? videoUrl;
  String? videoPath;
  String? imageUrl;
  String? imagePath;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataRL(
      {this.teacherId,
      this.lessonId,
      this.sectionId,
      this.title,
      this.description,
      this.videoUrl,
      this.videoPath,
      this.imageUrl,
      this.imagePath,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataRL.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    lessonId = json['lesson_id'];
    sectionId = json['section_id'];
    title = json['title'];
    description = json['description'];
    videoUrl = json['video_url'];
    videoPath = json['video_path'];
    imageUrl = json['image_url'];
    imagePath = json['image_path'];
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
    data['video_url'] = this.videoUrl;
    data['video_path'] = this.videoPath;
    data['image_url'] = this.imageUrl;
    data['image_path'] = this.imagePath;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}