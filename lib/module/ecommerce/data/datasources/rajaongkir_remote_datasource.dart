import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/city_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/subdistrict_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../models/responses/cost_response_model.dart';
import '../models/responses/province_response_model.dart';
import '../models/responses/tracking_response_model.dart';

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

  Future<Either<String, CostResponseModel>> getCost(
      String origin, String destination, String courier) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': GlobalVariable.rajaOngkirKey,
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': '1000',
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(CostResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  Future<Either<String, TrackingResponseModel>> getWaybill(
      String courier, String waybill) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/waybill');
    final response = await http.post(
      url,
      headers: {
        'key': GlobalVariable.rajaOngkirKey,
      },
      body: {
        'waybill': waybill,
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(TrackingResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }
}
