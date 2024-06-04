
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../model_screen/items_id_model.dart';
import '../model_screen/items_model.dart';


class ItemsApiServices extends GetxController {
  Future<void> postItemsData(
      String name,
      String description,
      int amount,
      String currency
      ) async {
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode(
            '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
      "Content-Type": "application/json",
    };
    var url = Uri.parse('https://api.razorpay.com/v1/items');
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(
            {
              "name":name,
              "description":description,
              "amount": amount,
              "currency": currency
            }
        ),
      );
      if (response.statusCode == 200) {
        print(response.body);
        print("Success");
        Fluttertoast.showToast(
          msg: "Order created successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        print("Failed with status: ${response.statusCode}");
        Fluttertoast.showToast(
          msg: "Failed to create order: ${response.reasonPhrase}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
    catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<ItemsModel> getItemsData() async {
    var headers = {
      "Authorization":
      'Basic ${base64Encode(utf8.encode('${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'))}'
    };
    var response = await http.get(
        Uri.parse("https://api.razorpay.com/v1/items"),
        headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var getResponse = ItemsModel.fromJson(data);
      print(response);
      return getResponse;
    } else {
      return getItemsData();
    }
  }

  Future<ItemsIdModel> getSingleId()async{
    var headers = {
      "Authorization":
      'Basic ${base64Encode(utf8.encode('${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'))}'
    };
    var response = await http.get(
        Uri.parse("https://api.razorpay.com/v1/items/item_7Oxp4hmm6T4SCn"),
        headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var getResponse = ItemsIdModel.fromJson(data);
      print(response);
      return getResponse;
    } else {
      return getSingleId();
    }
  }

  Future<void> patchItemsData(
      String name,
      String description,
      String id,
      ) async {
    var headers = {
      "Authorization": 'Basic ${base64Encode(utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'))}',
      "Content-Type": "application/json",
    };
    var url = Uri.parse('https://api.razorpay.com/v1/items/$id'); // Use the customer ID in the URL
    try {
      var response = await http.patch(
        url,
        headers: headers,
        body: json.encode({
          "name": name,
          "description": description
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Fluttertoast.showToast(
          msg: "Customer details updated successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        print("Failed with status: ${response.statusCode}");
        Fluttertoast.showToast(
          msg: "Failed to update customer details: ${response.reasonPhrase}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> deleteItemsData({required String id}) async {
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode(
            '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
    };
    var url = Uri.parse('https://api.razorpay.com/v1/items/$id'); // Use the item ID in the URL
    try {
      var response = await http.delete(
        url,
        headers: headers,
      );
      if (response.statusCode == 204) {
        print("Item deleted successfully");
        Fluttertoast.showToast(
          msg: "Item deleted successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        print("Failed with status: ${response.statusCode}");
        Fluttertoast.showToast(
          msg: "Failed to delete item: ${response.reasonPhrase}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


}
