part of 'pupuk_bloc.dart';

@freezed
class PupukState with _$PupukState {
  const factory PupukState.initial() = _Initial;
  const factory PupukState.loading() = _Loading;
  const factory PupukState.loaded(List<Product> products) = _Loaded;
  const factory PupukState.error(final String message) = _Error;
}
