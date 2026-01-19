class ClassesTeacherModel {
	bool? success;
	List<ClassesData>? classesData;

	ClassesTeacherModel({this.success, this.classesData});

	ClassesTeacherModel.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		if (json['data'] != null) {
			classesData = <ClassesData>[];
			json['data'].forEach((v) { classesData!.add(new ClassesData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.classesData != null) {
      data['data'] = this.classesData!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ClassesData {
	int? id;
	int? classId;
	int? teacherId;
	int? sectionId;
	String? day;
	String? classTime;
	String? createdAt;
	String? updatedAt;
	ClassC? classC;
	Section? section;

	ClassesData({this.id, this.classId, this.teacherId, this.sectionId, this.day, this.classTime, this.createdAt, this.updatedAt, this.classC, this.section});

	ClassesData.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		classId = json['class_id'];
		teacherId = json['teacher_id'];
		sectionId = json['section_id'];
		day = json['day'];
		classTime = json['class_time'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classC = json['class'] != null ? new ClassC.fromJson(json['class']) : null;
		section = json['section'] != null ? new Section.fromJson(json['section']) : null;
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
		if (this.classC != null) {
      data['class'] = this.classC!.toJson();
    }
		if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
		return data;
	}
}

class ClassC {
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

	ClassC({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.grade, this.subject});

	ClassC.fromJson(Map<String, dynamic> json) {
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

class Section {
	int? id;
	String? nameAr;
	String? nameEn;
	String? createdAt;
	String? updatedAt;

	Section({this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

	Section.fromJson(Map<String, dynamic> json) {
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