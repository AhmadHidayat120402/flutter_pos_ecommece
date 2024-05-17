// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_quantity.dart';

//  id INTEGER PRIMARY KEY AUTOINCREMENT,
//       sub_total INTEGER,
//       tax INTEGER,
//       discount INTEGER,
//       service_charge INTEGER,
//       total INTEGER,
//       payment_method TEXT,
//       total_item INTEGER,
//       id_kasir INTEGER,
//       nama_kasir TEXT,
//       transaction_time TEXT,
//       is_sync INTEGER DEFAULT 0

class OrderModel {
  final int? id;
  //payment_amount
  final int paymentAmount;
  final int addressId;
  final int subtotal;
  final int tax;
  final int discount;
  final int serviceCharge;
  final int total_cost;
  final String paymentMethod;
  final int totalItem;
  final int idKasir;
  final String namaKasir;
  final String transactionTime;
  final int isSync;
  final List<ProductQuantity> orderItems;
  OrderModel({
    this.id,
    required this.subtotal,
    required this.paymentAmount,
    required this.addressId,
    required this.tax,
    required this.discount,
    required this.serviceCharge,
    required this.total_cost,
    required this.paymentMethod,
    required this.totalItem,
    required this.idKasir,
    required this.namaKasir,
    required this.transactionTime,
    required this.isSync,
    required this.orderItems,
  });

  //  'payment_amount' => 'required',
  //           'sub_total' => 'required',
  //           'tax' => 'required',
  //           'discount' => 'required',
  //           'service_charge' => 'required',
  //           'total' => 'required',
  //           'payment_method' => 'required',
  //           'total_item' => 'required',
  //           'id_kasir' => 'required',
  //           'nama_kasir' => 'required',
  //           'transaction_time' => 'required',
  //           'order_items' => 'required'

  Map<String, dynamic> toServerMap() {
    print('id $id');
    return {
      'payment_amount': paymentAmount,
      'address_id': addressId,
      'subtotal': subtotal,
      'tax': tax,
      'discount': discount,
      'service_charge': serviceCharge,
      'total': total_cost,
      'payment_method': paymentMethod,
      'total_item': totalItem,
      'id_kasir': idKasir,
      'nama_kasir': namaKasir,
      'transaction_time': transactionTime,
      'order_items': orderItems.map((e) => e.toLocalMap(id ?? 0)).toList(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address_id': 1,
      'payment_amount': paymentAmount,
      'subtotal': subtotal,
      'tax': tax,
      'discount': discount,
      'service_charge': serviceCharge,
      'total_cost': total_cost,
      'payment_method': paymentMethod,
      'total_item': totalItem,
      'id_kasir': idKasir,
      'nama_kasir': namaKasir,
      'transaction_time': transactionTime,
      'is_sync': isSync,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt(),
      addressId: map['address_id']?.toInt() ?? 0,
      paymentAmount: map['payment_amount']?.toInt() ?? 0,
      subtotal: map['subtotal']?.toInt() ?? 0,
      tax: map['tax']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      serviceCharge: map['service_charge']?.toInt() ?? 0,
      total_cost: map['total_cost']?.toInt() ?? 0,
      paymentMethod: map['payment_method'] ?? '',
      totalItem: map['total_item']?.toInt() ?? 0,
      idKasir: map['id_kasir']?.toInt() ?? 0,
      namaKasir: map['nama_kasir'] ?? '',
      transactionTime: map['transaction_time'] ?? '',
      isSync: map['is_sync']?.toInt() ?? 0,
      orderItems: [],
    );
  }
  factory OrderModel.fromLocalMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt(),
      addressId: map['address_id']?.toInt() ?? 0,
      paymentAmount: map['payment_amount']?.toInt() ?? 0,
      subtotal: map['subtotal']?.toInt() ?? 0,
      tax: map['tax']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      serviceCharge: map['service_charge']?.toInt() ?? 0,
      total_cost: map['total_cost']?.toInt() ?? 0,
      paymentMethod: map['payment_method'] ?? '',
      totalItem: map['total_item']?.toInt() ?? 0,
      idKasir: map['id_kasir']?.toInt() ?? 0,
      namaKasir: map['nama_kasir'] ?? '',
      transactionTime: map['transaction_time'] ?? '',
      isSync: map['is_sync']?.toInt() ?? 0,
      orderItems: [],
    );
  }

  String toJson() => json.encode(toServerMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  OrderModel copyWith({
    int? id,
    int? addressId,
    int? paymentAmount,
    int? subTotal,
    int? tax,
    int? discount,
    int? serviceCharge,
    int? total,
    String? paymentMethod,
    int? totalItem,
    int? idKasir,
    String? namaKasir,
    String? transactionTime,
    int? isSync,
    List<ProductQuantity>? orderItems,
  }) {
    final totalDiscount = ((discount ?? this.discount) / 100 * subtotal);
    print('total discount $totalDiscount');
    int total = (subTotal ?? subtotal) - (totalDiscount).toInt();
    print('total cost $total');

    return OrderModel(
      id: id ?? this.id,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      addressId: addressId ?? this.addressId,
      subtotal: subTotal ?? subtotal,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      serviceCharge: serviceCharge ?? this.serviceCharge,
      total_cost: total,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      totalItem: totalItem ?? this.totalItem,
      idKasir: idKasir ?? this.idKasir,
      namaKasir: namaKasir ?? this.namaKasir,
      transactionTime: transactionTime ?? this.transactionTime,
      isSync: isSync ?? this.isSync,
      orderItems: orderItems ?? this.orderItems,
    );
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, paymentAmount: $paymentAmount, addressId: $addressId, subtotal: $subtotal, tax: $tax, discount: $discount, serviceCharge: $serviceCharge, total_cost: $total_cost, paymentMethod: $paymentMethod, totalItem: $totalItem, idKasir: $idKasir, namaKasir: $namaKasir, transactionTime: $transactionTime, isSync: $isSync, orderItems: $orderItems)';
  }
}
