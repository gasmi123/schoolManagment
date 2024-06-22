import 'package:get/get.dart';

class AppType {
  static const String user = 'user';
  static const String email = 'email';
  static const String pasowred = 'pasword';
  static const String phone = 'phone';
  static const String number = 'number';
}

String? validatInput(
    {required int min,
    required int max,
    required String typ,
    required String val}) {
  if (val.isNotEmpty) {
    if (typ == AppType.email && !GetUtils.isEmail(val)) {
      return "the email is not validet";
    }
    if (typ == AppType.user && !GetUtils.isUsername(val)) {
      return "the name is not validet";
    }
    if (typ == AppType.phone && !GetUtils.isPhoneNumber(val)) {
      return "the phone is not validet";
    }

    //

    if (val.length < min) {
      return "min";
    } else if (val.length > max) {
      return "max";
    }
  }
  if (val.isEmpty) {
    return "can't not empty";
  }

  return null;
}
