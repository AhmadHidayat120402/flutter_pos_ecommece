part of 'pupuk_bloc.dart';

@freezed
class PupukEvent with _$PupukEvent {
  const factory PupukEvent.started() = _Started;
  const factory PupukEvent.getProductPupuk() = _GetProductPupuk;
}
