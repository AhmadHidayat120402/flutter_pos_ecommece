part of 'order_pos_bloc.dart';

@freezed
class OrderPosState with _$OrderPosState {
  const factory OrderPosState.initial() = _Initial;
  const factory OrderPosState.loading() = _Loading;
  const factory OrderPosState.loaded(OrderModel orderModel)
      = _Loaded;
  const factory OrderPosState.error(String message) = _Error;
}
