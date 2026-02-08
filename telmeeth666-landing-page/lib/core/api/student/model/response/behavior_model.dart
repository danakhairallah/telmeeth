class BehaviorResponse {
  int? studentId;
  String? studentName;
  int? totalScore;
  List<Behavior>? behaviors;

  BehaviorResponse({
    this.studentId,
    this.studentName,
    this.totalScore,
    this.behaviors,
  });

  factory BehaviorResponse.fromJson(Map<String, dynamic> json) {
    return BehaviorResponse(
      studentId: json['student_id'],
      studentName: json['student_name'],
      totalScore: json['total_score'],
      behaviors: json['behaviors'] != null
          ? (json['behaviors'] as List)
          .map((e) => Behavior.fromJson(e))
          .toList()
          : [],
    );
  }
}

class Behavior {
  int? id;
  String? title;
  String? description;
  String? type; // positive | negative | neutral
  int? score;
  String? createdAt;

  Behavior({
    this.id,
    this.title,
    this.description,
    this.type,
    this.score,
    this.createdAt,
  });

  factory Behavior.fromJson(Map<String, dynamic> json) {
    return Behavior(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      score: json['score'],
      createdAt: json['created_at'],
    );
  }
}
