// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_gate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogicGate {

 GateType get type; String get name; String get formula; String get description;
/// Create a copy of LogicGate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogicGateCopyWith<LogicGate> get copyWith => _$LogicGateCopyWithImpl<LogicGate>(this as LogicGate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogicGate&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,type,name,formula,description);

@override
String toString() {
  return 'LogicGate(type: $type, name: $name, formula: $formula, description: $description)';
}


}

/// @nodoc
abstract mixin class $LogicGateCopyWith<$Res>  {
  factory $LogicGateCopyWith(LogicGate value, $Res Function(LogicGate) _then) = _$LogicGateCopyWithImpl;
@useResult
$Res call({
 GateType type, String name, String formula, String description
});




}
/// @nodoc
class _$LogicGateCopyWithImpl<$Res>
    implements $LogicGateCopyWith<$Res> {
  _$LogicGateCopyWithImpl(this._self, this._then);

  final LogicGate _self;
  final $Res Function(LogicGate) _then;

/// Create a copy of LogicGate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,Object? formula = null,Object? description = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GateType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogicGate].
extension LogicGatePatterns on LogicGate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogicGate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogicGate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogicGate value)  $default,){
final _that = this;
switch (_that) {
case _LogicGate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogicGate value)?  $default,){
final _that = this;
switch (_that) {
case _LogicGate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GateType type,  String name,  String formula,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogicGate() when $default != null:
return $default(_that.type,_that.name,_that.formula,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GateType type,  String name,  String formula,  String description)  $default,) {final _that = this;
switch (_that) {
case _LogicGate():
return $default(_that.type,_that.name,_that.formula,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GateType type,  String name,  String formula,  String description)?  $default,) {final _that = this;
switch (_that) {
case _LogicGate() when $default != null:
return $default(_that.type,_that.name,_that.formula,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _LogicGate implements LogicGate {
  const _LogicGate({required this.type, required this.name, required this.formula, required this.description});
  

@override final  GateType type;
@override final  String name;
@override final  String formula;
@override final  String description;

/// Create a copy of LogicGate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogicGateCopyWith<_LogicGate> get copyWith => __$LogicGateCopyWithImpl<_LogicGate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogicGate&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,type,name,formula,description);

@override
String toString() {
  return 'LogicGate(type: $type, name: $name, formula: $formula, description: $description)';
}


}

/// @nodoc
abstract mixin class _$LogicGateCopyWith<$Res> implements $LogicGateCopyWith<$Res> {
  factory _$LogicGateCopyWith(_LogicGate value, $Res Function(_LogicGate) _then) = __$LogicGateCopyWithImpl;
@override @useResult
$Res call({
 GateType type, String name, String formula, String description
});




}
/// @nodoc
class __$LogicGateCopyWithImpl<$Res>
    implements _$LogicGateCopyWith<$Res> {
  __$LogicGateCopyWithImpl(this._self, this._then);

  final _LogicGate _self;
  final $Res Function(_LogicGate) _then;

/// Create a copy of LogicGate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? formula = null,Object? description = null,}) {
  return _then(_LogicGate(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GateType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
