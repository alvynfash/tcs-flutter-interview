import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/src/stations_feature/index.dart';

/// Displays detailed information about a Station.
class StationDetailsView extends StatelessWidget {
  static const routeName = '/stationDetailsView';

  const StationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<StationCubit, StationState>(
        buildWhen: (previous, current) => current is FindingStationsSuccess,
        builder: (context, state) {
          final station = (state as FindingStationsSuccess).selectedStation!;

          return ListView(
            restorationId: 'stationDetailListView',
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Name: \n${station.displayName}'),
                    const SizedBox(height: 16),
                    Text('Address: \n${station.formattedAddress}'),
                    const SizedBox(height: 16),
                    Text('Brand: \n${station.brand}'),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('BrandIcon:'),
                        Image.asset(
                          station.brandIcon,
                          width: 35,
                          height: 35,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('ID: \n${station.id}'),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: Image.network(
                        station.stationMapUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
