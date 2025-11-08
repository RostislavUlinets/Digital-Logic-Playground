// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GateResult {

 bool get output; bool get inputA; bool get inputB;
/// Create a copy of GateResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GateResultCopyWith<GateResult> get copyWith => _$GateResultCopyWithImpl<GateResult>(this as GateResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GateResult&&(identical(other.output, output) || other.output == output)&&(identical(other.inputA, inputA) || other.inputA == inputA)&&(identical(other.inputB, inputB) || other.inputB == inputB));
}


@override
int get hashCode => Object.hash(runtimeType,output,inputA,inputB);

@override
String toString() {
  return 'GateResult(output: $output, inputA: $inputA, inputB: $inputB)';
}


}

/// @nodoc
abstract mixin class $GateResultCopyWith<$Res>  {
  factory $GateResultCopyWith(GateResult value, $Res Function(GateResult) _then) = _$GateResultCopyWithImpl;
@useResult
$Res call({
 bool output, bool inputA, bool inputB
});




}
/// @nodoc
class _$GateResultCopyWithImpl<$Res>
    implements $GateResultCopyWith<$Res> {
  _$GateResultCopyWithImpl(this._self, this._then);

  final GateResult _self;
  final $Res Function(GateResult) _then;

/// Create a copy of GateResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? output = null,Object? inputA = null,Object? inputB = null,}) {
  return _then(_self.copyWith(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as bool,inputA: null == inputA ? _self.inputA : inputA // ignore: cast_nullable_to_non_nullable
as bool,inputB: null == inputB ? _self.inputB : inputB // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GateResult].
extension GateResultPatterns on GateResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GateResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GateResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GateResult value)  $default,){
final _that = this;
switch (_that) {
case _GateResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GateResult value)?  $default,){
final _that = this;
switch (_that) {
case _GateResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool output,  bool inputA,  bool inputB)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GateResult() when $default != null:
return $default(_that.output,_that.inputA,_that.inputB);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool output,  bool inputA,  bool inputB)  $default,) {final _that = this;
switch (_that) {
case _GateResult():
return $default(_that.output,_that.inputA,_that.inputB);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool output,  bool inputA,  bool inputB)?  $default,) {final _that = this;
switch (_that) {
case _GateResult() when $default != null:
return $default(_that.output,_that.inputA,_that.inputB);case _:
  return null;

}
}

}

/// @nodoc


class _GateResult implements GateResult {
  const _GateResult({required this.output, required this.inputA, required this.inputB});
  

@override final  bool output;
@override final  bool inputA;
@override final  bool inputB;

/// Create a copy of GateResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GateResultCopyWith<_GateResult> get copyWith => __$GateResultCopyWithImpl<_GateResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GateResult&&(identical(other.output, output) || other.output == output)&&(identical(other.inputA, inputA) || other.inputA == inputA)&&(identical(other.inputB, inputB) || other.inputB == inputB));
}


@override
int get hashCode => Object.hash(runtimeType,output,inputA,inputB);

@override
String toString() {
  return 'GateResult(output: $output, inputA: $inputA, inputB: $inputB)';
}


}

/// @nodoc
abstract mixin class _$GateResultCopyWith<$Res> implements $GateResultCopyWith<$Res> {
  factory _$GateResultCopyWith(_GateResult value, $Res Function(_GateResult) _then) = __$GateResultCopyWithImpl;
@override @useResult
$Res call({
 bool output, bool inputA, bool inputB
});




}
/// @nodoc
class __$GateResultCopyWithImpl<$Res>
    implements _$GateResultCopyWith<$Res> {
  __$GateResultCopyWithImpl(this._self, this._then);

  final _GateResult _self;
  final $Res Function(_GateResult) _then;

/// Create a copy of GateResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? output = null,Object? inputA = null,Object? inputB = null,}) {
  return _then(_GateResult(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as bool,inputA: null == inputA ? _self.inputA : inputA // ignore: cast_nullable_to_non_nullable
as bool,inputB: null == inputB ? _self.inputB : inputB // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
