
// To parse this JSON data, do
//
//     final itemsIdModel = itemsIdModelFromJson(jsonString);

import 'dart:convert';

ItemsIdModel itemsIdModelFromJson(String str) => ItemsIdModel.fromJson(json.decode(str));

String itemsIdModelToJson(ItemsIdModel data) => json.encode(data.toJson());

class ItemsIdModel {
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

  ItemsIdModel({
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

  factory ItemsIdModel.fromJson(Map<String, dynamic> json) => ItemsIdModel(
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
