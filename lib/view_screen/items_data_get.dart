import 'package:flutter/material.dart';
import '../class_screen/items_api_services.dart';
import '../model_screen/items_model.dart';
import 'items_data_patch.dart';

class ItemsDataGet extends StatefulWidget {
  const ItemsDataGet({super.key});

  @override
  State<ItemsDataGet> createState() => _ItemsDataGetState();
}

class _ItemsDataGetState extends State<ItemsDataGet> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 4));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items Screen",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<ItemsModel>(
        future: ItemsApiServices().getItemsData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Display loader
            );
          } else {
            var data = snapshot.data?.items;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.purple,
                      color: Colors.lightGreen,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(data?[index].id ?? "",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepPurple)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(data![index].name.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                        data![index].description.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        data![index].createdAt.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(data![index].active.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        data![index].taxInclusive.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(data![index].type.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerPutScreen(
                                                name: data![index]
                                                    .name
                                                    .toString(),
                                                description: data![index]
                                                    .description
                                                    .toString(),
                                                customerId:
                                                    data?[index].id ?? "",
                                              ),
                                            ));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 20,
                                      )),
                                  IconButton(
                                      onPressed: () async {
                                        await ItemsApiServices().deleteItemsData(id: data?[index].id ?? "");
                                        setState(() {
                                          ItemsApiServices().getItemsData();
                                        });
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
