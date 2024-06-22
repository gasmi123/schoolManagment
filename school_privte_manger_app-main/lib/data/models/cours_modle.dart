class CoursModel {
  String? coursId;
  String? coursName;
  String? coursSection;
  String? coursPrice;
  String? coursLevel;
  String? countTeacher;
  String? countGroup;
  String? countStudent;

  CoursModel(
      {this.coursId,
      this.coursName,
      this.coursSection,
      this.coursPrice,
      this.coursLevel,
      this.countTeacher,
      this.countGroup,
      this.countStudent});

  CoursModel.fromJson(Map<String, dynamic> json) {
    coursId = json['cours_id'];
    coursName = json['cours_name'];
    coursSection = json['cours_section'];
    coursPrice = json['cours_price'];
    coursLevel = json['cours_level'];
    countTeacher = json['countTeacher'];
    countGroup = json['countGroup'];
    countStudent = json['countStudent'];
  }
}
