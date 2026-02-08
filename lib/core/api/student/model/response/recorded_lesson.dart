class RecordedLessonModel {
  bool? success;
  List<Data>? data;

  RecordedLessonModel({this.success, this.data});

  RecordedLessonModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? videoUrl;
  String? videoPath;
  String? imageUrl;
  String? imagePath;
  String? description;

  Data(
      {this.id,
      this.title,
      this.videoUrl,
      this.videoPath,
      this.imageUrl,
      this.imagePath,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['video_url'];
    videoPath = json['video_path'];
    imageUrl = json['image_url'];
    imagePath = json['image_path'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['video_url'] = this.videoUrl;
    data['video_path'] = this.videoPath;
    data['image_url'] = this.imageUrl;
    data['image_path'] = this.imagePath;
    data['description'] = this.description;
    return data;
  }
}