part of 'alat_pertanian_bloc.dart';

@freezed
class AlatPertanianEvent with _$AlatPertanianEvent {
  const factory AlatPertanianEvent.started() = _Started;
  const factory AlatPertanianEvent.getProductAlatPertanian() =
      _GetProductAlatPertanian;
}
