import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addpdv/addpdv_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les points des ventes'),
      ),
      body: Container(),
      // body: Obx(() {
      //   return ListView.builder(
      //     itemBuilder: (context, index) => ListTile(),
      //   );
      // }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //controller.addNote();
          Get.off(() => const AddPdvView());
        },
      ),
    );
  }
}
