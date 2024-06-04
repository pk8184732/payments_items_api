

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../class_screen/items_api_services.dart';
import '../class_screen/items_mixin.dart';
import 'items_data_get.dart';
import 'items_single_id_get.dart';

class ItemsDataPost extends StatelessWidget with ViewTextField {
  ItemsDataPost({super.key});

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("Customer Post Data",style: TextStyle(color: Colors.white)),
      ),
      body: GetBuilder(
        init: ItemsApiServices(),
        builder: (controller) {
          return Column(
            children: [
              const SizedBox(height: 20,),
              textField( "Name", nameController),
              textField("Description", descriptionController),
              textField("Amount", amountController),
              textField("Currency", currencyController),
              MaterialButton(
                  color: Colors.lightGreen,
                  child: const Text("POST",style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    controller.postItemsData(
                      nameController.text,
                      descriptionController.text,
                      int.parse(amountController.text),
                      currencyController.text,

                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SingleIdGet(),));
                  })
            ],
          );
        },
      ),
    );
  }
}
