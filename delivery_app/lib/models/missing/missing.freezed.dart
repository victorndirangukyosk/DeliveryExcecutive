// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'missing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Missing _$MissingFromJson(Map<String, dynamic> json) {
  return _Missing.fromJson(json);
}

/// @nodoc
class _$MissingTearOff {
  const _$MissingTearOff();

  _Missing call(String? prouct_id, String? quantity, String? quantity_required,
      String? comment) {
    return _Missing(
      prouct_id,
      quantity,
      quantity_required,
      comment,
    );
  }

  Missing fromJson(Map<String, Object?> json) {
    return Missing.fromJson(json);
  }
}

/// @nodoc
const $Missing = _$MissingTearOff();

/// @nodoc
mixin _$Missing {
  String? get prouct_id => throw _privateConstructorUsedError;
  String? get quantity => throw _privateConstructorUsedError;
  String? get quantity_required => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissingCopyWith<Missing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissingCopyWith<$Res> {
  factory $MissingCopyWith(Missing value, $Res Function(Missing) then) =
      _$MissingCopyWithImpl<$Res>;
  $Res call(
      {String? prouct_id,
      String? quantity,
      String? quantity_required,
      String? comment});
}

/// @nodoc
class _$MissingCopyWithImpl<$Res> implements $MissingCopyWith<$Res> {
  _$MissingCopyWithImpl(this._value, this._then);

  final Missing _value;
  // ignore: unused_field
  final $Res Function(Missing) _then;

  @override
  $Res call({
    Object? prouct_id = freezed,
    Object? quantity = freezed,
    Object? quantity_required = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      prouct_id: prouct_id == freezed
          ? _value.prouct_id
          : prouct_id // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_required: quantity_required == freezed
          ? _value.quantity_required
          : quantity_required // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MissingCopyWith<$Res> implements $MissingCopyWith<$Res> {
  factory _$MissingCopyWith(_Missing value, $Res Function(_Missing) then) =
      __$MissingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? prouct_id,
      String? quantity,
      String? quantity_required,
      String? comment});
}

/// @nodoc
class __$MissingCopyWithImpl<$Res> extends _$MissingCopyWithImpl<$Res>
    implements _$MissingCopyWith<$Res> {
  __$MissingCopyWithImpl(_Missing _value, $Res Function(_Missing) _then)
      : super(_value, (v) => _then(v as _Missing));

  @override
  _Missing get _value => super._value as _Missing;

  @override
  $Res call({
    Object? prouct_id = freezed,
    Object? quantity = freezed,
    Object? quantity_required = freezed,
    Object? comment = freezed,
  }) {
    return _then(_Missing(
      prouct_id == freezed
          ? _value.prouct_id
          : prouct_id // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity_required == freezed
          ? _value.quantity_required
          : quantity_required // ignore: cast_nullable_to_non_nullable
              as String?,
      comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Missing implements _Missing {
  _$_Missing(
      this.prouct_id, this.quantity, this.quantity_required, this.comment);

  factory _$_Missing.fromJson(Map<String, dynamic> json) =>
      _$$_MissingFromJson(json);

  @override
  final String? prouct_id;
  @override
  final String? quantity;
  @override
  final String? quantity_required;
  @override
  final String? comment;

  @override
  String toString() {
    return 'Missing(prouct_id: $prouct_id, quantity: $quantity, quantity_required: $quantity_required, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Missing &&
            const DeepCollectionEquality().equals(other.prouct_id, prouct_id) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.quantity_required, quantity_required) &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(prouct_id),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(quantity_required),
      const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$MissingCopyWith<_Missing> get copyWith =>
      __$MissingCopyWithImpl<_Missing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissingToJson(this);
  }
}

abstract class _Missing implements Missing {
  factory _Missing(String? prouct_id, String? quantity,
      String? quantity_required, String? comment) = _$_Missing;

  factory _Missing.fromJson(Map<String, dynamic> json) = _$_Missing.fromJson;

  @override
  String? get prouct_id;
  @override
  String? get quantity;
  @override
  String? get quantity_required;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$MissingCopyWith<_Missing> get copyWith =>
      throw _privateConstructorUsedError;
}
