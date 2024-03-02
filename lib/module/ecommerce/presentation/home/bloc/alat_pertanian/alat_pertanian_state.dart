part of 'alat_pertanian_bloc.dart';

@freezed
class AlatPertanianState with _$AlatPertanianState {
  const factory AlatPertanianState.initial() = _Initial;
  const factory AlatPertanianState.loading() = _Loading;
  const factory AlatPertanianState.loaded(List<Product> products) = _Loaded;
  const factory AlatPertanianState.error(final String message) = _Error;
}
