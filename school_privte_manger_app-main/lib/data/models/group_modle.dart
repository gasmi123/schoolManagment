class GroupModle {
  String? lessonName;
  String? lessonId;
  String? lessonDateCreate;
  String? teacherId;
  String? teacherFname;
  String? teacherLname;
  String? teacherPhone;
  String? teacherEmail;
  String? teacherDateCreate;
  String? teacherPassword;
  String? teacherImage;
  String? teacherModelName;
  String? teacherSalary;
  String? teacherNumber;

  GroupModle(
      {this.lessonName,
      this.lessonId,
      this.lessonDateCreate,
      this.teacherId,
      this.teacherFname,
      this.teacherLname,
      this.teacherPhone,
      this.teacherEmail,
      this.teacherDateCreate,
      this.teacherPassword,
      this.teacherImage,
      this.teacherModelName,
      this.teacherSalary,
      this.teacherNumber});

  GroupModle.fromJson(Map<String, dynamic> json) {
    lessonName = json['lesson_name'];
    lessonId = json['lesson_id'];
    lessonDateCreate = json['lesson_date_create'];
    teacherId = json['teacher_id'];
    teacherFname = json['teacher_fname'];
    teacherLname = json['teacher_lname'];
    teacherPhone = json['teacher_phone'];
    teacherEmail = json['teacher_email'];
    teacherDateCreate = json['teacher_date_create'];
    teacherPassword = json['teacher_password'];
    teacherImage = json['teacher_image'];
    teacherModelName = json['teacher_model_name'];
    teacherSalary = json['teacher_salary'];
    teacherNumber = json['teacher_number'];
  }
}
