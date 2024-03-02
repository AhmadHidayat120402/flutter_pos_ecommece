part of 'pestisida_bloc.dart';

@freezed
class PestisidaState with _$PestisidaState {
  const factory PestisidaState.initial() = _Initial;
  const factory PestisidaState.loading() = _Loading;
  const factory PestisidaState.loaded(List<Product> products) = _Loaded;
  const factory PestisidaState.error(final String message) = _Error;
}
