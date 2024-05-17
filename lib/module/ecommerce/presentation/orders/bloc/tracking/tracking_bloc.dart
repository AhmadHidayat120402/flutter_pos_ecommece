// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/tracking_response_model.dart';

part 'tracking_bloc.freezed.dart';
part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  TrackingBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetTracking>((event, emit) async {
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getWaybill(
          event.kurir, event.noResi);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
