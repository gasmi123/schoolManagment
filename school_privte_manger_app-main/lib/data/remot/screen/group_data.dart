import 'package:admindash/core/class/read_updata_delete_inser_view.dart';
import 'package:admindash/core/const/app_links.dart';

class GroupData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  GroupData(this.crud);
  getGroup({
    required String coursId,
  }) async {
    var respones = await crud.postData(AppLinkes.groupView, {
      "coursId": coursId,
    });
    return respones.fold((l) => l, (r) => r);
  }

  getStudentInGroup({required String lessonId}) async {
    var respones = await crud.postData(AppLinkes.groupViewStudent, {
      "id": lessonId,
    });
    return respones.fold((l) => l, (r) => r);
  }

  getStudentNotInGroup({required String lessonId}) async {
    var respones = await crud.postData(AppLinkes.groupViewStudentNotIn, {
      "id": lessonId,
    });
    return respones.fold((l) => l, (r) => r);
  }

  addGroup({
    required String teacherId,
    required String coursId,
    required String groupName,
  }) async {
    var respones = await crud.postData(AppLinkes.groupAdd, {
      "teacher_id": teacherId,
      "cours_id": coursId,
      "lesson_name": groupName,
    });
    return respones.fold((l) => l, (r) => r);
  }

  editeGroup({
    required String teacherId,
    required String coursId,
    required String groupName,
  }) async {
    var respones = await crud.postData(AppLinkes.groupEdite, {
      "teacher_id": teacherId,
      "cours_id": coursId,
      "lesson_name": groupName,
    });
    return respones.fold((l) => l, (r) => r);
  }

  deleteGroup({
    required String teacherId,
    required String coursId,
  }) async {
    var respones = await crud.postData(AppLinkes.groupEdite, {
      "teacher_id": teacherId,
      "cours_id": coursId,
    });
    return respones.fold((l) => l, (r) => r);
  }

  deleteStudentInGroup({
    required String group_lesson_id,
    required String group_student_id,
  }) async {
    var respones = await crud.postData(AppLinkes.groupDeleteStudentInGroup, {
      "group_lesson_id": group_lesson_id,
      "group_student_id": group_student_id,
    });
    return respones.fold((l) => l, (r) => r);
  }

  addStudentInGroup({
    required String group_lesson_id,
    required String group_student_id,
  }) async {
    var respones = await crud.postData(AppLinkes.groupAddStudentInGroup, {
      "group_lesson_id": group_lesson_id,
      "group_student_id": group_student_id,
    });
    return respones.fold((l) => l, (r) => r);
  }
}
