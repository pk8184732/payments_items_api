
import 'package:flutter/material.dart';
import 'package:payments_items_api/model_screen/items_model.dart';

import '../class_screen/items_api_services.dart';
import 'items_data_get.dart';


class SingleIdGet extends StatefulWidget {
  const SingleIdGet({super.key});

  @override
  State<SingleIdGet> createState() => _SingleIdGetState();
}

class _SingleIdGetState extends State<SingleIdGet> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items Screen",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ItemsApiServices().getSingleId(),
        builder: (_, snapshot) {
          var data=snapshot.data;
        return
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${data?.id}"),
              Text("${data?.name}"),
              Text("${data?.description}"),
              Text("${data?.currency}"),
              Text("${data?.amount}"),
              Text("${data?.createdAt}"),
              Text("${data?.type}"),
              Text("${data?.active}"),

              Padding(
                padding: const EdgeInsets.all(28.0),
                child: ElevatedButton(
                    style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.lightGreen) ),
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemsDataGet(),));
                }, child: const Text("SINGLE ID GET")),
              )
            ],
          ),
        );
        },
      ),
    );
  }
}
