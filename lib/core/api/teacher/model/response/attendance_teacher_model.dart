class AttendanceTeacherModel {
	bool? success;
	String? message;
	List<TeacherAttendanceData>? teacherAttendanceData;

	AttendanceTeacherModel({this.success, this.message, this.teacherAttendanceData});

	AttendanceTeacherModel.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		message = json['message'];
		if (json['data'] != null) {
			teacherAttendanceData = <TeacherAttendanceData>[];
			json['data'].forEach((v) { teacherAttendanceData!.add(new TeacherAttendanceData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		data['message'] = this.message;
		if (this.teacherAttendanceData != null) {
      data['data'] = this.teacherAttendanceData!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TeacherAttendanceData {
	int? id;
	int? studentId;
	String? date;
	int? lessonId;
	int? teacherId;
	int? isExcused;
	String? notes;
	String? createdAt;
	String? updatedAt;
	Student? student;
	Lesson? lesson;

	TeacherAttendanceData({this.id, this.studentId, this.date, this.lessonId, this.teacherId, this.isExcused, this.notes, this.createdAt, this.updatedAt, this.student, this.lesson});

	TeacherAttendanceData.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		studentId = json['student_id'];
		date = json['date'];
		lessonId = json['lesson_id'];
		teacherId = json['teacher_id'];
		isExcused = json['is_excused'];
		notes = json['notes'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		student = json['student'] != null ? new Student.fromJson(json['student']) : null;
		lesson = json['lesson'] != null ? new Lesson.fromJson(json['lesson']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['student_id'] = this.studentId;
		data['date'] = this.date;
		data['lesson_id'] = this.lessonId;
		data['teacher_id'] = this.teacherId;
		data['is_excused'] = this.isExcused;
		data['notes'] = this.notes;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
		if (this.lesson != null) {
      data['lesson'] = this.lesson!.toJson();
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
	Grade? grade;
	Section? section;

	GradeSection({this.id, this.gradeId, this.sectionId, this.createdAt, this.updatedAt, this.grade, this.section});

	GradeSection.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		gradeId = json['grade_id'];
		sectionId = json['section_id'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
		section = json['section'] != null ? new Section.fromJson(json['section']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['grade_id'] = this.gradeId;
		data['section_id'] = this.sectionId;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
		if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
		return data;
	}
}

class Grade {
	int? id;
	String? nameAr;
	String? nameEn;
	String? level;
	String? createdAt;
	String? updatedAt;

	Grade({this.id, this.nameAr, this.nameEn, this.level, this.createdAt, this.updatedAt});

	Grade.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nameAr = json['name_ar'];
		nameEn = json['name_en'];
		level = json['level'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name_ar'] = this.nameAr;
		data['name_en'] = this.nameEn;
		data['level'] = this.level;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
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
	ClassT? classT;

	Unit({this.id, this.name, this.classId, this.semester, this.createdAt, this.updatedAt, this.classT});

	Unit.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		classId = json['class_id'];
		semester = json['semester'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		classT = json['class'] != null ? new ClassT.fromJson(json['class']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['class_id'] = this.classId;
		data['semester'] = this.semester;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.classT != null) {
      data['class'] = this.classT!.toJson();
    }
		return data;
	}
}

class ClassT {
	int? id;
	int? curriculumId;
	int? gradeId;
	int? subjectId;
	Null? imagePath;
	Null? imageUrl;
	String? createdAt;
	String? updatedAt;
	Section? subject;
	Grade? grade;

	ClassT({this.id, this.curriculumId, this.gradeId, this.subjectId, this.imagePath, this.imageUrl, this.createdAt, this.updatedAt, this.subject, this.grade});

	ClassT.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		curriculumId = json['curriculum_id'];
		gradeId = json['grade_id'];
		subjectId = json['subject_id'];
		imagePath = json['image_path'];
		imageUrl = json['image_url'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		subject = json['subject'] != null ? new Section.fromJson(json['subject']) : null;
		grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
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
		if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
		return data;
	}
}