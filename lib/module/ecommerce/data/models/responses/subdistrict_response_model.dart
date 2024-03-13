// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubdistrictResponseModel {
  final Rajaongkir? rajaongkir;

  SubdistrictResponseModel({
    this.rajaongkir,
  });

  factory SubdistrictResponseModel.fromJson(String str) =>
      SubdistrictResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubdistrictResponseModel.fromMap(Map<String, dynamic> json) =>
      SubdistrictResponseModel(
        rajaongkir: json["rajaongkir"] == null
            ? null
            : Rajaongkir.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir?.toMap(),
      };
}

class Rajaongkir {
  final Query? query;
  final Status? status;
  final List<Subdistrict>? results;

  Rajaongkir({
    this.query,
    this.status,
    this.results,
  });

  factory Rajaongkir.fromJson(String str) =>
      Rajaongkir.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rajaongkir.fromMap(Map<String, dynamic> json) => Rajaongkir(
        query: json["query"] == null ? null : Query.fromMap(json["query"]),
        status: json["status"] == null ? null : Status.fromMap(json["status"]),
        results: json["results"] == null
            ? []
            : List<Subdistrict>.from(
                json["results"]!.map((x) => Subdistrict.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query?.toMap(),
        "status": status?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Query {
  final String? city;

  Query({
    this.city,
  });

  factory Query.fromJson(String str) => Query.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Query.fromMap(Map<String, dynamic> json) => Query(
        city: json["city"],
      );

  Map<String, dynamic> toMap() => {
        "city": city,
      };
}

class Subdistrict {
  final String? subdistrictId;
  final String? provinceId;
  final Province? province;
  final String? cityId;
  final City? city;
  final Type? type;
  final String? subdistrictName;

  Subdistrict({
    this.subdistrictId,
    this.provinceId,
    this.province,
    this.cityId,
    this.city,
    this.type,
    this.subdistrictName,
  });

  factory Subdistrict.fromJson(String str) =>
      Subdistrict.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subdistrict.fromMap(Map<String, dynamic> json) => Subdistrict(
        subdistrictId: json["subdistrict_id"],
        provinceId: json["province_id"],
        province: provinceValues.map[json["province"]],
        cityId: json["city_id"],
        city: cityValues.map[json["city"]],
        type: typeValues.map[json["type"]],
        subdistrictName: json["subdistrict_name"],
      );

  Map<String, dynamic> toMap() => {
        "subdistrict_id": subdistrictId,
        "province_id": provinceId,
        "province": provinceValues.reverse[province],
        "city_id": cityId,
        "city": cityValues.reverse[city],
        "type": typeValues.reverse[type],
        "subdistrict_name": subdistrictName,
      };

  @override
  String toString() {
    return '$subdistrictName';
  }
}

enum City { SLEMAN }

final cityValues = EnumValues({"Sleman": City.SLEMAN});

enum Province { DI_YOGYAKARTA }

final provinceValues = EnumValues({"DI Yogyakarta": Province.DI_YOGYAKARTA});

enum Type { KABUPATEN }

final typeValues = EnumValues({"Kabupaten": Type.KABUPATEN});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
