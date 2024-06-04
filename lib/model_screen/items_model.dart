// To parse this JSON data, do
//
//     final itemsModel = itemsModelFromJson(jsonString);

import 'dart:convert';

ItemsModel itemsModelFromJson(String str) =>
    ItemsModel.fromJson(json.decode(str));

String itemsModelToJson(ItemsModel data) => json.encode(data.toJson());

class ItemsModel {
  String entity;
  int count;
  List<Item> items;

  ItemsModel({
    required this.entity,
    required this.count,
    required this.items,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        entity: json["entity"],
        count: json["count"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "entity": entity,
        "count": count,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String id;
  bool active;
  String name;
  String description;
  int amount;
  int unitAmount;
  String currency;
  String type;
  dynamic unit;
  bool taxInclusive;
  dynamic hsnCode;
  dynamic sacCode;
  dynamic taxRate;
  dynamic taxId;
  dynamic taxGroupId;
  int createdAt;

  Item({
    required this.id,
    required this.active,
    required this.name,
    required this.description,
    required this.amount,
    required this.unitAmount,
    required this.currency,
    required this.type,
    required this.unit,
    required this.taxInclusive,
    required this.hsnCode,
    required this.sacCode,
    required this.taxRate,
    required this.taxId,
    required this.taxGroupId,
    required this.createdAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        active: json["active"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"],
        unitAmount: json["unit_amount"],
        currency: json["currency"],
        type: json["type"],
        unit: json["unit"],
        taxInclusive: json["tax_inclusive"],
        hsnCode: json["hsn_code"],
        sacCode: json["sac_code"],
        taxRate: json["tax_rate"],
        taxId: json["tax_id"],
        taxGroupId: json["tax_group_id"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "name": name,
        "description": description,
        "amount": amount,
        "unit_amount": unitAmount,
        "currency": currency,
        "type": type,
        "unit": unit,
        "tax_inclusive": taxInclusive,
        "hsn_code": hsnCode,
        "sac_code": sacCode,
        "tax_rate": taxRate,
        "tax_id": taxId,
        "tax_group_id": taxGroupId,
        "created_at": createdAt,
      };
}















// IconButton(
//     onPressed: () async {
//       await ItemsApiServices().deleteItemsData(id: data?[index].id ?? "");
//     },
//     icon: const Icon(Icons.delete)
// )

// Future<void> deleteItemsData({required String id}) async {
//   var headers = {
//     "Authorization": 'Basic ${base64Encode(utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'))}',
//   };
//   var url = Uri.parse('https://api.razorpay.com/v1/items/$id'); // Use the item ID in the URL
//   try {
//     var response = await http.delete(
//       url,
//       headers: headers,
//     );
//     if (response.statusCode == 204) {
//       print("Item deleted successfully");
//       Fluttertoast.showToast(
//         msg: "Item deleted successfully",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     } else {
//       print("Failed with status: ${response.statusCode}");
//       Fluttertoast.showToast(
//         msg: "Failed to delete item: ${response.reasonPhrase}",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   } catch (e) {
//     print("Error: $e");
//     Fluttertoast.showToast(
//       msg: "An error occurred: $e",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
// }