import 'package:admindash/data/models/AllGroups.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  GetALlCours() {}

  GetNumberStudent() {}

  // GetFrom database
  int TotalStudentNuber = 720;
  List<GradModel> demoMyFiles = [
    GradModel(
      title: " First hignt schoole",
      totalradNumber: "20",
    ),
    GradModel(
      title: " second hignt schoole",
      totalradNumber: "300",
    ),
    GradModel(
      title: " third hignt schoole",
      totalradNumber: "400",
    ),
    GradModel(
      title: " forth seconder schhole",
      totalradNumber: "100",
    ),
  ];
}
