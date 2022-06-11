// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:testessava/splash/splash_view.dart';
import 'package:testessava/views/home/hom_view.dart';

class RoutesName {
  static const splashRoute = '/';
  static const homeRoute = '/homeRoutes';
}

class RoutesPages {
  static final pages = [
    GetPage(
      name: RoutesName.splashRoute,
      page: () => SplashView(),
    ),
    GetPage(
      name: RoutesName.homeRoute,
      page: () => HomeView(),
    )
  ];
}
