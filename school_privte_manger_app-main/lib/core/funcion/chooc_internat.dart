import 'dart:async';
import 'dart:io';

Future<bool> choocInternat() async {
  try {
    var res = await InternetAddress.lookup("google.com");
    if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      throw Exception('هناك خطأ في الدالة'); // رمي استثناء في حالة وجود خطأ
    }
  } on SocketException catch (_) {
    return false;
  }
}
