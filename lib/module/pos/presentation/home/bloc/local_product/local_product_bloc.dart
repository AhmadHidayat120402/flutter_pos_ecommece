// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';

part 'local_product_bloc.freezed.dart';
part 'local_product_event.dart';
part 'local_product_state.dart';

class LocalProductBloc extends Bloc<LocalProductEvent, LocalProductState> {
  final ProductLocalDatasource productLocalDatasource;
  List<Product> products = [];
  LocalProductBloc(
    this.productLocalDatasource,
  ) : super(const LocalProductState.initial()) {
    on<_GetLocalProduct>((event, emit) async {
      emit(const LocalProductState.loading());
      final result = await productLocalDatasource.getAllProduct();
      products = result;
      emit(LocalProductState.loaded(products));
    });

    on<_GetLocalProductByCategoryId>((event, emit) async {
      emit(const LocalProductState.loading());
      final newProducts = event.categoryId == 0
          ? products
          : products
              .where((element) => element.categoryId == event.categoryId)
              .toList();

      emit(LocalProductState.loaded(newProducts));
    });

    on<_AddProduct>((event, emit) async {
      emit(const LocalProductState.loading());
      final newProduct =
          await ProductLocalDatasource.instance.insertProduct(event.product);
      products.add(newProduct);

      emit(LocalProductState.loaded(products));
    });

    on<_SearchProduct>((event, emit) async {
      emit(const LocalProductState.loading());
      final newProducts = products
          .where((element) =>
              element.name!.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(LocalProductState.loaded(newProducts));
    });
    on<_FetchAllFromState>((event, emit) async {
      emit(const LocalProductState.loading());
      emit(LocalProductState.loaded(products));
    });
  }
}
