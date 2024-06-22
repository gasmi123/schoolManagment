class GradMode {
  String? studentLevel;
  String? totalradNumber;

  GradMode({this.studentLevel, this.totalradNumber});

  GradMode.fromJson(Map<String, dynamic> json) {
    studentLevel = json['student_level'];
    totalradNumber = json['totalradNumber'];
  }
}
