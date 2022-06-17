import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:get/get.dart';

import '../../controllers/modifipdv_controller.dart';
class ModifierPdvView extends StatelessWidget {
   ModifierPdvView({Key? key}) : super(key: key);
  final ModifiPdvController controller = Get.put(ModifiPdvController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${controller.codeController}')),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'code',
                ),
                controller: controller.codeController,
                
                textInputAction: TextInputAction.next,
                // onEditingComplete: controller.contentFocusNode.requestFocus,
                onFieldSubmitted: (String value) {
                  // controller.contentFocusNode.requestFocus();
                },
                validator: (value) {
                  return controller.validcode(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'lon',
                ),
                controller: controller.lonController,
                // focusNode: controller.contentFocusNode,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (String value) {
                  controller.editMode();
                 
                },
                validator: (value) {
                  return controller.validcode(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.editMode();
                      
                    },
                    child: Text('enregistrer'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

