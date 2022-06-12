// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:testessava/splash/splash_view.dart';
import 'package:testessava/views/home/hom_view.dart';

import '../bindings/addpdv_binding.dart';
import '../views/addpdv/addpdv_view.dart';
import '../views/modifpdv/modifpdv_view.dart';

class RoutesName {
  static const splashRoute = '/';
  static const homeRoute = '/homeRoutes';
  static const modifPdvRoute = '/modifPdvRoute';
  static const addPdvRoute = '/addPdvRoute';
}

class RoutesPages {
  static final pages = [
    GetPage(
      name: RoutesName.splashRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: RoutesName.homeRoute,
      page: () => const HomeView(),
    ),
    GetPage(
      name: RoutesName.addPdvRoute,
      page: () => const AddPdvView(),
      binding: AddPdvBinding(),
    ),
    GetPage(
      name: RoutesName.modifPdvRoute,
      page: () => const ModifierPdvView(),
    )
  ];
}
