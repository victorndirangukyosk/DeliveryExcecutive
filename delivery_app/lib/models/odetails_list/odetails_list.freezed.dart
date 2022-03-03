// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'odetails_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OdetailsList _$OdetailsListFromJson(Map<String, dynamic> json) {
  return _OdetailsList.fromJson(json);
}

/// @nodoc
class _$OdetailsListTearOff {
  const _$OdetailsListTearOff();

  _OdetailsList call({String? name, String? product_note}) {
    return _OdetailsList(
      name: name,
      product_note: product_note,
    );
  }

  OdetailsList fromJson(Map<String, Object?> json) {
    return OdetailsList.fromJson(json);
  }
}

/// @nodoc
const $OdetailsList = _$OdetailsListTearOff();

/// @nodoc
mixin _$OdetailsList {
  String? get name => throw _privateConstructorUsedError;
  String? get product_note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OdetailsListCopyWith<OdetailsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdetailsListCopyWith<$Res> {
  factory $OdetailsListCopyWith(
          OdetailsList value, $Res Function(OdetailsList) then) =
      _$OdetailsListCopyWithImpl<$Res>;
  $Res call({String? name, String? product_note});
}

/// @nodoc
class _$OdetailsListCopyWithImpl<$Res> implements $OdetailsListCopyWith<$Res> {
  _$OdetailsListCopyWithImpl(this._value, this._then);

  final OdetailsList _value;
  // ignore: unused_field
  final $Res Function(OdetailsList) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? product_note = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      product_note: product_note == freezed
          ? _value.product_note
          : product_note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OdetailsListCopyWith<$Res>
    implements $OdetailsListCopyWith<$Res> {
  factory _$OdetailsListCopyWith(
          _OdetailsList value, $Res Function(_OdetailsList) then) =
      __$OdetailsListCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? product_note});
}

/// @nodoc
class __$OdetailsListCopyWithImpl<$Res> extends _$OdetailsListCopyWithImpl<$Res>
    implements _$OdetailsListCopyWith<$Res> {
  __$OdetailsListCopyWithImpl(
      _OdetailsList _value, $Res Function(_OdetailsList) _then)
      : super(_value, (v) => _then(v as _OdetailsList));

  @override
  _OdetailsList get _value => super._value as _OdetailsList;

  @override
  $Res call({
    Object? name = freezed,
    Object? product_note = freezed,
  }) {
    return _then(_OdetailsList(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      product_note: product_note == freezed
          ? _value.product_note
          : product_note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OdetailsList implements _OdetailsList {
  _$_OdetailsList({this.name, this.product_note});

  factory _$_OdetailsList.fromJson(Map<String, dynamic> json) =>
      _$$_OdetailsListFromJson(json);

  @override
  final String? name;
  @override
  final String? product_note;

  @override
  String toString() {
    return 'OdetailsList(name: $name, product_note: $product_note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OdetailsList &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.product_note, product_note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(product_note));

  @JsonKey(ignore: true)
  @override
  _$OdetailsListCopyWith<_OdetailsList> get copyWith =>
      __$OdetailsListCopyWithImpl<_OdetailsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OdetailsListToJson(this);
  }
}

abstract class _OdetailsList implements OdetailsList {
  factory _OdetailsList({String? name, String? product_note}) = _$_OdetailsList;

  factory _OdetailsList.fromJson(Map<String, dynamic> json) =
      _$_OdetailsList.fromJson;

  @override
  String? get name;
  @override
  String? get product_note;
  @override
  @JsonKey(ignore: true)
  _$OdetailsListCopyWith<_OdetailsList> get copyWith =>
      throw _privateConstructorUsedError;
}
