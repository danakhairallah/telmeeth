class BehaviorTeacherModel {
	int? id;
	int? studentId;
	int? classTeacherId;
	int? behaviorId;
	String? description;
	int? certificate;
	String? createdAt;
	String? updatedAt;
	Student? student;
	ClassTeacher? classTeacher;
	Behavior? behavior;

	BehaviorTeacherModel({this.id, this.studentId, this.classTeacherId, this.behaviorId, this.description, this.certificate, this.createdAt, this.updatedAt, this.student, this.classTeacher, this.behavior});

	BehaviorTeacherModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		studentId = json['student_id'];
		classTeacherId = json['class_teacher_id'];
		behaviorId = json['behavior_id'];
		description = json['description'];
		certificate = json['certificate'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		student = json['student'] != null ? new Student.fromJson(json['student']) : null;
		classTeacher = json['class_teacher'] != null ? new ClassTeacher.fromJson(json['class_teacher']) : null;
		behavior = json['behavior'] != null ? new Behavior.fromJson(json['behavior']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['student_id'] = this.studentId;
		data['class_teacher_id'] = this.classTeacherId;
		data['behavior_id'] = this.behaviorId;
		data['description'] = this.description;
		data['certificate'] = this.certificate;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
		if (this.classTeacher != null) {
      data['class_teacher'] = this.classTeacher!.toJson();
    }
		if (this.behavior != null) {
      data['behavior'] = this.behavior!.toJson();
    }
		return data;
	}
}

class Student {
	int? id;
	String? nameAr;
	String? nameEn;
	String? userName;
	String? gender;
	String? phoneNumber;
	String? birthDate;
	String? nationality;
	String? password;
	String? email;
	Null? imagePath;
	Null? imageUrl;
	String? aiName;
	String? transportaion;
	int? parentId;
	int? branchId;
	int? gradeSectionId;
	String? createdAt;
	String? updatedAt;
	GradeSection? gradeSection;

	Student({this.id, this.nameAr, this.nameEn, this.userName, this.gender, this.phoneNumber, this.birthDate, this.nationality, this.password, this.email, this.imagePath, this.imageUrl, this.aiName, this.transportaion, this.parentId, this.branchId, this.gradeSectionId, this.createdAt, this.updatedAt, this.gradeSection});

	Student.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nameAr = json['name_ar'];
		nameEn = json['name_en'];
		userName = json['user_name'];
		gender = json['gender'];
		phoneNumber = json['phone_number'];
		birthDate = json['birth_date'];
		nationality = json['nationality'];
		password = json['password'];
		email = json['email'];
		imagePath = json['image_path'];
		imageUrl = json['image_url'];
		aiName = json['ai_name'];
		transportaion = json['transportaion'];
		parentId = json['parent_id'];
		branchId = json['branch_id'];
		gradeSectionId = json['grade_section_id'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		gradeSection = json['grade_section'] != null ? new GradeSection.fromJson(json['grade_section']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name_ar'] = this.nameAr;
		data['name_en'] = this.nameEn;
		data['user_name'] = this.userName;
		data['gender'] = this.gender;
		data['phone_number'] = this.phoneNumber;
		data['birth_date'] = this.birthDate;
		data['nationality'] = this.nationality;
		data['password'] = this.password;
		data['email'] = this.email;
		data['image_path'] = this.imagePath;
		data['image_url'] = this.imageUrl;
		data['ai_name'] = this.aiName;
		data['transportaion'] = this.transportaion;
		data['parent_id'] = this.parentId;
		data['branch_id'] = this.branchId;
		data['grade_section_id'] = this.gradeSectionId;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
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
	Section? section;
	Section? grade;

	GradeSection({this.id, this.gradeId, this.sectionId, this.createdAt, this.updatedAt, this.section, this.grade});

	GradeSection.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		gradeId = json['grade_id'];
		sectionId = json['section_id'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		section = json['section'] != null ? new Section.fromJson(json['section']) : null;
		grade = json['grade'] != null ? new Section.fromJson(json['grade']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['grade_id'] = this.gradeId;
		data['section_id'] = this.sectionId;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
		if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
		return data;
	}
}

class Section {
	int? id;
	String? nameAr;
	String? nameEn;

	Section({this.id, this.nameAr, this.nameEn});

	Section.fromJson(Map<String, dynamic> json) {
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
	ClassB? classB;

	ClassTeacher({this.id, this.classId, this.teacherId, this.sectionId, this.day, this.classTime, this.createdAt, this.updatedAt, this.classB});

	ClassTeacher.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		classId = json['class_id'];
		teacherId = json['teacher_id'];
		sectionId = json['section_id'];
		day = json['day'];
		classTime = json['class_time'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classB = json['class'] != null ? new ClassB.fromJson(json['class']) : null;
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
		if (this.classB != null) {
      data['class'] = this.classB!.toJson();
    }
		return data;
	}
}

class ClassB {
	int? id;
	int? curriculumId;
	int? gradeId;
	int? subjectId;
	Null? imagePath;
	Null? imageUrl;
	String? createdAt;
	String? updatedAt;
	Section? subject;

	ClassB({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.subject});

	ClassB.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		curriculumId = json['curriculum_id'];
		gradeId = json['grade_id'];
		subjectId = json['subject_id'];
		imagePath = json['image_path'];
		imageUrl = json['image_url'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		subject = json['subject'] != null ? new Section.fromJson(json['subject']) : null;
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
		if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
		return data;
	}
}

class Behavior {
	int? id;
	String? behavior;
	int? score;
	String? type;
	String? createdAt;
	String? updatedAt;

	Behavior({this.id, this.behavior, this.score, this.type, this.createdAt, this.updatedAt});

	Behavior.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		behavior = json['behavior'];
		score = json['score'];
		type = json['type'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['behavior'] = this.behavior;
		data['score'] = this.score;
		data['type'] = this.type;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}

