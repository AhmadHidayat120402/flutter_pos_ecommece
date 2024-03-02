part of 'benih_bloc.dart';

@freezed
class BenihState with _$BenihState {
  const factory BenihState.initial() = _Initial;
  const factory BenihState.loading() = _Loading;
  const factory BenihState.loaded(List<Product> products) = _Loaded;
  const factory BenihState.error(final String message) = _Error;
}
