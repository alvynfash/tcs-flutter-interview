import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_interview/src/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';
import 'splash_screen.dart';
import 'stations_feature/index.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appConfig,
  });

  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    //Perform a series of initialization steps needed for the app to run correctly
    //This could include loading settings, fetching data from a server, updating translations etc.
    return FutureBuilder(
        future: appConfig.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SplashScreen(); //Show a splash screen while waiting for initialization to complete
          }

          // Glue the now initialized required components to the MaterialApp.
          //
          // The AnimatedBuilder Widget listens to the SettingsController for changes.
          // Whenever the user updates their settings, the MaterialApp is rebuilt.
          return AnimatedBuilder(
            animation: appConfig.settingsController,
            builder: (BuildContext context, Widget? child) {
              return RepositoryProvider(
                create: (context) => appConfig.stationCubit,
                child: MaterialApp(
                  // Providing a restorationScopeId allows the Navigator built by the
                  // MaterialApp to restore the navigation stack when a user leaves and
                  // returns to the app after it has been killed while running in the
                  // background.
                  restorationScopeId: 'app',

                  // Provide the generated AppLocalizations to the MaterialApp. This
                  // allows descendant Widgets to display the correct translations
                  // depending on the user's locale.
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', ''), // English, no country code
                  ],

                  // Use AppLocalizations to configure the correct application title
                  // depending on the user's locale.
                  //
                  // The appTitle is defined in .arb files found in the localization
                  // directory.
                  onGenerateTitle: (BuildContext context) =>
                      AppLocalizations.of(context)!.appTitle,

                  // Define a light and dark color theme. Then, read the user's
                  // preferred ThemeMode (light, dark, or system default) from the
                  // SettingsController to display the correct theme.
                  theme: AppTheme().lightTheme,
                  darkTheme: AppTheme().darkTheme,
                  themeMode: appConfig.settingsController.themeMode,
                  // Define a function to handle named routes in order to support
                  // Flutter web url navigation and deep linking.
                  onGenerateRoute: (RouteSettings routeSettings) {
                    return MaterialPageRoute<void>(
                      settings: routeSettings,
                      builder: (BuildContext context) {
                        switch (routeSettings.name) {
                          case SettingsView.routeName:
                            return SettingsView(
                              controller: appConfig.settingsController,
                            );
                          case StationDetailsView.routeName:
                            return const StationDetailsView();
                          case StationsFinderView.routeName:
                            return const StationsFinderView();
                          default:
                            return const Center(
                              child: Text('Unknown route'),
                            );
                        }
                      },
                    );
                  },
                ),
              );
            },
          );
        });
  }
}

/// The AppConfig class is used to provide the required components to the MyApp
class AppConfig {
  final SettingsController settingsController;
  final StationCubit stationCubit;

  AppConfig({
    required this.settingsController,
    required this.stationCubit,
  });

  /// Ensures needed steps for app to run correctly are completed
  /// before the app is shown to the user.
  Future init() {
    return settingsController
        .loadSettings()
        .then((value) => stationCubit.findStations());
  }
}
