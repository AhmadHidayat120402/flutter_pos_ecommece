part of 'pestisida_bloc.dart';

@freezed
class PestisidaEvent with _$PestisidaEvent {
  const factory PestisidaEvent.started() = _Started;
  const factory PestisidaEvent.getProductPestisida() = _GetProductPestisida;
}
