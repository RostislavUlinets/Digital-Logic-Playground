// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_gate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LogicGate {
  GateType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get formula => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of LogicGate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogicGateCopyWith<LogicGate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogicGateCopyWith<$Res> {
  factory $LogicGateCopyWith(LogicGate value, $Res Function(LogicGate) then) =
      _$LogicGateCopyWithImpl<$Res, LogicGate>;
  @useResult
  $Res call({GateType type, String name, String formula, String description});
}

/// @nodoc
class _$LogicGateCopyWithImpl<$Res, $Val extends LogicGate>
    implements $LogicGateCopyWith<$Res> {
  _$LogicGateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogicGate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? formula = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as GateType,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            formula: null == formula
                ? _value.formula
                : formula // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LogicGateImplCopyWith<$Res>
    implements $LogicGateCopyWith<$Res> {
  factory _$$LogicGateImplCopyWith(
    _$LogicGateImpl value,
    $Res Function(_$LogicGateImpl) then,
  ) = __$$LogicGateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GateType type, String name, String formula, String description});
}

/// @nodoc
class __$$LogicGateImplCopyWithImpl<$Res>
    extends _$LogicGateCopyWithImpl<$Res, _$LogicGateImpl>
    implements _$$LogicGateImplCopyWith<$Res> {
  __$$LogicGateImplCopyWithImpl(
    _$LogicGateImpl _value,
    $Res Function(_$LogicGateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LogicGate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? formula = null,
    Object? description = null,
  }) {
    return _then(
      _$LogicGateImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as GateType,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        formula: null == formula
            ? _value.formula
            : formula // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LogicGateImpl implements _LogicGate {
  const _$LogicGateImpl({
    required this.type,
    required this.name,
    required this.formula,
    required this.description,
  });

  @override
  final GateType type;
  @override
  final String name;
  @override
  final String formula;
  @override
  final String description;

  @override
  String toString() {
    return 'LogicGate(type: $type, name: $name, formula: $formula, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogicGateImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formula, formula) || other.formula == formula) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, name, formula, description);

  /// Create a copy of LogicGate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogicGateImplCopyWith<_$LogicGateImpl> get copyWith =>
      __$$LogicGateImplCopyWithImpl<_$LogicGateImpl>(this, _$identity);
}

abstract class _LogicGate implements LogicGate {
  const factory _LogicGate({
    required final GateType type,
    required final String name,
    required final String formula,
    required final String description,
  }) = _$LogicGateImpl;

  @override
  GateType get type;
  @override
  String get name;
  @override
  String get formula;
  @override
  String get description;

  /// Create a copy of LogicGate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogicGateImplCopyWith<_$LogicGateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
