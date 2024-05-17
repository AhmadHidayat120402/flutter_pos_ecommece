import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_quantity.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/models/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../ecommerce/data/datasources/product_local_datasource.dart';

part 'order_pos_event.dart';
part 'order_pos_state.dart';
part 'order_pos_bloc.freezed.dart';

class OrderPosBloc extends Bloc<OrderPosEvent, OrderPosState> {
  OrderPosBloc() : super(const _Initial()) {
    on<_Order>((event, emit) async {
      emit(const _Loading());
      final subTotal = event.items.fold<int>(
          0,
          (previousValue, element) =>
              previousValue + (element.product.price! * element.quantity));

      final totalDiscount = (event.discount / 100) * subTotal;
      final total = subTotal - totalDiscount;

      // Print statements to debug
      print('SubTotal: $subTotal');
      print('Discount: $totalDiscount');
      print('Total after discount: $total');

      final totalItem = event.items.fold<int>(
          0, (previousValue, element) => previousValue + element.quantity);
      print('total item $totalItem');

      final userData = await AuthLocalDatasource().getAuthData();
      print('user data $userData');

      final dataInput = OrderModel(
        subtotal: subTotal,
        addressId: 1,
        paymentAmount: event.paymentAmount,
        tax: event.tax,
        discount: event.discount,
        serviceCharge: event.serviceCharge,
        total_cost: total.toInt(),
        paymentMethod: 'Cash',
        totalItem: totalItem,
        idKasir: userData!.user!.id!,
        namaKasir: userData.user!.name!,
        transactionTime: DateTime.now().toIso8601String(),
        isSync: 0,
        orderItems: event.items,
      );

      print("data input ${dataInput.toJson()}");

      print('total cost bloc $total');

      await ProductLocalDatasource.instance.saveOrder(dataInput);

      emit(_Loaded(
        dataInput,
      ));
    });

    on<_Started>((event, emit) {
      emit(const _Loading());

      final dataInput = OrderModel(
        subtotal: 0,
        addressId: 0,
        paymentAmount: 0,
        tax: 0,
        discount: 0,
        serviceCharge: 0,
        total_cost: 0,
        paymentMethod: '',
        totalItem: 0,
        idKasir: 0,
        namaKasir: '',
        transactionTime: '',
        isSync: 0,
        orderItems: [],
      );

      emit(_Loaded(dataInput));
    });
  }
}
