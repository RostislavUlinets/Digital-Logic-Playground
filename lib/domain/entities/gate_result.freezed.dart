// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GateResult {
  bool get output => throw _privateConstructorUsedError;
  bool get inputA => throw _privateConstructorUsedError;
  bool get inputB => throw _privateConstructorUsedError;

  /// Create a copy of GateResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GateResultCopyWith<GateResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateResultCopyWith<$Res> {
  factory $GateResultCopyWith(
    GateResult value,
    $Res Function(GateResult) then,
  ) = _$GateResultCopyWithImpl<$Res, GateResult>;
  @useResult
  $Res call({bool output, bool inputA, bool inputB});
}

/// @nodoc
class _$GateResultCopyWithImpl<$Res, $Val extends GateResult>
    implements $GateResultCopyWith<$Res> {
  _$GateResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GateResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = null,
    Object? inputA = null,
    Object? inputB = null,
  }) {
    return _then(
      _value.copyWith(
            output: null == output
                ? _value.output
                : output // ignore: cast_nullable_to_non_nullable
                      as bool,
            inputA: null == inputA
                ? _value.inputA
                : inputA // ignore: cast_nullable_to_non_nullable
                      as bool,
            inputB: null == inputB
                ? _value.inputB
                : inputB // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GateResultImplCopyWith<$Res>
    implements $GateResultCopyWith<$Res> {
  factory _$$GateResultImplCopyWith(
    _$GateResultImpl value,
    $Res Function(_$GateResultImpl) then,
  ) = __$$GateResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool output, bool inputA, bool inputB});
}

/// @nodoc
class __$$GateResultImplCopyWithImpl<$Res>
    extends _$GateResultCopyWithImpl<$Res, _$GateResultImpl>
    implements _$$GateResultImplCopyWith<$Res> {
  __$$GateResultImplCopyWithImpl(
    _$GateResultImpl _value,
    $Res Function(_$GateResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GateResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = null,
    Object? inputA = null,
    Object? inputB = null,
  }) {
    return _then(
      _$GateResultImpl(
        output: null == output
            ? _value.output
            : output // ignore: cast_nullable_to_non_nullable
                  as bool,
        inputA: null == inputA
            ? _value.inputA
            : inputA // ignore: cast_nullable_to_non_nullable
                  as bool,
        inputB: null == inputB
            ? _value.inputB
            : inputB // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$GateResultImpl implements _GateResult {
  const _$GateResultImpl({
    required this.output,
    required this.inputA,
    required this.inputB,
  });

  @override
  final bool output;
  @override
  final bool inputA;
  @override
  final bool inputB;

  @override
  String toString() {
    return 'GateResult(output: $output, inputA: $inputA, inputB: $inputB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateResultImpl &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.inputA, inputA) || other.inputA == inputA) &&
            (identical(other.inputB, inputB) || other.inputB == inputB));
  }

  @override
  int get hashCode => Object.hash(runtimeType, output, inputA, inputB);

  /// Create a copy of GateResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GateResultImplCopyWith<_$GateResultImpl> get copyWith =>
      __$$GateResultImplCopyWithImpl<_$GateResultImpl>(this, _$identity);
}

abstract class _GateResult implements GateResult {
  const factory _GateResult({
    required final bool output,
    required final bool inputA,
    required final bool inputB,
  }) = _$GateResultImpl;

  @override
  bool get output;
  @override
  bool get inputA;
  @override
  bool get inputB;

  /// Create a copy of GateResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GateResultImplCopyWith<_$GateResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
