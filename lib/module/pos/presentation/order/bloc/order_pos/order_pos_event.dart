part of 'order_pos_bloc.dart';

@freezed
class OrderPosEvent with _$OrderPosEvent {
  const factory OrderPosEvent.started() = _Started;
  const factory OrderPosEvent.order(List<ProductQuantity> items,
    int discount,
    int tax,
    int serviceCharge,
    int paymentAmount,) = _Order;
}