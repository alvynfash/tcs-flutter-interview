import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/src/stations_feature/index.dart';

/// View shown when stations found.
class StationsFoundView extends StatelessWidget {
  const StationsFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationCubit, StationState>(
      buildWhen: (previous, current) => current is FindingStationsSuccess,
      builder: (context, state) {
        final stations = (state as FindingStationsSuccess).stations;

        return ListView.separated(
          restorationId: 'stationListView',
          itemCount: stations.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final station = stations[index];

            return ListTile(
              title: Text(station.displayName),
              subtitle: Text(station.formattedAddress),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(station.brandIcon),
              ),
              onTap: () {
                context.read<StationCubit>().selectStation(station);
                Navigator.restorablePushNamed(
                  context,
                  StationDetailsView.routeName,
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    );
  }
}
