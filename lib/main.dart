import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/stations_feature/index.dart';

void main() async {
  // Run the app with options that can be pre-configured
  runApp(MyApp(appConfig: getAppConfig(useMock: false)));
}

AppConfig getAppConfig({bool useMock = false}) {
  WidgetsFlutterBinding.ensureInitialized();

  return AppConfig(
    // Set up the SettingsController, which will glue user settings to multiple
    // Flutter Widgets.
    settingsController: SettingsController(SettingsService()),
    //Initialize the StationCubit that UI widgets can
    //liisten to and rebuild accordingly.
    stationCubit: StationCubit(
      useMock ? MockStationService() : StationService(),
    ),
  );
}
