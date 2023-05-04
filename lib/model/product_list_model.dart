// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  bool? success;
  String? message;
  Data? data;
  dynamic errors;
  int? code;

  ProductListModel({
    this.success,
    this.message,
    this.data,
    this.errors,
    this.code,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    errors: json["errors"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "errors": errors,
    "code": code,
  };
}

class Data {
  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Product {
  int? id;
  String? name;
  String? image;
  String? slug;
  String? sku;
  String? price;
  String? sellBasePriceNew;
  String? sellBasePriceOld;
  int? quantity;
  int? status;
  int? isFeatured;
  int? isAccessory;
  int? categoryId;
  int? brandId;
  int? seriesId;
  int? operationTypeId;
  DateTime? releaseDate;
  int? lowestPriceUnitId;
  LowestUnit? lowestUnit;

  Product({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.sku,
    this.price,
    this.sellBasePriceNew,
    this.sellBasePriceOld,
    this.quantity,
    this.status,
    this.isFeatured,
    this.isAccessory,
    this.categoryId,
    this.brandId,
    this.seriesId,
    this.operationTypeId,
    this.releaseDate,
    this.lowestPriceUnitId,
    this.lowestUnit,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
    sku: json["sku"],
    price: json["price"],
    sellBasePriceNew: json["sell_base_price_new"],
    sellBasePriceOld: json["sell_base_price_old"],
    quantity: json["quantity"],
    status: json["status"],
    isFeatured: json["is_featured"],
    isAccessory: json["is_accessory"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    seriesId: json["series_id"],
    operationTypeId: json["operation_type_id"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    lowestPriceUnitId: json["lowest_price_unit_id"],
    lowestUnit: json["lowest_unit"] == null ? null : LowestUnit.fromJson(json["lowest_unit"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "slug": slug,
    "sku": sku,
    "price": price,
    "sell_base_price_new": sellBasePriceNew,
    "sell_base_price_old": sellBasePriceOld,
    "quantity": quantity,
    "status": status,
    "is_featured": isFeatured,
    "is_accessory": isAccessory,
    "category_id": categoryId,
    "brand_id": brandId,
    "series_id": seriesId,
    "operation_type_id": operationTypeId,
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "lowest_price_unit_id": lowestPriceUnitId,
    "lowest_unit": lowestUnit?.toJson(),
  };
}

class LowestUnit {
  int? id;
  int? mainProductId;
  String? salePrice;

  LowestUnit({
    this.id,
    this.mainProductId,
    this.salePrice,
  });

  factory LowestUnit.fromJson(Map<String, dynamic> json) => LowestUnit(
    id: json["id"],
    mainProductId: json["main_product_id"],
    salePrice: json["sale_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main_product_id": mainProductId,
    "sale_price": salePrice,
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
