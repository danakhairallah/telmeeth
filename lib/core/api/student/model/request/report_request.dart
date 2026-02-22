class AiReportRequest {
  final String grades;
  final int studyHours;
  final String mood;
  final String stress;

  AiReportRequest({
    required this.grades,
    required this.studyHours,
    required this.mood,
    required this.stress,
  });

  Map<String, dynamic> toJson() {
    return {
      "grades": grades,
      "study_hours": studyHours,
      "mood": mood,
      "stress": stress,
    };
  }
}
