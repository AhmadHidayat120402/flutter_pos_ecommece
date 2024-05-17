part of 'history_pos_bloc.dart';

@freezed
class HistoryPosEvent with _$HistoryPosEvent {
  const factory HistoryPosEvent.started() = _Started;
  const factory HistoryPosEvent.fetch() = _Fetch;
}