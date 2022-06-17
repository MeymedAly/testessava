import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db/sqldb.dart';
import '../models/pdv_model.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  List pdv = <Pdv>[].obs;
  final codeController = TextEditingController();
  final lonController = TextEditingController();
  final laltController =TextEditingController();
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
  //  @override
  // void edit(int id) async {

  //  final code =codeController.text;
  //  final lon = double.parse(lonController.text);
  //    final lalt = double.parse(laltController.text);
  //   Pdv pdv = Pdv(id: id ,code: code ,lon: lon ,lalt: lalt  );
  //  await SqlDb.instance.updateData(pdv);
  //   getAllPdv(); 
  // }
   @override
  void delete(int id)async {
    Pdv pdv = Pdv(
      id: id
    );
    await SqlDb.instance.deleteData(pdv);
    getAllPdv();
    update();
     
   
   
  }
  
}
