import 'dart:developer';
//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:testessava/db/sqldb.dart';
import 'package:testessava/models/pdv_model.dart';

class AddPdvController extends GetxController {
  final codeController = TextEditingController();
  final logController = TextEditingController();
  final laltController = TextEditingController();
  var latitude = "".obs;
  var longitude = "".obs;
  List pdv = <Pdv>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getAllPdv();
    chekLocationServiceInDivice();
  }

  bool isEmpty() {
    if (pdv.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  void getAllPdv() async {
    pdv = await SqlDb.instance.selectData();
    update();
  }

  void addPdvToDatabase() async {
    String code = codeController.text;
    double lon = double.parse(logController.text);
    double lalt = double.parse(laltController.text);
    Pdv pdv = Pdv(
      code: code,
      lon: lon,
      lalt: lalt,
    );
    await SqlDb.instance.insertData(pdv);
    codeController.text;
    //logController.text;
    //.text;
    Get.back();
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///Location

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _location;
  void chekLocationServiceInDivice() async {
    Location location = Location();
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      log('GPS Eneble');
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        //print('start traiking');
        log('start traiking');

        _location = await location.getLocation();
        // longitude.value = _location.longitude as String;
        // latitude.value = _location.latitude as String;
        log("${_location.longitude} ${_location.latitude}");
      } else {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          log('Start trainking');
        } else {
          SystemNavigator.pop();
        }
      }
    } else {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) {
        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          log('start traiking');
        } else {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted == PermissionStatus.granted) {
            log('Start trainking');
          } else {
            SystemNavigator.pop();
          }
        }
      } else {
        SystemNavigator.pop();
      }
    }
  }
}
