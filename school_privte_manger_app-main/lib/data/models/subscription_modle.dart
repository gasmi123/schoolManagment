class SubscriptionModle {
  String? subscriptionId;
  String? subscriptionCount;
  String? subscriptionDateCreat;
  String? subscriptionExpiryDate;
  String? subscriptionPrise;
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
  String? coursId;
  String? coursName;
  String? coursSection;
  String? coursPrice;
  String? coursLevel;

  SubscriptionModle(
      {this.subscriptionId,
      this.subscriptionCount,
      this.subscriptionDateCreat,
      this.subscriptionExpiryDate,
      this.subscriptionPrise,
      this.studentId,
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
      this.coursId,
      this.coursName,
      this.coursSection,
      this.coursPrice,
      this.coursLevel});

  SubscriptionModle.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    subscriptionCount = json['subscription_count'];
    subscriptionDateCreat = json['subscription_date_creat'];
    subscriptionExpiryDate = json['subscription_expiry_date'];
    subscriptionPrise = json['subscription_prise'];
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
    coursId = json['cours_id'];
    coursName = json['cours_name'];
    coursSection = json['cours_section'];
    coursPrice = json['cours_price'];
    coursLevel = json['cours_level'];
  }
}
