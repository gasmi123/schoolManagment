import 'package:admindash/core/class/read_updata_delete_inser_view.dart';
import 'package:admindash/core/const/app_links.dart';

class TeacherData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  TeacherData(this.crud);
  getData() async {
    var respones = await crud.postData(AppLinkes.teacherView, {});
    return respones.fold((l) => l, (r) => r);
  }

  deleteTeacher(String id) async {
    var respones = await crud.postData(AppLinkes.teacherDelete, {"id": id});
    return respones.fold((l) => l, (r) => r);
  }

  addTeacher({
    required String teacher_fname,
    required String teacher_lname,
    required String teacher_phone,
    required String teacher_email,
    required String teacher_salary,
    required String teacher_password,
    required String teacher_model_name,
  }) async {
    var respones = await crud.postData(AppLinkes.teacherAdd, {
      "teacher_fname": teacher_fname,
      "teacher_lname": teacher_lname,
      "teacher_phone": teacher_phone,
      "teacher_email": teacher_email,
      "teacher_salary": teacher_salary,
      "teacher_password": teacher_password,
      "teacher_model_name": teacher_model_name,
    });
    return respones.fold((l) => l, (r) => r);
  }

  editeTeacher({
    required String id,
    required String teacher_fname,
    required String teacher_lname,
    required String teacher_phone,
    required String teacher_email,
    required String teacher_salary,
    required String teacher_password,
    required String teacher_model_name,
  }) async {
    var respones = await crud.postData(AppLinkes.teacherEdite, {
      "id": id,
      "teacher_fname": teacher_fname,
      "teacher_lname": teacher_lname,
      "teacher_phone": teacher_phone,
      "teacher_email": teacher_email,
      "teacher_salary": teacher_salary,
      "teacher_password": teacher_password,
      "teacher_model_name": teacher_model_name,
    });
    return respones.fold((l) => l, (r) => r);
  }
}
