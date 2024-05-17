// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/cost_response_model.dart';

part 'cost_bloc.freezed.dart';
part 'cost_event.dart';
part 'cost_state.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  final RajaongkirRemoteDatasource _rajaongkirRemoteDatasource;
  CostBloc(
    this._rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCost>((event, emit) async {
      emit(const _Loading());
      final response = await _rajaongkirRemoteDatasource.getCost(
        event.origin,
        event.destination,
        'jne',
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
