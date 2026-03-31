// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 int get currentIndex; int? get selectedCountryIndex; String? get selectedCountry; LocationData? get location; List<String> get countries; String? get locationError;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.selectedCountryIndex, selectedCountryIndex) || other.selectedCountryIndex == selectedCountryIndex)&&(identical(other.selectedCountry, selectedCountry) || other.selectedCountry == selectedCountry)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.countries, countries)&&(identical(other.locationError, locationError) || other.locationError == locationError));
}


@override
int get hashCode => Object.hash(runtimeType,currentIndex,selectedCountryIndex,selectedCountry,location,const DeepCollectionEquality().hash(countries),locationError);

@override
String toString() {
  return 'DashboardState(currentIndex: $currentIndex, selectedCountryIndex: $selectedCountryIndex, selectedCountry: $selectedCountry, location: $location, countries: $countries, locationError: $locationError)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 int currentIndex, int? selectedCountryIndex, String? selectedCountry, LocationData? location, List<String> countries, String? locationError
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentIndex = null,Object? selectedCountryIndex = freezed,Object? selectedCountry = freezed,Object? location = freezed,Object? countries = null,Object? locationError = freezed,}) {
  return _then(_self.copyWith(
currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedCountryIndex: freezed == selectedCountryIndex ? _self.selectedCountryIndex : selectedCountryIndex // ignore: cast_nullable_to_non_nullable
as int?,selectedCountry: freezed == selectedCountry ? _self.selectedCountry : selectedCountry // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationData?,countries: null == countries ? _self.countries : countries // ignore: cast_nullable_to_non_nullable
as List<String>,locationError: freezed == locationError ? _self.locationError : locationError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentIndex,  int? selectedCountryIndex,  String? selectedCountry,  LocationData? location,  List<String> countries,  String? locationError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.currentIndex,_that.selectedCountryIndex,_that.selectedCountry,_that.location,_that.countries,_that.locationError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentIndex,  int? selectedCountryIndex,  String? selectedCountry,  LocationData? location,  List<String> countries,  String? locationError)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.currentIndex,_that.selectedCountryIndex,_that.selectedCountry,_that.location,_that.countries,_that.locationError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentIndex,  int? selectedCountryIndex,  String? selectedCountry,  LocationData? location,  List<String> countries,  String? locationError)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.currentIndex,_that.selectedCountryIndex,_that.selectedCountry,_that.location,_that.countries,_that.locationError);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({this.currentIndex = 0, this.selectedCountryIndex, this.selectedCountry, this.location, final  List<String> countries = const [], this.locationError = null}): _countries = countries;
  

@override@JsonKey() final  int currentIndex;
@override final  int? selectedCountryIndex;
@override final  String? selectedCountry;
@override final  LocationData? location;
 final  List<String> _countries;
@override@JsonKey() List<String> get countries {
  if (_countries is EqualUnmodifiableListView) return _countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countries);
}

@override@JsonKey() final  String? locationError;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.selectedCountryIndex, selectedCountryIndex) || other.selectedCountryIndex == selectedCountryIndex)&&(identical(other.selectedCountry, selectedCountry) || other.selectedCountry == selectedCountry)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._countries, _countries)&&(identical(other.locationError, locationError) || other.locationError == locationError));
}


@override
int get hashCode => Object.hash(runtimeType,currentIndex,selectedCountryIndex,selectedCountry,location,const DeepCollectionEquality().hash(_countries),locationError);

@override
String toString() {
  return 'DashboardState(currentIndex: $currentIndex, selectedCountryIndex: $selectedCountryIndex, selectedCountry: $selectedCountry, location: $location, countries: $countries, locationError: $locationError)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 int currentIndex, int? selectedCountryIndex, String? selectedCountry, LocationData? location, List<String> countries, String? locationError
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentIndex = null,Object? selectedCountryIndex = freezed,Object? selectedCountry = freezed,Object? location = freezed,Object? countries = null,Object? locationError = freezed,}) {
  return _then(_DashboardState(
currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedCountryIndex: freezed == selectedCountryIndex ? _self.selectedCountryIndex : selectedCountryIndex // ignore: cast_nullable_to_non_nullable
as int?,selectedCountry: freezed == selectedCountry ? _self.selectedCountry : selectedCountry // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationData?,countries: null == countries ? _self._countries : countries // ignore: cast_nullable_to_non_nullable
as List<String>,locationError: freezed == locationError ? _self.locationError : locationError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
