import 'dart:convert';

import 'package:api_manager/api_manager.dart';

import 'models/station_model.dart';

abstract class IStationService {
  /// Get stations from the some data source
  Future<List<StationModel>> getStations();
}

class StationService implements IStationService {
  final ApiManager _apiManager =
      ApiManager(); //Not injected for simplicity, but should be a shared apiClient

  StationService() {
    _apiManager.options.baseUrl = kStationApiBaseUrl;
  }
  static const String kStationApiBaseUrl =
      'https://raw.githubusercontent.com/TCS-DS/tcs-flutter-interview-stations/master/api/v1';
  static const String kStationsRoute = '/stations.json';

  @override
  Future<List<StationModel>> getStations() async {
    final getStationsReponse = await _apiManager.request<List<StationModel>>(
      requestType: RequestType.GET,
      route: kStationsRoute,
      responseBodySerializer: (jsonMap) {
        return List<StationModel>.from(
          json.decode(jsonMap).map(
                (x) => StationModel.fromMap(x),
              ),
        );
      },
    );

    if (getStationsReponse.status != ApiStatus.SUCCESS) {
      throwApiException(getStationsReponse);
    }

    return getStationsReponse.data!;
  }

  void throwApiException(ApiResponse response) {
    switch (response.statusCode) {
      //TODO: Handle/log more exceptions as needed.
      default:
        throw Exception('Error getting stations from API');
    }
  }
}

class MockStationService implements IStationService {
  @override
  Future<List<StationModel>> getStations() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => List<StationModel>.from(
        kMockStationsData.take(3).map((x) => StationModel.fromMap(x)),
      ),
    );
  }
}

const kMockStationsData = [
  {
    "id": "21a914c7-9da5-4906-b95c-b937746bb09a",
    "displayName": "Reuss-Garage",
    "brand": "AVIA",
    "formattedAddress": "Landstrasse, 5412 Gebenstorf",
    "location": {"lat": 47.48156, "lng": 8.240316},
    "providerInfo": {"id": "5294", "source": "AVIA"}
  },
  {
    "id": "26dd9f37-efb2-48d6-96a1-bc3df520dac3",
    "displayName": "Garage Zwicky AG",
    "brand": "AVIA",
    "formattedAddress": "Riedhofstr. 3, 8049 Zürich-Höngg",
    "location": {"lat": 47.403546, "lng": 8.496751},
    "providerInfo": {"id": "5334", "source": "AVIA"}
  },
  {
    "id": "4c83bdc3-b22e-4dd7-bbac-3347af311d5d",
    "displayName": "AVIA Shop Regensberg",
    "brand": "AVIA",
    "formattedAddress": "Regensbergstr. 309, 8050 Zürich-Affoltern",
    "location": {"lat": 47.411375, "lng": 8.526469},
    "providerInfo": {"id": "5335", "source": "AVIA"}
  },
  {
    "id": "2de9d6d4-e1e9-4482-aeee-b8e9bf87e031",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Buechmes 1, 8311 Brütten",
    "location": {"lat": 47.465439, "lng": 8.671174},
    "providerInfo": {"id": "6633", "source": "MIGROL"}
  },
  {
    "id": "179c78b4-60ca-427f-a153-b70e2007736c",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Pfynstrasse 36, 3952 Susten",
    "location": {"lat": 46.310981, "lng": 7.633554},
    "providerInfo": {"id": "6634", "source": "MIGROL"}
  },
  {
    "id": "e2f19010-bf09-4869-991c-d0ba4aec5ff2",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Vial di Curtin 23, 7742 Poschiavo",
    "location": {"lat": 46.319983, "lng": 10.059155},
    "providerInfo": {"id": "6635", "source": "MIGROL"}
  },
  {
    "id": "4f6bb94a-e802-41be-9917-8826128f979a",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Kempttalstrasse 73, 8320 Fehraltorf",
    "location": {"lat": 47.387599, "lng": 8.75316},
    "providerInfo": {"id": "6636", "source": "MIGROL"}
  },
  {
    "id": "3630337b-8f5b-4473-a424-d19122326555",
    "displayName": "Station-service Migrol",
    "brand": "MIGROL",
    "formattedAddress": "Rue de Vermont 4, 1202 Genève",
    "location": {"lat": 46.21523, "lng": 6.134479},
    "providerInfo": {"id": "6638", "source": "MIGROL"}
  },
  {
    "id": "03625286-c747-4863-9025-6db1ca6ae611",
    "displayName": "Station-service Migrol",
    "brand": "MIGROL",
    "formattedAddress": "Route de l'Industrie 33, 1791 Courtaman",
    "location": {"lat": 46.87117, "lng": 7.125763},
    "providerInfo": {"id": "6641", "source": "MIGROL"}
  },
  {
    "id": "16142228-ab5d-412a-959e-16716c011c85",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Tösstalstrasse 31, 8483 Kollbrunn",
    "location": {"lat": 47.457109, "lng": 8.772544},
    "providerInfo": {"id": "6642", "source": "MIGROL"}
  },
  {
    "id": "2ff0dce7-c1dc-44fc-89ab-d23f5abc0e95",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Zürcherstrasse 35, 4052 Basel",
    "location": {"lat": 47.553719, "lng": 7.608354},
    "providerInfo": {"id": "6643", "source": "MIGROL"}
  },
  {
    "id": "4a79fda9-2cf0-4f69-90b8-c731d892756c",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Fabrikstrasse 6, 4513 Langendorf",
    "location": {"lat": 47.218642, "lng": 7.513948},
    "providerInfo": {"id": "6644", "source": "MIGROL"}
  },
  {
    "id": "a4d5f0bd-8b1d-41dc-b69a-2680057cc4c8",
    "displayName": "Migrol Tankstelle",
    "brand": "MIGROL",
    "formattedAddress": "Buchlistrasse 1, 4704 Niederbipp",
    "location": {"lat": 47.268813, "lng": 7.687043},
    "providerInfo": {"id": "6645", "source": "MIGROL"}
  },
  {
    "id": "8a11a0cd-e0d2-4c68-a176-a9ce66d483b5",
    "displayName": "Moveri Gränichen",
    "brand": "SHELL",
    "formattedAddress": "Oberdorfstrasse 11, 5722 Gränichen",
    "location": {"lat": 47.35656, "lng": 8.102883},
    "providerInfo": {"id": "12495868", "source": "SHELL"}
  },
  {
    "id": "5c35669e-e7b0-45fa-9020-767c139e6703",
    "displayName": "Coop Pronto",
    "brand": "COOP",
    "formattedAddress": "Gotthardstrasse 23, 6414 Oberarth",
    "location": {"lat": 47.0572, "lng": 8.53381},
    "providerInfo": {"id": "3546", "source": "COOP"}
  },
  {
    "id": "1dd1cf5d-5f85-4eae-9d31-6b9941b90c1d",
    "displayName": "Coop Pronto",
    "brand": "COOP",
    "formattedAddress": "Bahnhofstrasse 156, 6423 Seewen",
    "location": {"lat": 47.028, "lng": 8.6314},
    "providerInfo": {"id": "3547", "source": "COOP"}
  },
  {
    "id": "152216ce-ae5e-4d6d-be64-3ff6ebf1f85b",
    "displayName": "Coop Pronto",
    "brand": "COOP",
    "formattedAddress": "Längfeldweg 43, 2504 Biel-Mett",
    "location": {"lat": 47.1496, "lng": 7.27644},
    "providerInfo": {"id": "3549", "source": "COOP"}
  }
];
