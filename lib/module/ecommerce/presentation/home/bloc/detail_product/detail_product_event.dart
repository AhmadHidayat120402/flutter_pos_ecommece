part of 'detail_product_bloc.dart';

@freezed
class DetailProductEvent with _$DetailProductEvent {
  const factory DetailProductEvent.started() = _Started;
  const factory DetailProductEvent.getDetailProduct(Product product) = _GetDetailProduct;
  const factory DetailProductEvent.detailProduct(int productId) =
      _DetailProduct;
}
