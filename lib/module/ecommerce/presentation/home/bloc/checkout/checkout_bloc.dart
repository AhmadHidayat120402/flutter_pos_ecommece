import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/discount_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/product_quantity.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded([], null, 0, '', '', 0, '')) {
    on<_AddItem>((event, emit) {
      final currentState = state as _Loaded;
      if (currentState.products
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.products
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.products[index];
        final newItem = item.copyWith(quantity: item.quantity + 1);
        final newItems =
            currentState.products.map((e) => e == item ? newItem : e).toList();
        emit(_Loaded(
            newItems,
            currentState.discount,
            currentState.addressId,
            currentState.paymentMethod,
            currentState.shippingService,
            currentState.shippingCost,
            currentState.shippingService));
      } else {
        final newItem = ProductQuantity(product: event.product, quantity: 1);
        final newItems = [...currentState.products, newItem];
        emit(_Loaded(
            newItems,
            currentState.discount,
            currentState.addressId,
            currentState.paymentMethod,
            currentState.shippingService,
            currentState.shippingCost,
            currentState.shippingService));
      }
    });

    on<_RemoveItem>((event, emit) {
      final currentState = state as _Loaded;
      if (currentState.products
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.products
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.products[index];
        //if quantity is 1, remove the item
        if (item.quantity == 1) {
          final newItems = currentState.products
              .where((element) => element.product.id != event.product.id)
              .toList();
          emit(_Loaded(
              newItems,
              currentState.discount,
              currentState.addressId,
              currentState.paymentMethod,
              currentState.shippingService,
              currentState.shippingCost,
              currentState.shippingService));
        } else {
          final newItem = item.copyWith(quantity: item.quantity - 1);
          final newItems = currentState.products
              .map((e) => e == item ? newItem : e)
              .toList();
          emit(_Loaded(
              newItems,
              currentState.discount,
              currentState.addressId,
              currentState.paymentMethod,
              currentState.shippingService,
              currentState.shippingCost,
              currentState.shippingService));
        }
      }
    });

    on<_AddAddressId>((event, emit) {
      final currentState = state as _Loaded;
      emit(_Loaded(
          currentState.products,
          currentState.discount,
          event.addressId,
          currentState.paymentMethod,
          currentState.shippingService,
          currentState.shippingCost,
          currentState.shippingService));
    });

    on<_AddPaymentMethod>((event, emit) {
      final currentState = state as _Loaded;
      emit(_Loaded(
          currentState.products,
          currentState.discount,
          currentState.addressId,
          'bank_transfer',
          currentState.shippingService,
          currentState.shippingCost,
          event.paymentMethod));
    });

    on<_AddShippingService>((event, emit) {
      final currentState = state as _Loaded;
      emit(_Loaded(
          currentState.products,
          currentState.discount,
          currentState.addressId,
          currentState.paymentMethod,
          event.shippingService,
          event.shippingCost,
          currentState.paymentMethod));
    });
    on<_Started>((event, emit) {
      emit(const _Loaded([], null, 0, '', '', 0, ''));
    });
  }
}
