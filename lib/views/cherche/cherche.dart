import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testessava/controllers/home_controller.dart';

import '../../models/pdv_model.dart';

class SearchDelegat extends SearchDelegate {
  final HomeController _controller = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
    //throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Pdv>>(builder: ((context, snapshot) {
      future:
      _controller.getAllPdv();
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      //List<getAllPdv>? data = snapshot.data;
      return ListView.builder(
        itemCount: _controller.pdv.length,
        itemBuilder: (context, index) => Card(
          key: ValueKey(_controller.pdv[index].id),
          //color: Color.fromARGB(255, 64, 255, 255),
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Text(
              _controller.pdv[index].code.toString(),
              style: const TextStyle(fontSize: 24),
            ),
            // trailing:,
            // title: Text(controller.pdv[index].lon.toString()),
            // subtitle: Text(controller.pdv[index].lalt.toString()),
          ),
        ),
      );
    }));
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('chercher un point de vente'),
    );
    //throw UnimplementedError();
  }
}
