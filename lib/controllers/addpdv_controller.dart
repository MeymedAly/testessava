import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';

class AddPdvController extends GetxController {
  var latitude = "".obs;
  var longitude = "".obs;

  @override
  void onInit() async {
    super.onInit();
    chekLocationServiceInDivice();
  }

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
