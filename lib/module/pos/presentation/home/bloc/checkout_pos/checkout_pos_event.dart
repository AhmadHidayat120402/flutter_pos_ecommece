part of 'checkout_pos_bloc.dart';

@freezed
class CheckoutPosEvent with _$CheckoutPosEvent {
  const factory CheckoutPosEvent.started() = _Started;
  const factory CheckoutPosEvent.addItem(Product product) = _AddItem;
  const factory CheckoutPosEvent.removeItem(Product product) = _RemoveItem;
  const factory CheckoutPosEvent.addDiscount(Discount discount) = _AddDiscount;
  const factory CheckoutPosEvent.removeDiscount() = _RemoveDiscount;
}