// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StationState {

 int get selectedIndex; Station? get station; Station? get playStation; double get nonMuteVolume; bool get isMute;
/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationStateCopyWith<StationState> get copyWith => _$StationStateCopyWithImpl<StationState>(this as StationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StationState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.station, station) || other.station == station)&&(identical(other.playStation, playStation) || other.playStation == playStation)&&(identical(other.nonMuteVolume, nonMuteVolume) || other.nonMuteVolume == nonMuteVolume)&&(identical(other.isMute, isMute) || other.isMute == isMute));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex,station,playStation,nonMuteVolume,isMute);

@override
String toString() {
  return 'StationState(selectedIndex: $selectedIndex, station: $station, playStation: $playStation, nonMuteVolume: $nonMuteVolume, isMute: $isMute)';
}


}

/// @nodoc
abstract mixin class $StationStateCopyWith<$Res>  {
  factory $StationStateCopyWith(StationState value, $Res Function(StationState) _then) = _$StationStateCopyWithImpl;
@useResult
$Res call({
 int selectedIndex, Station? station, Station? playStation, double nonMuteVolume, bool isMute
});


$StationCopyWith<$Res>? get station;$StationCopyWith<$Res>? get playStation;

}
/// @nodoc
class _$StationStateCopyWithImpl<$Res>
    implements $StationStateCopyWith<$Res> {
  _$StationStateCopyWithImpl(this._self, this._then);

  final StationState _self;
  final $Res Function(StationState) _then;

/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedIndex = null,Object? station = freezed,Object? playStation = freezed,Object? nonMuteVolume = null,Object? isMute = null,}) {
  return _then(_self.copyWith(
selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,station: freezed == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as Station?,playStation: freezed == playStation ? _self.playStation : playStation // ignore: cast_nullable_to_non_nullable
as Station?,nonMuteVolume: null == nonMuteVolume ? _self.nonMuteVolume : nonMuteVolume // ignore: cast_nullable_to_non_nullable
as double,isMute: null == isMute ? _self.isMute : isMute // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get station {
    if (_self.station == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.station!, (value) {
    return _then(_self.copyWith(station: value));
  });
}/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get playStation {
    if (_self.playStation == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.playStation!, (value) {
    return _then(_self.copyWith(playStation: value));
  });
}
}


/// Adds pattern-matching-related methods to [StationState].
extension StationStatePatterns on StationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StationState value)  $default,){
final _that = this;
switch (_that) {
case _StationState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StationState value)?  $default,){
final _that = this;
switch (_that) {
case _StationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedIndex,  Station? station,  Station? playStation,  double nonMuteVolume,  bool isMute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StationState() when $default != null:
return $default(_that.selectedIndex,_that.station,_that.playStation,_that.nonMuteVolume,_that.isMute);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedIndex,  Station? station,  Station? playStation,  double nonMuteVolume,  bool isMute)  $default,) {final _that = this;
switch (_that) {
case _StationState():
return $default(_that.selectedIndex,_that.station,_that.playStation,_that.nonMuteVolume,_that.isMute);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedIndex,  Station? station,  Station? playStation,  double nonMuteVolume,  bool isMute)?  $default,) {final _that = this;
switch (_that) {
case _StationState() when $default != null:
return $default(_that.selectedIndex,_that.station,_that.playStation,_that.nonMuteVolume,_that.isMute);case _:
  return null;

}
}

}

/// @nodoc


class _StationState implements StationState {
  const _StationState({this.selectedIndex = -1, this.station = null, this.playStation = null, this.nonMuteVolume = 0, this.isMute = false});
  

@override@JsonKey() final  int selectedIndex;
@override@JsonKey() final  Station? station;
@override@JsonKey() final  Station? playStation;
@override@JsonKey() final  double nonMuteVolume;
@override@JsonKey() final  bool isMute;

/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationStateCopyWith<_StationState> get copyWith => __$StationStateCopyWithImpl<_StationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StationState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.station, station) || other.station == station)&&(identical(other.playStation, playStation) || other.playStation == playStation)&&(identical(other.nonMuteVolume, nonMuteVolume) || other.nonMuteVolume == nonMuteVolume)&&(identical(other.isMute, isMute) || other.isMute == isMute));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex,station,playStation,nonMuteVolume,isMute);

@override
String toString() {
  return 'StationState(selectedIndex: $selectedIndex, station: $station, playStation: $playStation, nonMuteVolume: $nonMuteVolume, isMute: $isMute)';
}


}

/// @nodoc
abstract mixin class _$StationStateCopyWith<$Res> implements $StationStateCopyWith<$Res> {
  factory _$StationStateCopyWith(_StationState value, $Res Function(_StationState) _then) = __$StationStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedIndex, Station? station, Station? playStation, double nonMuteVolume, bool isMute
});


@override $StationCopyWith<$Res>? get station;@override $StationCopyWith<$Res>? get playStation;

}
/// @nodoc
class __$StationStateCopyWithImpl<$Res>
    implements _$StationStateCopyWith<$Res> {
  __$StationStateCopyWithImpl(this._self, this._then);

  final _StationState _self;
  final $Res Function(_StationState) _then;

/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedIndex = null,Object? station = freezed,Object? playStation = freezed,Object? nonMuteVolume = null,Object? isMute = null,}) {
  return _then(_StationState(
selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,station: freezed == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as Station?,playStation: freezed == playStation ? _self.playStation : playStation // ignore: cast_nullable_to_non_nullable
as Station?,nonMuteVolume: null == nonMuteVolume ? _self.nonMuteVolume : nonMuteVolume // ignore: cast_nullable_to_non_nullable
as double,isMute: null == isMute ? _self.isMute : isMute // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get station {
    if (_self.station == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.station!, (value) {
    return _then(_self.copyWith(station: value));
  });
}/// Create a copy of StationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get playStation {
    if (_self.playStation == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.playStation!, (value) {
    return _then(_self.copyWith(playStation: value));
  });
}
}

// dart format on
