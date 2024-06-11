// import 'package:managmentsh/core/class/read_updata_delete_inser_view.dart';
// import 'package:managmentsh/core/const/app_links.dart';

// class CourData {
//   ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
//   CourData(this.crud);
//   getCours(String id) async {
//     var respones = await crud.postData(AppLinkes.courView, {"studentId": id});
//     return respones.fold((l) => l, (r) => r);
//   }

//   getToutarules(String coursId) async {
//     var respones =
//         await crud.postData(AppLinkes.courTotarulesView, {"id": coursId});
//     return respones.fold((l) => l, (r) => r);
//   }

//   getCoursNotOver(String id) async {
//     var respones =
//         await crud.postData(AppLinkes.courNotOverView, {"studentId": id});
//     return respones.fold((l) => l, (r) => r);
//   }

//   getCoursOver(String id) async {
//     var respones =
//         await crud.postData(AppLinkes.courOverView, {"studentId": id});
//     return respones.fold((l) => l, (r) => r);
//   }
// }
