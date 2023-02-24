import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel {
  ProductResponseModel({
    this.currentPage,
    this.productList,
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

  int? currentPage;
  List<Product>? productList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        currentPage: json["current_page"],
        productList:
            List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(productList!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.sku,
    required this.price,
    required this.sellBasePriceNew,
    required this.sellBasePriceOld,
    required this.quantity,
    required this.status,
    required this.isFeatured,
    required this.isAccessory,
    required this.categoryId,
    required this.brandId,
    required this.seriesId,
    required this.operationTypeId,
    required this.releaseDate,
    required this.lowestPriceUnitId,
    required this.lowestUnit,
  });

  int id;
  String name;
  String image;
  String slug;
  String sku;
  String price;
  String sellBasePriceNew;
  String sellBasePriceOld;
  int quantity;
  int status;
  int isFeatured;
  int isAccessory;
  int categoryId;
  int brandId;
  int seriesId;
  int operationTypeId;
  DateTime releaseDate;
  int lowestPriceUnitId;
  LowestUnit lowestUnit;

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
        releaseDate: DateTime.parse(json["release_date"]),
        lowestPriceUnitId: json["lowest_price_unit_id"],
        lowestUnit: LowestUnit.fromJson(json["lowest_unit"]),
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
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "lowest_price_unit_id": lowestPriceUnitId,
        "lowest_unit": lowestUnit.toJson(),
      };
}

class LowestUnit {
  LowestUnit({
    required this.id,
    required this.mainProductId,
    required this.salePrice,
  });

  int id;
  int mainProductId;
  String salePrice;

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
  Link({
    this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String label;
  bool active;

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
