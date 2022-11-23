import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/src/stations_feature/index.dart';

import '../../settings/settings_view.dart';

/// Main page for finding/displaying Stations.
class StationsFinderView extends StatelessWidget {
  const StationsFinderView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stations Finder'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<StationCubit>().findStations,
        child: const Icon(Icons.refresh),
      ),
      body: BlocBuilder<StationCubit, StationState>(
        builder: (context, state) {
          if (state is FindingStationsFailed) {
            return const StationsFinderFailView();
          }

          if (state is FindingStationsSuccess) {
            return state.stations.isEmpty
                ? const StationsNotFoundView()
                : const StationsFoundView();
          }

          return const StationLoadingView();
        },
      ),
    );
  }
}
