part of 'subdistrict_bloc.dart';

@freezed
class SubdistrictEvent with _$SubdistrictEvent {
  const factory SubdistrictEvent.started() = _Started;
  const factory SubdistrictEvent.getSubdistrictsByCity(String cityId) =
      _GetSubdistrict;
}
