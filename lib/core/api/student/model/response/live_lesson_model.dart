class LiveLessonsModel {
  String? role;
  String? userName;
  List<LiveLessons>? liveLessons;

  LiveLessonsModel({this.role, this.userName, this.liveLessons});

  LiveLessonsModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    userName = json['userName'];
    if (json['liveLessons'] != null) {
      liveLessons = <LiveLessons>[];
      json['liveLessons'].forEach((v) {
        liveLessons!.add(new LiveLessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['userName'] = this.userName;
    if (this.liveLessons != null) {
      data['liveLessons'] = this.liveLessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiveLessons {
  int? studentId;
  String? studentName;
  int? studentGradeSectionId;
  int? gradeSectionId;
  int? studentGradeId;
  int? classId;
  int? classGradeId;
  int? unitId;
  int? lessonId;
  int? liveLessonId;
  int? liveLessonSectionId;
  String? liveLessonRoom;
  String? liveLessonTitle;
  String? startTime;
  Null? endTime;
  String? description;
  Null? videoPath;
  String? videoUrl;

  LiveLessons(
      {this.studentId,
      this.studentName,
      this.studentGradeSectionId,
      this.gradeSectionId,
      this.studentGradeId,
      this.classId,
      this.classGradeId,
      this.unitId,
      this.lessonId,
      this.liveLessonId,
      this.liveLessonSectionId,
      this.liveLessonRoom,
      this.liveLessonTitle,
      this.startTime,
      this.endTime,
      this.description,
      this.videoPath,
      this.videoUrl});

  LiveLessons.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    studentGradeSectionId = json['student_grade_section_id'];
    gradeSectionId = json['grade_section_id'];
    studentGradeId = json['student_grade_id'];
    classId = json['class_id'];
    classGradeId = json['class_grade_id'];
    unitId = json['unit_id'];
    lessonId = json['lesson_id'];
    liveLessonId = json['live_lesson_id'];
    liveLessonSectionId = json['live_lesson_section_id'];
    liveLessonRoom = json['live_lesson_room'];
    liveLessonTitle = json['live_lesson_title'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    description = json['description'];
    videoPath = json['video_path'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['student_name'] = this.studentName;
    data['student_grade_section_id'] = this.studentGradeSectionId;
    data['grade_section_id'] = this.gradeSectionId;
    data['student_grade_id'] = this.studentGradeId;
    data['class_id'] = this.classId;
    data['class_grade_id'] = this.classGradeId;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    data['live_lesson_id'] = this.liveLessonId;
    data['live_lesson_section_id'] = this.liveLessonSectionId;
    data['live_lesson_room'] = this.liveLessonRoom;
    data['live_lesson_title'] = this.liveLessonTitle;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['description'] = this.description;
    data['video_path'] = this.videoPath;
    data['video_url'] = this.videoUrl;
    return data;
  }
}