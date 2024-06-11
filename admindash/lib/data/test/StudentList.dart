//  Creating a list of two StudentModel instances
import 'package:admindash/data/models/studentsmodel.dart';

List<StudentModel> students = [
  StudentModel(
    studentId: '001',
    firstName: 'John',
    lastName: 'Doe',
    email: 'johndoe@example.com',
    phone: '+1234567890',
    dateCreate: '2022-01-01',
    number: 'A001',
    active: 'Yes',
    image: 'assets/images/male.png',
    verificationCode: 'abc123',
    level: 'Freshman',
  ),
  StudentModel(
    studentId: '002',
    firstName: 'Jane',
    lastName: 'Doe',
    email: 'janedoe@example.com',
    phone: '+0987654321',
    dateCreate: '2022-02-01',
    number: 'A002',
    active: 'No',
    image: 'assets/images/male.png',
    verificationCode: 'xyz456',
    level: 'Sophomore',
  )
];
