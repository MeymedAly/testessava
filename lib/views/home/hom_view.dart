import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testessava/controllers/home_controller.dart';
import 'package:lottie/lottie.dart';
 import 'package:testessava/controllers/modifipdv_controller.dart';
import 'package:testessava/views/addpdv/addpdv_view.dart';
import 'package:testessava/views/modifpdv/modifpdv_view.dart';

import '../cherche/cherche.dart';
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  // SqlDb sqlDb = Sqflite();
  //AddPdvController controller = Get.put(AddPdvController());
  final HomeController controller = Get.put(HomeController());
  final ModifiPdvController modificontroller = Get.put(ModifiPdvController());

  Widget emptyPdv() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/images/note.json'),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "You don't have any Pdv",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les points des ventes'),
        actions: [
          IconButton(
              onPressed: () {
                //cherch(context: context, GetDelegate());
                showSearch(context: context, delegate: SearchDelegat());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.pdv.length,
            itemBuilder: (context, index) => Card(
            
              key: ValueKey(controller.pdv[index].id),
              //color: Color.fromARGB(255, 64, 255, 255),
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 10),
              
              child: ListTile(
                trailing: Wrap(children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit,color: Colors.green),
                onPressed: () {
                  // modificontroller.edit(controller.pdv[index].id);
                  Get.to(() => ModifierPdvView());
                },
              ),
              IconButton(
                  icon: Icon(Icons.delete,color: Colors.red.shade400,),
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'supprimer',
                       
                        middleText:
                            'est c que vou pouvais supprimer  ${controller.pdv[index].code}?',
                        textCancel: 'annuler',
                        onConfirm: () {
                          controller.delete(controller.pdv[index].id);
                          if (controller.loading.value == true) {
                            Get.dialog(
                              Center(child: CircularProgressIndicator()),
                            );
                          }
                        });
                  }),
            ]),
                leading: Text(
                  controller.pdv[index].code.toString(),
                  
                  style: const TextStyle(fontSize: 24), 
                  
                ),
                
                // trailing:,
                // title: Text(controller.pdv[index].lon.toString()),
                // subtitle: Text(controller.pdv[index].lalt.toString()),
              ),
            ),
          )),
      // body: GetBuilder(
      //   builder: (_) => emptyPdv(),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPdvView());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Les points des ventes'),
//       ),
//       body: Container(),
//       // body: Obx(() {
//       //   return ListView.builder(
//       //     itemBuilder: (context, index) => ListTile(),
//       //   );
//       // }),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           //controller.addNote();
//           Get.toNamed(RoutesName.addPdvRoute);
//         },
//       ),
//     );
//   }
// }
