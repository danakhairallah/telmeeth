class StreakUpdateModel {
  int? id;
  int? studentId;
  String? date;
  int? streak;
  int? maxStreak;
  int? restoresUsed;
  int? monthlyStreakComplete;
  bool? penaltyApplied;
  String? createdAt;
  String? updatedAt;

  StreakUpdateModel(
      {this.id,
        this.studentId,
        this.date,
        this.streak,
        this.maxStreak,
        this.restoresUsed,
        this.monthlyStreakComplete,
        this.penaltyApplied,
        this.createdAt,
        this.updatedAt});

  StreakUpdateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    date = json['date'];
    streak = json['streak'];
    maxStreak = json['max_streak'];
    restoresUsed = json['restores_used'];
    monthlyStreakComplete = json['monthly_streak_complete'];
    penaltyApplied = json['penalty_applied'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['date'] = this.date;
    data['streak'] = this.streak;
    data['max_streak'] = this.maxStreak;
    data['restores_used'] = this.restoresUsed;
    data['monthly_streak_complete'] = this.monthlyStreakComplete;
    data['penalty_applied'] = this.penaltyApplied;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}