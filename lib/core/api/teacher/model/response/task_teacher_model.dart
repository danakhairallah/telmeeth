class TaskTeacherModel {
	bool? success;
	List<TaskDataT>? taskDataT;

	TaskTeacherModel({this.success, this.taskDataT});

	TaskTeacherModel.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		if (json['data'] != null) {
			taskDataT = <TaskDataT>[];
			json['data'].forEach((v) { taskDataT!.add(new TaskDataT.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.taskDataT != null) {
      data['data'] = this.taskDataT!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TaskDataT {
	int? id;
	int? classTeacherId;
	int? lessonId;
	String? type;
	String? title;
	String? description;
	String? deadline;
	int? mark;
	String? createdAt;
	String? updatedAt;
	Lesson? lesson;
	ClassTeacher? classTeacher;

	TaskDataT({this.id, this.classTeacherId, this.lessonId, this.type, this.title, this.description, this.deadline, this.mark, this.createdAt, this.updatedAt, this.lesson, this.classTeacher});

	TaskDataT.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		classTeacherId = json['class_teacher_id'];
		lessonId = json['lesson_id'];
		type = json['type'];
		title = json['title'];
		description = json['description'];
		deadline = json['deadline'];
		mark = json['mark'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		lesson = json['lesson'] != null ? new Lesson.fromJson(json['lesson']) : null;
		classTeacher = json['class_teacher'] != null ? new ClassTeacher.fromJson(json['class_teacher']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['class_teacher_id'] = this.classTeacherId;
		data['lesson_id'] = this.lessonId;
		data['type'] = this.type;
		data['title'] = this.title;
		data['description'] = this.description;
		data['deadline'] = this.deadline;
		data['mark'] = this.mark;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.lesson != null) {
      data['lesson'] = this.lesson!.toJson();
    }
		if (this.classTeacher != null) {
      data['class_teacher'] = this.classTeacher!.toJson();
    }
		return data;
	}
}

class Lesson {
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
	Unit? unit;

	Lesson({this.id, this.name, this.filePath, this.fileUrl, this.imagePath, this.imageUrl, this.summary, this.outcomes, this.unitId, this.createdAt, this.updatedAt, this.unit});

	Lesson.fromJson(Map<String, dynamic> json) {
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
		unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
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
		if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
		return data;
	}
}

class Unit {
	int? id;
	String? name;
	int? classId;
	String? semester;
	String? createdAt;
	String? updatedAt;
	ClassTa? classTa;

	Unit({this.id, this.name, this.classId, this.semester, this.createdAt, this.updatedAt, this.classTa});

	Unit.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		classId = json['class_id'];
		semester = json['semester'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classTa = json['class'] != null ? new ClassTa.fromJson(json['class']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['class_id'] = this.classId;
		data['semester'] = this.semester;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.classTa != null) {
      data['class'] = this.classTa!.toJson();
    }
		return data;
	}
}

class ClassTa {
	int? id;
	int? curriculumId;
	int? gradeId;
	int? subjectId;
	String? imagePath;
	String? imageUrl;
	String? createdAt;
	String? updatedAt;
	Grade? grade;
	Grade? subject;

	ClassTa({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.grade, this.subject});

	ClassTa.fromJson(Map<String, dynamic> json) {
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

class ClassTeacher {
	int? id;
	int? classId;
	int? teacherId;
	int? sectionId;
	String? day;
	String? classTime;
	String? createdAt;
	String? updatedAt;

	ClassTeacher({this.id, this.classId, this.teacherId, this.sectionId, this.day, this.classTime, this.createdAt, this.updatedAt});

	ClassTeacher.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		classId = json['class_id'];
		teacherId = json['teacher_id'];
		sectionId = json['section_id'];
		day = json['day'];
		classTime = json['class_time'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
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
		return data;
	}
}