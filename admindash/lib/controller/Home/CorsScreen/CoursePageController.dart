import 'package:get/get.dart';
import 'package:admindash/data/test/courseList.dart';

class CoursePgeController extends GetxController {
  getAllCourse() {}

  var searchQuery = "".obs;
  var results = courseslist.obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    results.value = query.isEmpty
        ? courseslist
        : courseslist
            .where((course) =>
                course.tutorialsTitle!
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                course.tutorialsSubtitle!
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
  }
}
