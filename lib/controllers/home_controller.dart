import 'package:get/get.dart';

import '../db/sqldb.dart';
import '../models/pdv_model.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  List pdv = <Pdv>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllPdv();
  }

  void getAllPdv() async {
    loading(true);
    pdv = await SqlDb.instance.selectData();
    update();
  }

  @override
  void onReady() {
    getAllPdv();
    super.onReady();
  }
}
