import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void saveImage(String image) async {
  final response = await get(Uri.parse(image));
  final result = await ImageGallerySaver.saveImage(
    Uint8List.fromList(response.bodyBytes),
  );

  if (result != null) {
    // تم حفظ الصورة بنجاح.
    Get.rawSnackbar(title: "132".tr, message: "148".tr);
  } else {
    // حدث خطأ أثناء حفظ الصورة.
    Get.rawSnackbar(title: "142".tr, message: '149'.tr);
  }
}
