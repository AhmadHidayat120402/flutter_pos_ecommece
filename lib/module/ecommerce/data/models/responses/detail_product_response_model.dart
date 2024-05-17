// To parse this JSON data, do
//
//     final detailProductResponseModel = detailProductResponseModelFromJson(jsonString);

import 'dart:convert';

// import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/order_detail_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';

DetailProductResponseModel detailProductResponseModelFromJson(String str) =>
    DetailProductResponseModel.fromJson(json.decode(str));

String detailProductResponseModelToJson(DetailProductResponseModel data) =>
    json.encode(data.toJson());

class DetailProductResponseModel {
  final String? message;
  final DetailProduct? detailProduct;

  DetailProductResponseModel({
    this.message,
    this.detailProduct,
  });

  factory DetailProductResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailProductResponseModel(
        message: json["message"],
        detailProduct:
            json["data"] == null ? null : DetailProduct.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": detailProduct?.toJson(),
      };
}

class DetailProduct {
  final int? id;
  final int? categoryId;
  final String? name;
  final int? price;
  final int? stock;
  final String? image;
  final int? isAvailable;
  final String? description;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DetailProduct({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.stock,
    this.image,
    this.isAvailable,
    this.description,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Product toProduct() => Product(
        id: id,
        categoryId: categoryId,
        name: name,
        price: price,
        stock: stock,
        image: image,
        isAvailable: isAvailable,
        description: description,
        // deletedAt: deletedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        image: json["image"],
        isAvailable: json["is_available"],
        description: json["description"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "price": price,
        "stock": stock,
        "image": image,
        "is_available": isAvailable,
        "description": description,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
