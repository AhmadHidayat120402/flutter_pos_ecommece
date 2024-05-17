// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'pupuk_bloc.freezed.dart';
part 'pupuk_event.dart';
part 'pupuk_state.dart';

class PupukBloc extends Bloc<PupukEvent, PupukState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  PupukBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProductPupuk>((event, emit) async {
      emit(const _Loading());
      final response = await _productRemoteDatasource.getProductByCategory(3);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!)),
      );
    });
  }
}
