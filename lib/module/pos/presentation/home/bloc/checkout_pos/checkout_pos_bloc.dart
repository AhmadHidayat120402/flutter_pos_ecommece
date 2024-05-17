import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/discount_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/product_quantity.dart';

part 'checkout_pos_event.dart';
part 'checkout_pos_state.dart';
part 'checkout_pos_bloc.freezed.dart';

class CheckoutPosBloc extends Bloc<CheckoutPosEvent, CheckoutPosState> {
  CheckoutPosBloc() : super(const _Loaded([], null)) {
    on<_AddItem>((event, emit) {
      var currentState = state as _Loaded;
      List<ProductQuantity> items = [...currentState.items];
      var index =
          items.indexWhere((element) => element.product.id == event.product.id);
      emit(const _Loading());
      if (index != -1) {
        items[index] = ProductQuantity(
            product: event.product, quantity: items[index].quantity + 1);
      } else {
        items.add(ProductQuantity(product: event.product, quantity: 1));
      }
      emit(_Loaded(items, currentState.discount));
    });

    on<_RemoveItem>((event, emit) {
      var currentState = state as _Loaded;
      List<ProductQuantity> items = [...currentState.items];
      var index =
          items.indexWhere((element) => element.product.id == event.product.id);
      emit(const _Loading());
      if (index != -1) {
        if (items[index].quantity > 1) {
          items[index] = ProductQuantity(
              product: event.product, quantity: items[index].quantity - 1);
        } else {
          items.removeAt(index);
        }
      }
      emit(_Loaded(items, currentState.discount));
    });

    on<_Started>((event, emit) {
      emit(const _Loaded([], null));
    });

    on<_AddDiscount>((event, emit) {
      var currentState = state as _Loaded;
      emit(_Loaded(currentState.items, event.discount));
    });

    on<_RemoveDiscount>((event, emit) {
      var currentState = state as _Loaded;
      emit(_Loaded(currentState.items, null));
    });
  }
}
