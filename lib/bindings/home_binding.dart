import 'package:get/get.dart';
import 'package:testessava/controllers/home_controller.dart';

import '../models/pdv_model.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<HomeController>(() => HomeController());
    Get.put(HomeController());
  }
}
