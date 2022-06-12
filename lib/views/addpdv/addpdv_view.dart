import 'dart:ffi';

import 'package:flutter/material.dart';

class AddPdvView extends StatelessWidget {
  const AddPdvView({Key? key}) : super(key: key);
  final double latitude = 18.2677888;
  final double longitude = 17.2677888;
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
              Text('latitude : $latitude'),
              const SizedBox(
                height: 40,
              ),
              Text("longitude : $longitude"),
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
