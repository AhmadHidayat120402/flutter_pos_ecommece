// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'pestisida_bloc.freezed.dart';
part 'pestisida_event.dart';
part 'pestisida_state.dart';

class PestisidaBloc extends Bloc<PestisidaEvent, PestisidaState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  PestisidaBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProductPestisida>((event, emit) async {
      emit(const _Loading());
      final response = await _productRemoteDatasource.getProductByCategory(4);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!)),
      );
    });
  }
}
