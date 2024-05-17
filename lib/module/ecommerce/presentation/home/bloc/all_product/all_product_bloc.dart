import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/requests/product_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'all_product_bloc.freezed.dart';
part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDatasource productRemoteDatasource;
  List<Product> products = [];

  AllProductBloc(
    this.productRemoteDatasource,
  ) : super(const AllProductState.initial()) {
    on<_GetAllProducts>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await productRemoteDatasource.getProducts();
      response.fold(
        (error) => emit(AllProductState.error(error.toString())),
        (result) {
          products = result.data ?? [];
          emit(AllProductState.loaded(products));
        },
      );
    });

    on<_GetAllProductsByCategory>((event, emit) async {
      emit(const AllProductState.loading());
      final newProducts = event.categoryId == 0
          ? products
          : products
              .where((element) => element.categoryId == event.categoryId)
              .toList();
      emit(AllProductState.loaded(newProducts));
    });

    on<_AddProduct>((event, emit) async {
      emit(const AllProductState.loading());
      final requestData = ProductRequestModel(
          id: event.product.id ?? 0,
          name: event.product.name ?? '',
          price: event.product.price ?? 0,
          stock: event.product.stock ?? 0,
          image: event.image,
          is_available: event.product.isAvailable ?? 0,
          description: event.product.description.toString(),
          category_id: event.product.categoryId ?? 0);
      final response = await productRemoteDatasource.addProduct(requestData);
      response.fold(
        (l) => emit(AllProductState.error(l)),
        (r) {
          products.add(r.data);
          emit(AllProductState.loaded(products));
        },
      );
      emit(AllProductState.loaded(products));
    });
    on<_UpdateProduct>((event, emit) async {
      emit(const AllProductState.loading());
      final requestData = ProductRequestModel(
          id: event.product.id ?? 0,
          name: event.product.name ?? '',
          price: event.product.price ?? 0,
          stock: event.product.stock ?? 0,
          image: event.image,
          is_available: event.product.isAvailable ?? 0,
          description: event.product.description.toString(),
          category_id: event.product.categoryId ?? 0);
      final response = await productRemoteDatasource.updateProduct(requestData);
      response.fold(
        (l) => emit(AllProductState.error(l)),
        (r) {
          add(const _GetAllProducts());
        },
      );
    });
  }
}
