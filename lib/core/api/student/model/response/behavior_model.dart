class BehaviorResponse {
  int? studentId;
  String? studentNameAr;
  String? studentNameEn;
  int? totalScore;
  List<Behavior>? behaviors;

  BehaviorResponse({
    this.studentId,
    this.studentNameAr,
    this.studentNameEn,
    this.totalScore,
    this.behaviors,
  });

  factory BehaviorResponse.fromJson(Map<String, dynamic> json) {
    final behaviorsJson = json['behaviors'];

    return BehaviorResponse(
      studentId: json['student_id'],
      studentNameAr: json['student_name_ar'],
      studentNameEn: json['student_name_en'],
      totalScore: json['total_score'],
      behaviors: behaviorsJson != null && behaviorsJson is List
          ? behaviorsJson.map((e) => Behavior.fromJson(e)).toList()
          : [],
    );
  }
}

class Behavior {
  int? id;
  String? behaviorName;
  int? score;
  String? description;
  String? teacherNameAr;
  String? teacherNameEn;
  String? certificateTextAr;
  String? certificateTextEn;

  Behavior({
    this.id,
    this.behaviorName,
    this.score,
    this.description,
    this.teacherNameAr,
    this.teacherNameEn,
    this.certificateTextAr,
    this.certificateTextEn,
  });

  factory Behavior.fromJson(Map<String, dynamic> json) {
    return Behavior(
      id: json['id'],
      behaviorName: json['behavior_name'],
      score: json['score'],
      description: json['description'],
      teacherNameAr: json['teacher_name_ar'],
      teacherNameEn: json['teacher_name_en'],
      certificateTextAr: json['certificate_text_ar'],
      certificateTextEn: json['certificate_text_en'],
    );
  }
}
