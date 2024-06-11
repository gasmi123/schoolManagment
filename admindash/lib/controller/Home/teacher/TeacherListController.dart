import 'package:admindash/data/models/TeacherModel.dart';
import 'package:get/get.dart';

class TeacherListController extends GetxController {
  List<Teacher> teachers = [
    Teacher(
        firstName: 'Gasmi',
        lastName: 'aymen',
        dateOfEntry: DateTime(2020, 1, 15).toString(),
        module: 'Mathematics',
        numberOfGroups: 3,
        email: 'mounir@gmail.com',
        phone: '0665645445',
        salary: '20000'),
    Teacher(
        firstName: 'AbdelAlie',
        lastName: 'Backor',
        dateOfEntry: DateTime(2020, 1, 15).toString(),
        module: 'Physics',
        numberOfGroups: 4,
        email: 'mounir@gmail.com',
        phone: '0665645445',
        salary: '20000'),
    Teacher(
        firstName: 'monir',
        lastName: 'islam',
        dateOfEntry: DateTime(2020, 1, 15).toString(),
        module: 'Chemistry',
        numberOfGroups: 2,
        email: 'mounir@gmail.com',
        phone: '0665645445',
        salary: '20000'),
    Teacher(
        firstName: 'monir',
        lastName: 'islam',
        dateOfEntry: DateTime(2019, 3, 20).toString(),
        module: 'Chemistry',
        numberOfGroups: 2,
        email: 'mounir@gmail.com',
        phone: '0665645445',
        salary: '20000'),
  ];

  getTecherList() {}
  void deleteTeacher(int index) {}
}
