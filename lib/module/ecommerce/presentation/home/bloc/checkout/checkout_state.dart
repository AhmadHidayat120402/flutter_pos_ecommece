part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.loaded(
    List<ProductQuantity> products,
    Discount? discount,
    int addressId,
    String paymentMethod,
    String shippingService,
    int shippingCost,
    String paymentVaName,
  ) = _Loaded;
  const factory CheckoutState.error(final String message) = _Error;
}
