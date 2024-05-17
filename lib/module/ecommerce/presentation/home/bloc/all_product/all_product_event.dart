part of 'all_product_bloc.dart';

@freezed
class AllProductEvent with _$AllProductEvent {
  const factory AllProductEvent.started() = _Started;
  const factory AllProductEvent.getAllProducts() = _GetAllProducts;
  const factory AllProductEvent.getAllProductsByCategory(int categoryId) = _GetAllProductsByCategory;
  const factory AllProductEvent.updateProduct(Product product, XFile? image) = _UpdateProduct;
  const factory AllProductEvent.addProduct(Product product, XFile image) = _AddProduct;

}
