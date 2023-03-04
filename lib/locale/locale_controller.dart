import 'dart:ui';

import 'package:get/get.dart';

class MyLocaleController extends GetxController{

  void changeLang(String codelang){
    Locale locale = Locale(codelang);
    Get.updateLocale(locale);
  }



}
