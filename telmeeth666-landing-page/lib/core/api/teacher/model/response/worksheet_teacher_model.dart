class WorksheetTeacherModel {
  bool? success;
  List<WorksheetDataT>? worksheetDataT;

  WorksheetTeacherModel({this.success, this.worksheetDataT});

  WorksheetTeacherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      worksheetDataT = <WorksheetDataT>[];
      json['data'].forEach((v) {
        worksheetDataT!.add(new WorksheetDataT.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.worksheetDataT != null) {
      data['data'] = this.worksheetDataT!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorksheetDataT {
  int? id;
  int? teacherId;
  String? title;
  String? type;
  String? unitId;
  String? lessonId;
  String? createdAt;
  String? updatedAt;
  List<Units>? units;
  List<Lessons>? lessons;
  List<Classes>? classes;
  List<Grades>? grades;
  List<Subjects>? subjects;

  WorksheetDataT(
      {this.id,
      this.teacherId,
      this.title,
      this.type,
      this.unitId,
      this.lessonId,
      this.createdAt,
      this.updatedAt,
      this.units,
      this.lessons,
      this.classes,
      this.grades,
      this.subjects});

  WorksheetDataT.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    title = json['title'];
    type = json['type'];
    unitId = json['unit_id'];
    lessonId = json['lesson_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(new Units.fromJson(v));
      });
    }
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    if (json['grades'] != null) {
      grades = <Grades>[];
      json['grades'].forEach((v) {
        grades!.add(new Grades.fromJson(v));
      });
    }
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.units != null) {
      data['units'] = this.units!.map((v) => v.toJson()).toList();
    }
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    if (this.grades != null) {
      data['grades'] = this.grades!.map((v) => v.toJson()).toList();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Units {
  int? id;
  String? name;
  int? classId;
  String? semester;
  String? createdAt;
  String? updatedAt;

  Units(
      {this.id,
      this.name,
      this.classId,
      this.semester,
      this.createdAt,
      this.updatedAt});

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classId = json['class_id'];
    semester = json['semester'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['class_id'] = this.classId;
    data['semester'] = this.semester;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Lessons {
  int? id;
  String? name;
  Null? filePath;
  String? fileUrl;
  Null? imagePath;
  String? imageUrl;
  String? summary;
  String? outcomes;
  int? unitId;
  String? createdAt;
  String? updatedAt;

  Lessons(
      {this.id,
      this.name,
      this.filePath,
      this.fileUrl,
      this.imagePath,
      this.imageUrl,
      this.summary,
      this.outcomes,
      this.unitId,
      this.createdAt,
      this.updatedAt});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    filePath = json['file_path'];
    fileUrl = json['file_url'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    summary = json['summary'];
    outcomes = json['outcomes'];
    unitId = json['unit_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file_path'] = this.filePath;
    data['file_url'] = this.fileUrl;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['summary'] = this.summary;
    data['outcomes'] = this.outcomes;
    data['unit_id'] = this.unitId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Classes {
  int? id;
  int? curriculumId;
  int? gradeId;
  int? subjectId;
  Null? imagePath;
  Null? imageUrl;
  String? createdAt;
  String? updatedAt;

  Classes(
      {this.id,
      this.curriculumId,
      this.gradeId,
      this.subjectId,
      this.imagePath,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curriculumId = json['curriculum_id'];
    gradeId = json['grade_id'];
    subjectId = json['subject_id'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curriculum_id'] = this.curriculumId;
    data['grade_id'] = this.gradeId;
    data['subject_id'] = this.subjectId;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Grades {
  int? id;
  String? nameAr;
  String? nameEn;
  String? level;
  String? createdAt;
  String? updatedAt;

  Grades(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.level,
      this.createdAt,
      this.updatedAt});

  Grades.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    level = json['level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['level'] = this.level;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Subjects {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Subjects({this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}