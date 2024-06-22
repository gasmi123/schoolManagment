class TeacherModle {
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
  String? countGroup;

  TeacherModle(
      {this.teacherId,
      this.teacherFname,
      this.teacherLname,
      this.teacherPhone,
      this.teacherEmail,
      this.teacherDateCreate,
      this.teacherPassword,
      this.teacherImage,
      this.teacherModelName,
      this.teacherSalary,
      this.teacherNumber,
      this.countGroup});

  TeacherModle.fromJson(Map<String, dynamic> json) {
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
    countGroup = json['countGroup'];
  }
}
