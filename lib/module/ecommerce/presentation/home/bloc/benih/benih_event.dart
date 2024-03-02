part of 'benih_bloc.dart';

@freezed
class BenihEvent with _$BenihEvent {
  const factory BenihEvent.started() = _Started;
  const factory BenihEvent.getProductBenih() = _GetProductBenih;
}
