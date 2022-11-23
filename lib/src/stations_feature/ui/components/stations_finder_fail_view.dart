import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/src/stations_feature/index.dart';

/// View shown when find stations fails with an error.
class StationsFinderFailView extends StatelessWidget {
  const StationsFinderFailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationCubit, StationState>(
      buildWhen: (previous, current) => current is FindingStationsFailed,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              (state as FindingStationsFailed).message,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
