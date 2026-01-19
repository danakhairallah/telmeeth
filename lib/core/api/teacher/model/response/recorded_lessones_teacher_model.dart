class RecordedLessonesTeacherModel {
	bool? success;
	List<RecordedDataT>? data;

	RecordedLessonesTeacherModel({this.success, this.data});

	RecordedLessonesTeacherModel.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		if (json['data'] != null) {
			data = <RecordedDataT>[];
			json['data'].forEach((v) { data!.add(new RecordedDataT.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class RecordedDataT {
	int? id;
	int? teacherId;
	int? lessonId;
	int? sectionId;
	String? title;
	String? videoPath;
	String? videoUrl;
	String? imageUrl;
	String? imagePath;
	String? description;
	String? createdAt;
	String? updatedAt;
	Lesson? lesson;
	Grade? sections;

	RecordedDataT({this.id, this.teacherId, this.lessonId, this.sectionId, this.title, this.videoPath, this.videoUrl, this.imageUrl, this.imagePath, this.description, this.createdAt, this.updatedAt, this.lesson, this.sections});

	RecordedDataT.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		teacherId = json['teacher_id'];
		lessonId = json['lesson_id'];
		sectionId = json['section_id'];
		title = json['title'];
		videoPath = json['video_path'];
		videoUrl = json['video_url'];
		imageUrl = json['image_url'];
		imagePath = json['image_path'];
		description = json['description'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		lesson = json['lesson'] != null ? new Lesson.fromJson(json['lesson']) : null;
		sections = json['sections'] != null ? new Grade.fromJson(json['sections']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['teacher_id'] = this.teacherId;
		data['lesson_id'] = this.lessonId;
		data['section_id'] = this.sectionId;
		data['title'] = this.title;
		data['video_path'] = this.videoPath;
		data['video_url'] = this.videoUrl;
		data['image_url'] = this.imageUrl;
		data['image_path'] = this.imagePath;
		data['description'] = this.description;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.lesson != null) {
      data['lesson'] = this.lesson!.toJson();
    }
		if (this.sections != null) {
      data['sections'] = this.sections!.toJson();
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
	ClassR? classR;

	Unit({this.id, this.name, this.classId, this.semester, this.createdAt, this.updatedAt, this.classR});

	Unit.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		classId = json['class_id'];
		semester = json['semester'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classR = json['class'] != null ? new ClassR.fromJson(json['class']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['class_id'] = this.classId;
		data['semester'] = this.semester;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.classR != null) {
      data['class'] = this.classR!.toJson();
    }
		return data;
	}
}

class ClassR {
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

	ClassR({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.grade, this.subject});

	ClassR.fromJson(Map<String, dynamic> json) {
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

