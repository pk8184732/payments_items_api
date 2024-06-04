


import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../class_screen/items_api_services.dart';

class CustomerPutScreen extends StatefulWidget {
  String name;
  String description;
  String customerId; // Pass the customer ID


  CustomerPutScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.customerId,
  }) : super(key: key);

  @override
  CustomerPutScreenState createState() => CustomerPutScreenState();
}

class CustomerPutScreenState extends State<CustomerPutScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    descriptionController.text = widget.description;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Items Patch Screen",style:
      TextStyle(color: Colors.white),),backgroundColor: Colors.lightGreen),
      body: GetBuilder<ItemsApiServices>(
        init: ItemsApiServices(),
        builder: (controller) {
          return Column(
            children: [
              const SizedBox(height: 30,),
              textField("Name", nameController),
              textField("Description", descriptionController),
              MaterialButton(
                color: Colors.lightGreen,
                child: const Text("Patch", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  await controller.patchItemsData(
                    nameController.text,
                    descriptionController.text,
                    widget.customerId,
                  );
                  Navigator.pop(context); // Pop the screen after update is done
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget textField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}