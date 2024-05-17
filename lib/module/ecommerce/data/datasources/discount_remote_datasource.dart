import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/discount_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class DiscountRemoteDatasource {
  Future<Either<String, DiscountResponseModel>> getDiscounts() async {
    final url = Uri.parse('${GlobalVariable.baseUrl}/api/api-discounts');
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData?.accessToken}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(DiscountResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get discounts');
    }
  }

  Future<Either<String, bool>> addDiscount(
    String name,
    String description,
    int value,
  ) async {
    final url = Uri.parse('${GlobalVariable.baseUrl}/api/api-discounts');
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authData?.accessToken}',
      'Accept': 'application/json',
    }, body: {
      'name': name,
      'description': description,
      'value': value.toString(),
      'type': 'percentage',
    });

    if (response.statusCode == 201) {
      return const Right(true);
    } else {
      return const Left('Failed to add discount');
    }
  }
}
