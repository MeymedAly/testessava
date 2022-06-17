import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/addpdv_controller.dart';

class AddPdvView extends StatelessWidget {
  AddPdvView({Key? key}) : super(key: key);
  // final double latitude = 18.2677888;
  // final double longitude = 17.2677888;
  //SqlDb sqlDb = SqlDb();
  final AddPdvController controller = Get.put(AddPdvController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout un point de vente'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: controller.codeController,
                decoration: const InputDecoration(
                  labelText: 'Code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controller.lonController,
                decoration: const InputDecoration(
                  labelText: 'lon',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controller.laltController,
                decoration: const InputDecoration(
                  labelText: 'lalt',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.addPdvToDatabase();
                },
                child: const Text('Enregistrer'),
              )
            ],
          ),
        )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //controller.addNoteToDatabase();
      //     controller.addPdvToDatabase();
      //   },
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
    );
  }
}
