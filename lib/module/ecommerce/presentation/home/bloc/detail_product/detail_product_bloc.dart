// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/order_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/detail_product_response_model.dart';

part 'detail_product_bloc.freezed.dart';
part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final ProductRemoteDatasource productRemoteDatasource;
  DetailProductBloc(
    this.productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_DetailProduct>((event, emit) async {
      emit(const _Loading());
      final response =
          await productRemoteDatasource.getDetailProductByid(event.productId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.detailProduct!)),
      );
    });
  }
}
