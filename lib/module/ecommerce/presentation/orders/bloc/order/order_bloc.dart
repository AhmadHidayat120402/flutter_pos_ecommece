// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/order_remote_datasource.dart';

import '../../../../data/models/requests/order_request_model.dart';
import '../../../../data/models/responses/order_response_model.dart';
import '../../../home/models/product_quantity.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource _orderRemoteDatasource;
  OrderBloc(
    this._orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_DoOrder>((event, emit) async {
      emit(const _Loading());

      final subTotal = event.products.fold<int>(
          0,
          (previousValue, element) =>
              previousValue + (element.product.price! * element.quantity));

      final totalDiscount = (event.discount / 100) * subTotal;
      final total = subTotal - totalDiscount;

      final orderRequestData = OrderRequestModel(
          addressId: event.addressId,
          paymentMethod: event.paymentMethod,
          shippingService: event.shippingService,
          shippingCost: event.shippingCost,
          paymentVaName: event.paymentVaName,
          subtotal: subTotal,
          discount: event.discount,
          totalCost: total.toInt(),
          items: event.products
              .map((e) => Item(productId: e.product.id!, quantity: e.quantity))
              .toList());
      final response = await _orderRemoteDatasource.order(orderRequestData);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
