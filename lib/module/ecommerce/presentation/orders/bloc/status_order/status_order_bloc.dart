// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/order_remote_datasource.dart';

part 'status_order_bloc.freezed.dart';
part 'status_order_event.dart';
part 'status_order_state.dart';

class StatusOrderBloc extends Bloc<StatusOrderEvent, StatusOrderState> {
  final OrderRemoteDatasource _orderRemoteDatasource;
  StatusOrderBloc(
    this._orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CheckPaymentStatus>((event, emit) async {
      emit(const StatusOrderState.loading());
      final result =
          await _orderRemoteDatasource.checkPaymentStatus(event.orderId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
