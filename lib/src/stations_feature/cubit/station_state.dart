part of 'station_cubit.dart';

@immutable
abstract class StationState {}

class Initial extends StationState {}

class FindingStations extends StationState {}

class FindingStationsSuccess extends StationState {
  final List<StationModel> stations;
  final StationModel? selectedStation;

  FindingStationsSuccess({required this.stations, this.selectedStation});
}

class FindingStationsFailed extends StationState {
  final String message;
  FindingStationsFailed(this.message);
}
