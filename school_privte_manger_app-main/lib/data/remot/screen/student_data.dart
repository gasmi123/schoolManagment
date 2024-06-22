import 'package:admindash/core/class/read_updata_delete_inser_view.dart';
import 'package:admindash/core/const/app_links.dart';

class StudentData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  StudentData(this.crud);
  getData() async {
    var respones = await crud.postData(AppLinkes.studentView, {});
    return respones.fold((l) => l, (r) => r);
  }

  addStudent({
    required String student_fname,
    required String student_lname,
    required String student_phone,
    required String student_email,
    required String student_password,
    required String student_level,
  }) async {
    var respones = await crud.postData(AppLinkes.studentAdd, {
      "student_fname": student_fname,
      "student_lname": student_lname,
      "student_phone": student_phone,
      "student_email": student_email,
      "student_password": student_password,
      "student_level": student_level
    });
    return respones.fold((l) => l, (r) => r);
  }

  editeStudent({
    required String id,
    required String student_fname,
    required String student_lname,
    required String student_phone,
    required String student_email,
    required String student_level,
    required String student_active,
  }) async {
    var respones = await crud.postData(AppLinkes.studentEdite, {
      "id": id,
      "student_fname": student_fname,
      "student_lname": student_lname,
      "student_phone": student_phone,
      "student_email": student_email,
      "student_level": student_level,
      "student_active": student_active,
    });
    return respones.fold((l) => l, (r) => r);
  }
}
