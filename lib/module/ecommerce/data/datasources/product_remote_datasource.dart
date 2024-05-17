import 'dart:convert';

import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/add_product_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/address_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/detail_product_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../models/requests/product_request_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http
        .get(Uri.parse("${GlobalVariable.baseUrl}/api/products"), headers: {
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left("Internal Server Error");
    }
  }

  Future<Either<String, ProductResponseModel>> getProductByCategory(
      int categoryId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
        Uri.parse(
            "${GlobalVariable.baseUrl}/api/products?category_id=$categoryId"),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Right(ProductResponseModel.fromMap(data));
    } else {
      return const Left("Internal Server Error");
    }
  }

  Future<Either<String, DetailProductResponseModel>> getDetailProductByid(
      int productId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
        Uri.parse("${GlobalVariable.baseUrl}/api/products/$productId"),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      return Right(
        DetailProductResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return const Left("Internal Server Error");
    }
  }

  Future<Either<String, AddProductResponseModel>> addProduct(
      ProductRequestModel productRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${GlobalVariable.baseUrl}/api/products'));
    request.fields.addAll(productRequestModel.toMap());
    request.files.add(await http.MultipartFile.fromPath(
        'image', productRequestModel.image!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return right(AddProductResponseModel.fromJson(body));
    } else {
      return left(body);
    }
  }

  Future<Either<String, bool>> updateProduct(
      ProductRequestModel productRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    if (productRequestModel.image == null) {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.put(
        Uri.parse(
            "${GlobalVariable.baseUrl}/api/products/${productRequestModel.id}"),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
        body: productRequestModel.toJson(),
      );
      print(productRequestModel.toJson());
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Left("Internal Server Error");
      }
    } else {
      var request = http.MultipartRequest(
          'PUT',
          Uri.parse(
              '${GlobalVariable.baseUrl}/api/products/${productRequestModel.id}'));
      request.fields.addAll(productRequestModel.toMap());

      print((productRequestModel.toMap()));

      request.files.add(await http.MultipartFile.fromPath(
          'image', productRequestModel.image!.path));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final String body = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(body);
      }
    }
  }
}
