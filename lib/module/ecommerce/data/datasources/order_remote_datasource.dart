import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/order_response_model.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/models/order_model.dart';
import 'package:http/http.dart' as http;

import '../models/requests/order_request_model.dart';
import '../models/responses/history_order_response_model.dart';
import '../models/responses/order_detail_response_model.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${GlobalVariable.baseUrl}/api/order'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData?.accessToken}'
      },
      body: orderRequestModel.toJson().toString(),
    );
    print('request : ${orderRequestModel.toJson()}');
    print('response : $response');
    print('response status code : ${response.statusCode}');
    print('response body : ${response.body}');

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left("Internal Server Error");
    }
  }

  Future<bool> saveOrder(OrderModel orderModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${GlobalVariable.baseUrl}/api/orderApiPos'),
      body: orderModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${authData?.accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("request ${orderModel.toJson()}");
    print("response : $response");
    print("response status code : ${response.statusCode}");
    print("response body : ${response.body}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<Either<String, String>> checkPaymentStatus(int orderId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
        Uri.parse('${GlobalVariable.baseUrl}/api/order/status/$orderId'),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${authData?.accessToken}'
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return right(data['status']);
    } else {
      return left('Error');
    }
  }

  Future<Either<String, HistoryOrderResponseModel>> getOrders() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${GlobalVariable.baseUrl}/api/orders'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData?.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      final orderList = HistoryOrderResponseModel.fromJson(response.body);
      return right(orderList);
    } else {
      return left('Error');
    }
  }

  Future<Either<String, OrderDetailResponseModel>> getOrderById(
      int orderId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${GlobalVariable.baseUrl}/api/order/$orderId'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      final order = OrderDetailResponseModel.fromJson(response.body);
      return right(order);
    } else {
      return left('Error');
    }
  }
}
