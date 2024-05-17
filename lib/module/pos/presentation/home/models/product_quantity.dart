// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';

class ProductQuantity {
  final Product product;
  int quantity;
  ProductQuantity({
    required this.product,
    required this.quantity,
  });
  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  Map<String, dynamic> toLocalMap(int orderId) {
    print('orderId $orderId');
    return {
      'id_order': orderId,
      'id_product': product.id,
      'quantity': quantity,
      'price': product.price,
    };
  }

  // Map<String, dynamic> toMapForLocal(int orderId) {
  //   return {
  //     'id_order': orderId,
  //     'id_product': product.id,
  //     'quantity': quantity,
  //     'price': product.price,
  //   };
  // }
  factory ProductQuantity.fromLocalMap(Map<String, dynamic> map) {
    return ProductQuantity(
      product: Product.fromOrderMap(map),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  factory ProductQuantity.fromMap(Map<String, dynamic> map) {
    return ProductQuantity(
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ProductQuantity.fromJson(String source) => ProductQuantity.fromMap(json.decode(source));

  @override
  bool operator ==(covariant ProductQuantity other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;

  @override
  String toString() =>
      'ProductQuantity(product: $product, quantity: $quantity)';
}
