// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'alat_pertanian_bloc.freezed.dart';
part 'alat_pertanian_event.dart';
part 'alat_pertanian_state.dart';

class AlatPertanianBloc extends Bloc<AlatPertanianEvent, AlatPertanianState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  AlatPertanianBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProductAlatPertanian>((event, emit) async {
      emit(const _Loading());
      final response = await _productRemoteDatasource.getProductByCategory(5);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!.data!)),
      );
    });
  }
}
