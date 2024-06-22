import '../../../core/class/read_updata_delete_inser_view.dart';
import '../../../core/const/app_links.dart';

class CourData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  CourData(this.crud);
  getCours() async {
    var respones = await crud.postData(AppLinkes.coursView, {});
    return respones.fold((l) => l, (r) => r);
  }

  addCours({
    required String cours_name,
    required String cours_section,
    required String cours_price,
    required String cours_level,
  }) async {
    var respones = await crud.postData(AppLinkes.coursAdd, {
      "cours_name": cours_name,
      "cours_section": cours_section,
      "cours_price": cours_price,
      "cours_level": cours_level,
    });
    return respones.fold((l) => l, (r) => r);
  }

  editeCours({
    required String id,
    required String cours_name,
    required String cours_section,
    required String cours_price,
    required String cours_level,
  }) async {
    var respones = await crud.postData(AppLinkes.coursEdite, {
      "id": id,
      "cours_name": cours_name,
      "cours_section": cours_section,
      "cours_price": cours_price,
      "cours_level": cours_level,
    });
    return respones.fold((l) => l, (r) => r);
  }

  deleteCours({
    required String id,
  }) async {
    var respones = await crud.postData(AppLinkes.coursDelete, {
      "id": id,
    });
    return respones.fold((l) => l, (r) => r);
  }

  teacherViewCours({
    required String coursId,
  }) async {
    var respones = await crud.postData(AppLinkes.coursViewTeacher, {
      "id": coursId,
    });
    return respones.fold((l) => l, (r) => r);
  }

  studentViewCours({
    required String coursId,
  }) async {
    var respones = await crud.postData(AppLinkes.coursViewStudent, {
      "coursId": coursId,
    });
    return respones.fold((l) => l, (r) => r);
  }

  studentViewNotInCours({
    required String coursId,
  }) async {
    var respones = await crud.postData(AppLinkes.viewStudentNotInCours, {
      "coursId": coursId,
    });
    return respones.fold((l) => l, (r) => r);
  }
}
