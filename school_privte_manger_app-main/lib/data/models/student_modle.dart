class StudentModle {
  String? studentId;
  String? studentFname;
  String? studentLname;
  String? studentEmail;
  String? studentPhone;
  String? studentDateCreate;
  String? studentPassword;
  String? studentNumber;
  String? studentActive;
  String? studentImage;
  String? studentVerfaicode;
  String? studentLevel;

  StudentModle(
      {this.studentId,
      this.studentFname,
      this.studentLname,
      this.studentEmail,
      this.studentPhone,
      this.studentDateCreate,
      this.studentPassword,
      this.studentNumber,
      this.studentActive,
      this.studentImage,
      this.studentVerfaicode,
      this.studentLevel});

  StudentModle.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentFname = json['student_fname'];
    studentLname = json['student_lname'];
    studentEmail = json['student_email'];
    studentPhone = json['student_phone'];
    studentDateCreate = json['student_date_create'];
    studentPassword = json['student_password'];
    studentNumber = json['student_number'];
    studentActive = json['student_active'];
    studentImage = json['student_image'];
    studentVerfaicode = json['student_verfaicode'];
    studentLevel = json['student_level'];
  }
}
