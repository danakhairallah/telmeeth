class TeacherExamModel {
	bool? success;
	List<ExamDataT>? examData;

	TeacherExamModel({this.success, this.examData});

	TeacherExamModel.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		if (json['data'] != null) {
			examData = <ExamDataT>[];
			json['data'].forEach((v) { examData!.add(new ExamDataT.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.examData != null) {
      data['data'] = this.examData!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ExamDataT {
	int? id;
	int? classTeacherId;
	String? dateTime;
	int? mark;
	int? duration;
	String? title;
	String? description;
	String? type;
	String? createdAt;
	String? updatedAt;
	classE? classTeacher;
	List<MultipleChoiceQuestions>? multipleChoiceQuestions;
	List<EssayQuestions>? essayQuestions;

	ExamDataT({this.id, this.classTeacherId, this.dateTime, this.mark, this.duration, this.title, this.description, this.type, this.createdAt, this.updatedAt, this.classTeacher, this.multipleChoiceQuestions, this.essayQuestions});

	ExamDataT.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		classTeacherId = json['class_teacher_id'];
		dateTime = json['date_time'];
		mark = json['mark'];
		duration = json['duration'];
		title = json['title'];
		description = json['description'];
		type = json['type'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classTeacher = json['class_teacher'] != null ? new classE.fromJson(json['class_teacher']) : null;
		if (json['multiple_choice_questions'] != null) {
			multipleChoiceQuestions = <MultipleChoiceQuestions>[];
			json['multiple_choice_questions'].forEach((v) { multipleChoiceQuestions!.add(new MultipleChoiceQuestions.fromJson(v)); });
		}
		if (json['essay_questions'] != null) {
			essayQuestions = <EssayQuestions>[];
			json['essay_questions'].forEach((v) { essayQuestions!.add(new EssayQuestions.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['class_teacher_id'] = this.classTeacherId;
		data['date_time'] = this.dateTime;
		data['mark'] = this.mark;
		data['duration'] = this.duration;
		data['title'] = this.title;
		data['description'] = this.description;
		data['type'] = this.type;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.classTeacher != null) {
      data['class_teacher'] = this.classTeacher!.toJson();
    }
		if (this.multipleChoiceQuestions != null) {
      data['multiple_choice_questions'] = this.multipleChoiceQuestions!.map((v) => v.toJson()).toList();
    }
		if (this.essayQuestions != null) {
      data['essay_questions'] = this.essayQuestions!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class classE {
	int? id;
	int? classId;
	int? teacherId;
	int? sectionId;
	String? day;
	String? classTime;
	String? createdAt;
	String? updatedAt;
	ClassE? classesE;

	classE({this.id, this.classId, this.teacherId, this.sectionId, this.day, this.classTime, this.createdAt, this.updatedAt, this.classesE});

	classE.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		classId = json['class_id'];
		teacherId = json['teacher_id'];
		sectionId = json['section_id'];
		day = json['day'];
		classTime = json['class_time'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classesE = json['class'] != null ? new ClassE.fromJson(json['class']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['class_id'] = this.classId;
		data['teacher_id'] = this.teacherId;
		data['section_id'] = this.sectionId;
		data['day'] = this.day;
		data['class_time'] = this.classTime;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.classesE != null) {
      data['class'] = this.classesE!.toJson();
    }
		return data;
	}
}

class ClassE {
	int? id;
	int? curriculumId;
	int? gradeId;
	int? subjectId;
	Null? imagePath;
	Null? imageUrl;
	String? createdAt;
	String? updatedAt;
	Grade? grade;
	Grade? subject;

	ClassE({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.grade, this.subject});

	ClassE.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		curriculumId = json['curriculum_id'];
		gradeId = json['grade_id'];
		subjectId = json['subject_id'];
		imagePath = json['image_path'];
		imageUrl = json['image_url'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
		subject = json['subject'] != null ? new Grade.fromJson(json['subject']) : null;
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
		if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
		if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
		return data;
	}
}

class Grade {
	int? id;
	String? nameAr;
	String? nameEn;

	Grade({this.id, this.nameAr, this.nameEn});

	Grade.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nameAr = json['name_ar'];
		nameEn = json['name_en'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name_ar'] = this.nameAr;
		data['name_en'] = this.nameEn;
		return data;
	}
}

class MultipleChoiceQuestions {
	int? id;
	int? examId;
	String? question;
	List<String>? options;
	String? correctAnswer;
	int? mark;
	Null? imagePath;
	Null? imageUrl;
	String? createdAt;
	String? updatedAt;

	MultipleChoiceQuestions({this.id, this.examId, this.question, this.options, this.correctAnswer, this.mark, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt});

	MultipleChoiceQuestions.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		examId = json['exam_id'];
		question = json['question'];
		options = json['options'].cast<String>();
		correctAnswer = json['correct_answer'];
		mark = json['mark'];
		imagePath = json['image_path'];
		imageUrl = json['image_url'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['exam_id'] = this.examId;
		data['question'] = this.question;
		data['options'] = this.options;
		data['correct_answer'] = this.correctAnswer;
		data['mark'] = this.mark;
		data['image_path'] = this.imagePath;
		data['image_url'] = this.imageUrl;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}

class EssayQuestions {
	int? id;
	int? examId;
	String? question;
	String? hint;
	int? mark;
	Null? imagePath;
	Null? imageUrl;
	String? createdAt;
	String? updatedAt;

	EssayQuestions({this.id, this.examId, this.question, this.hint, this.mark, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt});

	EssayQuestions.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		examId = json['exam_id'];
		question = json['question'];
		hint = json['hint'];
		mark = json['mark'];
		imagePath = json['image_path'];
		imageUrl = json['image_url'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['exam_id'] = this.examId;
		data['question'] = this.question;
		data['hint'] = this.hint;
		data['mark'] = this.mark;
		data['image_path'] = this.imagePath;
		data['image_url'] = this.imageUrl;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}