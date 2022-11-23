import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/src/stations_feature/index.dart';

/// View shown when no stations are found ie no result.
class StationsNotFoundView extends StatelessWidget {
  const StationsNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Strange... We couldn\'t find any stations',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: context.read<StationCubit>().findStations,
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
