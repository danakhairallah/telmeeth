class StudyPlanRequest {
  final String title;
  final List<String> subjects;
  final int availableHoursPerDay;
  final List<String> daysOff;
  final String goal;
  final String preferredStudyTime;
  final String semesterStart;
  final String semesterEnd;

  StudyPlanRequest({
    required this.title,
    required this.subjects,
    required this.availableHoursPerDay,
    required this.daysOff,
    required this.goal,
    required this.preferredStudyTime,
    required this.semesterStart,
    required this.semesterEnd,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subjects": subjects,
      "available_hours_per_day": availableHoursPerDay,
      "days_off": daysOff,
      "goal": goal,
      "preferred_study_time": preferredStudyTime,
      "semester_dates": {
        "start": semesterStart,
        "end": semesterEnd,
      }
    };
  }
}
