import 'dart:developer';
//import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testessava/db/sqldb.dart';
import 'package:testessava/models/pdv_model.dart';


class ModifiPdvController extends GetxController {
  final codeController = TextEditingController();
  final lonController = TextEditingController();
  final laltController = TextEditingController();
  FocusNode contentFocusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool loading = false.obs;
  @override
  void edit(int id) async {

   final code =codeController.text;
    final lon = lonController.text;
      final lalt = laltController.text;
    Pdv pdv = Pdv(id: id ,code: code,lon:lon , lalt: lalt   );
   await SqlDb.instance.updateData(pdv);
     
  }
   editMode() {
    contentFocusNode.unfocus();
    if (formKey.currentState!.validate()) {
      loading(true);
      // if (Get.arguments == null) {
      //   saveNote();
      // } else {
      //   updateNote();
      // }
    }
  }
   validcode(String? value) {
    if (value == null || value.isEmpty) {
      return 'erreur.';
    }
    return null;
  }

 }