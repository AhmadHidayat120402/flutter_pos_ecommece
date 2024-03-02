import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/category_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class CategoryRemoteDatasource {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final response = await http.get(
      Uri.parse("${GlobalVariable.baseUrl}/api/categories"),
    );
    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return left("Internal Server Error");
    }
  }
}
