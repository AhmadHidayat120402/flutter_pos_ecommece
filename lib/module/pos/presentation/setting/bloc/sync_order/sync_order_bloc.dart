// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_local_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/order_remote_datasource.dart';

part 'sync_order_bloc.freezed.dart';
part 'sync_order_event.dart';
part 'sync_order_state.dart';

class SyncOrderBloc extends Bloc<SyncOrderEvent, SyncOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  SyncOrderBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_SyncOrder>((event, emit) async {
      emit(const _Loading());
      final dataOrderNotSynced =
          await ProductLocalDatasource.instance.getOrderByIsNotSync();
      for (var order in dataOrderNotSynced) {
        print("order : $order");
        final orderItem = await ProductLocalDatasource.instance
            .getOrderItemByOrderId(order.id!);
          
        print("order item : $orderItem");
        final newOrder = order.copyWith(orderItems: orderItem);
        print("new order : $newOrder");
        final result = await orderRemoteDatasource.saveOrder(newOrder);
        print("result : $result");
        if (result) {
          await ProductLocalDatasource.instance.updateOrderIsSync(order.id!);
          
        } else {
          emit(const _Error('Sync Order Failed'));
          return;
        }
      }
      emit(const _Loaded());
    });
  }
}
