// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProvinceResponseModel {
  final Rajaongkir? rajaongkir;

  ProvinceResponseModel({
    this.rajaongkir,
  });

  factory ProvinceResponseModel.fromJson(String str) =>
      ProvinceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceResponseModel.fromMap(Map<String, dynamic> json) =>
      ProvinceResponseModel(
        rajaongkir: json["rajaongkir"] == null
            ? null
            : Rajaongkir.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir?.toMap(),
      };
}

class Rajaongkir {
  final List<dynamic>? query;
  final Status? status;
  final List<Provinces>? results;

  Rajaongkir({
    this.query,
    this.status,
    this.results,
  });

  factory Rajaongkir.fromJson(String str) =>
      Rajaongkir.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rajaongkir.fromMap(Map<String, dynamic> json) => Rajaongkir(
        query: json["query"] == null
            ? []
            : List<dynamic>.from(json["query"]!.map((x) => x)),
        status: json["status"] == null ? null : Status.fromMap(json["status"]),
        results: json["results"] == null
            ? []
            : List<Provinces>.from(
                json["results"]!.map((x) => Provinces.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        "status": status?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Provinces {
  final String? provinceId;
  final String? province;

  Provinces({
    this.provinceId,
    this.province,
  });

  factory Provinces.fromJson(String str) => Provinces.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provinces.fromMap(Map<String, dynamic> json) => Provinces(
        provinceId: json["province_id"],
        province: json["province"],
      );

  Map<String, dynamic> toMap() => {
        "province_id": provinceId,
        "province": province,
      };

  @override
  String toString() => '$province';
}

class Status {
  final int? code;
  final String? description;

  Status({
    this.code,
    this.description,
  });

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
      };
}
