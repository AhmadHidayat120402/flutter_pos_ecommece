part of 'checkout_pos_bloc.dart';

@freezed
class CheckoutPosState with _$CheckoutPosState {
  const factory CheckoutPosState.initial() = _Initial;
  const factory CheckoutPosState.loading() = _Loading;
  const factory CheckoutPosState.loaded(List<ProductQuantity> items, Discount? discount,) = _Loaded;
  const factory CheckoutPosState.error(String message) = _Error;
}
