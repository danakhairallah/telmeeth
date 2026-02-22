class StreakLeaderboardModel {
  bool? status;
  List<Leaderboard>? leaderboard;

  StreakLeaderboardModel({this.status, this.leaderboard});

  StreakLeaderboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['leaderboard'] != null) {
      leaderboard = <Leaderboard>[];
      json['leaderboard'].forEach((v) {
        leaderboard!.add(new Leaderboard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.leaderboard != null) {
      data['leaderboard'] = this.leaderboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leaderboard {
  int? gradeId;
  String? gradeName;
  List<Students>? students;

  Leaderboard({this.gradeId, this.gradeName, this.students});

  Leaderboard.fromJson(Map<String, dynamic> json) {
    gradeId = json['grade_id'];
    gradeName = json['grade_name'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade_id'] = this.gradeId;
    data['grade_name'] = this.gradeName;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? studentId;
  int? currentStreak;
  Student? student;

  Students({this.studentId, this.currentStreak, this.student});

  Students.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    currentStreak = json['current_streak'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['current_streak'] = this.currentStreak;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? nameAr;
  String? nameEn;
  int? gradeSectionId;
  GradeSection? gradeSection;

  Student(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.gradeSectionId,
        this.gradeSection});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    gradeSectionId = json['grade_section_id'];
    gradeSection = json['grade_section'] != null
        ? new GradeSection.fromJson(json['grade_section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['grade_section_id'] = this.gradeSectionId;
    if (this.gradeSection != null) {
      data['grade_section'] = this.gradeSection!.toJson();
    }
    return data;
  }
}

class GradeSection {
  int? id;
  int? gradeId;
  int? sectionId;
  String? createdAt;
  String? updatedAt;
  Grade? grade;

  GradeSection(
      {this.id,
        this.gradeId,
        this.sectionId,
        this.createdAt,
        this.updatedAt,
        this.grade});

  GradeSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    sectionId = json['section_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['grade_id'] = this.gradeId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    return data;
  }
}

class Grade {
  int? id;
  String? nameAr;

  Grade({this.id, this.nameAr});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    return data;
  }
}