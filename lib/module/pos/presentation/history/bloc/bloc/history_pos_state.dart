part of 'history_pos_bloc.dart';

@freezed
class HistoryPosState with _$HistoryPosState {
  const factory HistoryPosState.initial() = _Initial;
  const factory HistoryPosState.loading() = _Loading;
  const factory HistoryPosState.loaded(List<OrderModel> histories) = _Loaded;
  const factory HistoryPosState.error(String message) = _Error;
}
