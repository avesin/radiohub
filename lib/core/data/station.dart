import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
abstract class Station with _$Station {
  const factory Station({
    @Default("") String changeuuid,
    @Default("") String stationuuid,
    String? serveruuid,

    @Default("") String name,
    @Default("") String url,

    @JsonKey(name: 'url_resolved') @Default("") String urlResolved,

    @Default("") String homepage,
    @Default("") String favicon,
    @Default("") String tags,

    @Default("") String country,
    @Default("") String countrycode,
    @Default("") String iso31662,

    @Default("") String state,
    @Default("") String language,
    @Default("") String languagecodes,

    @Default(0) int votes,

    @Default("") String lastchangetime,
    @Default("") String lastchangetimeIso8601,

    @Default("") String codec,
    @Default(0) int bitrate,
    @Default(0) int hls,

    @Default(0) int lastcheckok,
    @Default("") String lastchecktime,
    @Default("") String lastchecktimeIso8601,

    @Default("") String lastcheckoktime,
    @Default("") String lastcheckoktimeIso8601,

    @Default("") String lastlocalchecktime,
    @JsonKey(name: 'lastlocalchecktime_iso8601')
    @Default("")
    String lastlocalchecktimeIso8601,

    @Default("") String clicktimestamp,
    @JsonKey(name: 'clicktimestamp_iso8601') String? clicktimestampIso8601,

    @Default(0) int clickcount,
    @Default(0) int clicktrend,
    @JsonKey(name: 'ssl_error') @Default(0) int sslError,

    @JsonKey(name: 'geo_lat') double? geoLat,
    @JsonKey(name: 'geo_long') double? geoLong,
    @JsonKey(name: 'geo_distance') double? geoDistance,

    @JsonKey(name: 'has_extended_info') @Default(false) bool hasExtendedInfo,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}
