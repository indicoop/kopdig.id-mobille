import 'dart:convert';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    required this.meta,
    required this.data,
  });

  Meta? meta;
  List<Datum>? data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta == null ? null : meta?.toJson(),
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.cooperativeId,
    required this.businessId,
    required this.createdAt,
    required this.updatedAt,
    required this.cooperative,
    required this.products,
    required this.business,
  });

  int id;
  int? cooperativeId;
  int? businessId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Cooperative? cooperative;
  List<Product> products;
  Business? business;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    cooperativeId: json["cooperative_id"] == null ? null : json["cooperative_id"],
    businessId: json["business_id"] == null ? null : json["business_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    cooperative: json["cooperative"] == null ? null : Cooperative.fromJson(json["cooperative"]),
    products: json["products"] == null ? [] : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    business: json["business"] == null ? null : Business.fromJson(json["business"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "cooperative_id": cooperativeId == null ? null : cooperativeId,
    "business_id": businessId == null ? null : businessId,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "cooperative": cooperative == null ? null : cooperative?.toJson(),
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    "business": business == null ? null : business?.toJson(),
  };
}

class Business {
  Business({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String? name;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    category: json["category"] == null ? null : json["category"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "category": category == null ? null : category,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}

class Cooperative {
  Cooperative({
    required this.id,
    required this.userId,
    required this.name,
    required this.registrationNumber,
    required this.status,
    required this.effectiveDate,
    required this.statusGrade,
    required this.dateOfEstablishment,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.formOfCooperative,
    required this.certificate,
    required this.legalEntityCertificate,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String name;
  String registrationNumber;
  int status;
  DateTime? effectiveDate;
  String statusGrade;
  DateTime? dateOfEstablishment;
  String address;
  String email;
  String phoneNumber;
  String formOfCooperative;
  String certificate;
  String legalEntityCertificate;
  int isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cooperative.fromJson(Map<String, dynamic> json) => Cooperative(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    name: json["name"] == null ? null : json["name"],
    registrationNumber: json["registration_number"] == null ? null : json["registration_number"],
    status: json["status"] == null ? null : json["status"],
    effectiveDate: json["effective_date"] == null ? null : DateTime.parse(json["effective_date"]),
    statusGrade: json["status_grade"] == null ? null : json["status_grade"],
    dateOfEstablishment: json["date_of_establishment"] == null ? null : DateTime.parse(json["date_of_establishment"]),
    address: json["address"] == null ? null : json["address"],
    email: json["email"] == null ? null : json["email"],
    phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
    formOfCooperative: json["form_of_cooperative"] == null ? null : json["form_of_cooperative"],
    certificate: json["certificate"] == null ? null : json["certificate"],
    legalEntityCertificate: json["legal_entity_certificate"] == null ? null : json["legal_entity_certificate"],
    isVerified: json["is_verified"] == null ? null : json["is_verified"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "name": name == null ? null : name,
    "registration_number": registrationNumber == null ? null : registrationNumber,
    "status": status == null ? null : status,
    "effective_date": effectiveDate == null ? null : "${effectiveDate?.year.toString().padLeft(4, '0')}-${effectiveDate?.month.toString().padLeft(2, '0')}-${effectiveDate?.day.toString().padLeft(2, '0')}",
    "status_grade": statusGrade == null ? null : statusGrade,
    "date_of_establishment": dateOfEstablishment == null ? null : "${dateOfEstablishment?.year.toString().padLeft(4, '0')}-${dateOfEstablishment?.month.toString().padLeft(2, '0')}-${dateOfEstablishment?.day.toString().padLeft(2, '0')}",
    "address": address == null ? null : address,
    "email": email == null ? null : email,
    "phone_number": phoneNumber == null ? null : phoneNumber,
    "form_of_cooperative": formOfCooperative == null ? null : formOfCooperative,
    "certificate": certificate == null ? null : certificate,
    "legal_entity_certificate": legalEntityCertificate == null ? null : legalEntityCertificate,
    "is_verified": isVerified == null ? null : isVerified,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}

class Product {
  Product({
    required this.id,
    required this.businessDetailId,
    required this.productCategoryId,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.thumbnail,
    required this.productionDate,
    required this.discount,
    required this.weight,
    required this.voucherId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int businessDetailId;
  int productCategoryId;
  String name;
  double price;
  int stock;
  String description;
  String thumbnail;
  DateTime? productionDate;
  double discount;
  double weight;
  int voucherId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    businessDetailId: json["business_detail_id"] == null ? null : json["business_detail_id"],
    productCategoryId: json["product_category_id"] == null ? null : json["product_category_id"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    stock: json["stock"] == null ? null : json["stock"],
    description: json["description"] == null ? null : json["description"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    productionDate: json["production_date"] == null ? null : DateTime.parse(json["production_date"]),
    discount: json["discount"] == null ? null : json["discount"].toDouble(),
    weight: json["weight"] == null ? null : json["weight"].toDouble(),
    voucherId: json["voucher_id"] == null ? null : json["voucher_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "business_detail_id": businessDetailId == null ? null : businessDetailId,
    "product_category_id": productCategoryId == null ? null : productCategoryId,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "stock": stock == null ? null : stock,
    "description": description == null ? null : description,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "production_date": productionDate == null ? null : "${productionDate?.year.toString().padLeft(4, '0')}-${productionDate?.month.toString().padLeft(2, '0')}-${productionDate?.day.toString().padLeft(2, '0')}",
    "discount": discount == null ? null : discount,
    "weight": weight == null ? null : weight,
    "voucher_id": voucherId == null ? null : voucherId,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}

class Meta {
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
