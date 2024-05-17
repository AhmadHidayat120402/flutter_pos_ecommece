// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class ProductRequestModel {
  final int id;
  final String name;
  final int price;
  final int stock;
 final XFile? image;
  final int is_available;
  final String description;
  final int category_id;
  ProductRequestModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
     this.image,
    required this.is_available,
    required this.description,
    required this.category_id,
  });

  Map<String, String> toMap() {
    return{
      'id' : id.toString(),
      'name': name,
      'price': price.toString(),
      'stock': stock.toString(),
      'is_available': is_available.toString(),
      'description': description,
      'category_id': category_id.toString(),
    };
  }
String toJson() => json.encode(toMap());
}