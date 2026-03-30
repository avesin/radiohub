// location_repository.dart
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:radioapp/core/data/station.dart';

class LocationData {
  final Position position;
  final Placemark placemark;

  LocationData({required this.position, required this.placemark});
}

class LocationRepository {
  Future<LocationData> getLocations() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception("Permission denied");
    }

    final position = await Geolocator.getCurrentPosition();

    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    return LocationData(position: position, placemark: placemarks.first);
  }
}

class RadioRepository {
  final Dio dio;

  RadioRepository(this.dio);

  Future<List<Station>> fetchStations(
    String country,
    double? latitude,
    double? longitude,
  ) async {
    final response = await dio.get(
      "/json/stations/search",
      queryParameters: {"country": country},
    );

    final List data = response.data;
    final stations = data.map((e) => Station.fromJson(e)).toList();

    List<Station> sortedStations = [];
    if (latitude != null && longitude != null) {
      for (var station in stations) {
        if (station.geoLat != null &&
            station.geoLong != null &&
            station.geoLat != 0 &&
            station.geoLong != 0) {
          final distance = Geolocator.distanceBetween(
            latitude,
            longitude,
            station.geoLat ?? 0,
            station.geoLong ?? 0,
          );
          station = station.copyWith(geoDistance: distance);
        }

        sortedStations.add(station);
      }

      sortedStations.sort((a, b) {
        final distanceA = a.geoDistance ?? double.infinity;
        final distanceB = b.geoDistance ?? double.infinity;
        final c = distanceA.compareTo(distanceB);
        return c;
      });
    }

    return sortedStations;
  }
}

class BookmarkRepository {
  final EncryptedSharedPreferences prefs;
  static const key = "bookmark_";

  BookmarkRepository({required this.prefs});

  void addBookmark(Station station) async {
    await prefs.setString(getKey(station), jsonEncode(station.toJson()));
  }

  StreamSubscription<String> onBookmarkChanged(void Function(String) callback) {
    return prefs.stream.listen((event) {
      if (event.startsWith(key)) {
        callback(event);
      }
    });
  }

  String getKey(Station station) {
    return "$key${station.stationuuid}";
  }

  void removeBookmark(Station station) {
    prefs.remove(getKey(station));
  }

  bool isBookmarked(Station station) {
    final keys = prefs.getKeys();
    return keys.contains(getKey(station));
  }

  void toggleBookmark(Station station) {
    if (isBookmarked(station)) {
      removeBookmark(station);
    } else {
      addBookmark(station);
    }
  }

  List<Station> getBookmarks() {
    List<Station> bookmarks = [];
    List<String> keys = prefs
        .getKeys()
        .where((value) => value.startsWith(key))
        .toList();
    for (var k in keys) {
      final stationJson = prefs.getString(k);
      if (stationJson != null) {
        bookmarks.add(Station.fromJson(jsonDecode(stationJson)));
      }
    }
    return bookmarks;
  }

  void reloadBookmarks() {
    List<Station> bookmarks = getBookmarks();
    clearBookmarks();
    for (var station in bookmarks) {
      addBookmark(station);
    }
  }

  void clearBookmarks() {
    prefs.removeWhere(condition: (k, v) => k.startsWith(key));
  }
}
