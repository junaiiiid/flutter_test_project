
class ApiModel {
  List<Datum>? data;

  ApiModel({
    this.data,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
  };
}

class Datum {
  int? id;
  int? accountId;
  int? itemId;
  int? userId;
  String? name;
  Type? type;
  String? date;
  Category? category;
  double? amount;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.accountId,
    this.itemId,
    this.userId,
    this.name,
    this.type,
    this.date,
    this.category,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    accountId: json["account_id"] == null ? null : json["account_id"],
    itemId: json["item_id"] == null ? null : json["item_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : typeValues.map![json["type"]],
    date: json["date"] == null ? null : json["date"],
    category: json["category"] == null ? null : categoryValues.map![json["category"]],
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "account_id": accountId == null ? null : accountId,
    "item_id": itemId == null ? null : itemId,
    "user_id": userId == null ? null : userId,
    "name": name == null ? null : name,
    "type": type == null ? null : typeValues.reverse![type],
    "date": date == null ? null : date,
    "category": category == null ? null : categoryValues.reverse![category],
    "amount": amount == null ? null : amount,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}

enum Category { PAYMENT, TRAVEL, TRANSFER, RECREATION, FOOD_AND_DRINK, SHOPS }

final categoryValues = EnumValues({
  "Food and Drink": Category.FOOD_AND_DRINK,
  "Payment": Category.PAYMENT,
  "Recreation": Category.RECREATION,
  "Shops": Category.SHOPS,
  "Transfer": Category.TRANSFER,
  "Travel": Category.TRAVEL
});

enum Type { SPECIAL, PLACE }

final typeValues = EnumValues({
  "place": Type.PLACE,
  "special": Type.SPECIAL
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
