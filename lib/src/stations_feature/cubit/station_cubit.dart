import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/index.dart';

part 'station_state.dart';

class StationCubit extends Cubit<StationState> {
  final IStationService _stationService;

  StationCubit(this._stationService) : super(Initial());

  void findStations() async {
    emit(FindingStations());
    _stationService.getStations().then((result) {
      emit(
        FindingStationsSuccess(
          stations: result
            ..sort((a, b) =>
                a.displayName.compareTo(b.displayName)), //sort by displayName
        ),
      );
    }).catchError((error) {
      emit(FindingStationsFailed(error.toString()));
    });
  }

  void selectStation(StationModel station) {
    emit(FindingStationsSuccess(
      stations: (state as FindingStationsSuccess).stations,
      selectedStation: station,
    ));
  }
}
