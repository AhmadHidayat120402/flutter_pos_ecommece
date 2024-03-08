import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/requests/address_request_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/address_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AddressRemoteDatasource {
  Future<Either<String, AddressResponseModel>> getAddress() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${GlobalVariable.baseUrl}/api/addresses'),
      headers: {
        'Authorization': 'Bearer ${authData?.accessToken}',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Right(AddressResponseModel.fromJson(response.body));
    } else {
      return const Left("Internal Server Error");
    }
  }

  Future<Either<String, String>> addAddress(AddressRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${GlobalVariable.baseUrl}/api/addresses'),
      headers: {
        'Authorization': 'Bearer ${authData?.accessToken}',
        'Accept': 'application/json',
      },
      body: data.toJson(),
    );
    if (response.statusCode == 201) {
      return const Right("Success");
    } else {
      return const Left("Error");
    }
  }
}
