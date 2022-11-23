import 'dart:convert';

List<StationModel> stationModelFromMap(String str) => List<StationModel>.from(
    json.decode(str).map((x) => StationModel.fromMap(x)));

String stationModelToMap(List<StationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class StationModel {
  StationModel({
    required this.id,
    required this.displayName,
    required this.brand,
    required this.formattedAddress,
    required this.location,
    required this.providerInfo,
  });

  final String id;
  final String displayName;
  final String brand;
  final String formattedAddress;
  final Location location;
  final ProviderInfo providerInfo;

  factory StationModel.fromMap(Map<String, dynamic> json) => StationModel(
        id: json["id"],
        displayName: json["displayName"],
        brand: json["brand"],
        formattedAddress: json["formattedAddress"],
        location: Location.fromMap(json["location"]),
        providerInfo: ProviderInfo.fromMap(json["providerInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "displayName": displayName,
        "brand": brand,
        "formattedAddress": formattedAddress,
        "location": location.toMap(),
        "providerInfo": providerInfo.toMap(),
      };
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}

class ProviderInfo {
  ProviderInfo({
    required this.id,
    required this.source,
  });

  final String id;
  final String source;

  factory ProviderInfo.fromMap(Map<String, dynamic> json) => ProviderInfo(
        id: json["id"],
        source: json["source"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "source": source,
      };
}

// Extensions for handy computed properties on the model.
extension StationModelExtensions on StationModel {
  /// Returns the URL for the station map using the Google Static Maps API.
  String get stationMapUrl {
    return "https://maps.googleapis.com/maps/api/staticmap?center=${location.lat},${location.lng}&zoom=16&size=400x400&markers=46.2206341,6.0953057&key=AIzaSyBaNFBy7hqpV97IIHfoRnaAPplLCWIxrVI";
  }

  /// returns path to the corresponding bundled brandIcon or default brandIcon
  /// as fallback.
  String get brandIcon {
    switch (brand) {
      case 'AVIA':
        return 'assets/images/avia.png';
      case 'MIGROL':
        return 'assets/images/migrol.png';

      default:
        return 'assets/images/default.png';
    }
  }
}
