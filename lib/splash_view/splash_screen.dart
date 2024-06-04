

import 'dart:async';

import 'package:flutter/material.dart';

import '../view_screen/items_data_post.dart';

class ItemsSplashScreen extends StatefulWidget {
  const ItemsSplashScreen({super.key});

  @override
  State<ItemsSplashScreen> createState() => _ItemsSplashScreenState();
}

class _ItemsSplashScreenState extends State<ItemsSplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ItemsDataPost()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMGnJ1TCM1IvHXzH5iBg7g0gooIujJ7_m5nN1EIakF0SawESQxw0bJGnxQ0d6ALMy_37Y&usqp=CAU",
        ),
      ),
    );
  }
}
