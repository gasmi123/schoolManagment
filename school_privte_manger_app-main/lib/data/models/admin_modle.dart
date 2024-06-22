class AdminModle {
  String? adminId;
  String? adminFname;
  String? adminLname;
  String? adminEmail;
  String? adminPhone;
  String? adminDateCreate;
  String? adminPassword;
  String? adminImage;
  String? adminVerfication;
  String? adminLevel;

  AdminModle(
      {this.adminId,
      this.adminFname,
      this.adminLname,
      this.adminEmail,
      this.adminPhone,
      this.adminDateCreate,
      this.adminPassword,
      this.adminImage,
      this.adminVerfication,
      this.adminLevel});

  AdminModle.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'];
    adminFname = json['admin_fname'];
    adminLname = json['admin_lname'];
    adminEmail = json['admin_email'];
    adminPhone = json['admin_phone'];
    adminDateCreate = json['admin_date_create'];
    adminPassword = json['admin_password'];
    adminImage = json['admin_image'];
    adminVerfication = json['admin_verfication'];
    adminLevel = json['admin_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['admin_fname'] = this.adminFname;
    data['admin_lname'] = this.adminLname;
    data['admin_email'] = this.adminEmail;
    data['admin_phone'] = this.adminPhone;
    data['admin_date_create'] = this.adminDateCreate;
    data['admin_password'] = this.adminPassword;
    data['admin_image'] = this.adminImage;
    data['admin_verfication'] = this.adminVerfication;
    data['admin_level'] = this.adminLevel;
    return data;
  }

  @override
  String toString() {
    return 'AdminModel{adminId: $adminId, adminFname: $adminFname, adminLname: $adminLname, adminEmail: $adminEmail, adminPhone: $adminPhone, adminDateCreate: $adminDateCreate, adminPassword: $adminPassword, adminImage: $adminImage, adminVerfication: $adminVerfication, adminLevel: $adminLevel}';
  }
}
