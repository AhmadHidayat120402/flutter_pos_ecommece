import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/city_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/subdistrict_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../models/responses/province_response_model.dart';

class RajaongkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/province');
    final response = await http.get(url, headers: {
      'key': GlobalVariable.rajaOngkirKey,
    });
    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }

  Future<Either<String, CityResponseModel>> getCitiesByprovince(
      String provinceId) async {
    final url = Uri.parse(
      'https://pro.rajaongkir.com/api/city?province=$provinceId',
    );
    final response =
        await http.get(url, headers: {'key': GlobalVariable.rajaOngkirKey});
    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left("Internal Server Error");
    }
  }

  Future<Either<String, SubdistrictResponseModel>> getSubdistrictByCity(
      String cityId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(url, headers: {
      'key': GlobalVariable.rajaOngkirKey,
    });
    if (response.statusCode == 200) {
      return Right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return const Left("Internal Server Error");
    }
  }
}
