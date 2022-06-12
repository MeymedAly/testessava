import 'package:get/get.dart';
import 'package:testessava/controllers/addpdv_controller.dart';

class AddPdvBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddPdvController>(AddPdvController());
  }
}
