import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/addpdv_controller.dart';

class AddPdvView extends GetView<AddPdvController> {
  const AddPdvView({Key? key}) : super(key: key);
  // final double latitude = 18.2677888;
  // final double longitude = 17.2677888;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout un point de vente'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // Obx(
              //   () => Text(
              //     'sidi',
              //     //controller.latitude.value,
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 25,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              Text("longitude : ${controller.longitude}"),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child:
                    ElevatedButton(onPressed: null, child: Text('Enregistrer')),
              )
            ],
          ),
        )),
      ),
    );
  }
}
