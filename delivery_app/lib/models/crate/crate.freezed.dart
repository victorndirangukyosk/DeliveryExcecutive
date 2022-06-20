// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'crate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Crate _$CrateFromJson(Map<String, dynamic> json) {
  return _Crate.fromJson(json);
}

/// @nodoc
mixin _$Crate {
  String? get serial_number => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get purchase_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrateCopyWith<Crate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrateCopyWith<$Res> {
  factory $CrateCopyWith(Crate value, $Res Function(Crate) then) =
      _$CrateCopyWithImpl<$Res>;
  $Res call(
      {String? serial_number,
      String? color,
      String? department,
      String? purchase_date});
}

/// @nodoc
class _$CrateCopyWithImpl<$Res> implements $CrateCopyWith<$Res> {
  _$CrateCopyWithImpl(this._value, this._then);

  final Crate _value;
  // ignore: unused_field
  final $Res Function(Crate) _then;

  @override
  $Res call({
    Object? serial_number = freezed,
    Object? color = freezed,
    Object? department = freezed,
    Object? purchase_date = freezed,
  }) {
    return _then(_value.copyWith(
      serial_number: serial_number == freezed
          ? _value.serial_number
          : serial_number // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      department: department == freezed
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      purchase_date: purchase_date == freezed
          ? _value.purchase_date
          : purchase_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CrateCopyWith<$Res> implements $CrateCopyWith<$Res> {
  factory _$$_CrateCopyWith(_$_Crate value, $Res Function(_$_Crate) then) =
      __$$_CrateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? serial_number,
      String? color,
      String? department,
      String? purchase_date});
}

/// @nodoc
class __$$_CrateCopyWithImpl<$Res> extends _$CrateCopyWithImpl<$Res>
    implements _$$_CrateCopyWith<$Res> {
  __$$_CrateCopyWithImpl(_$_Crate _value, $Res Function(_$_Crate) _then)
      : super(_value, (v) => _then(v as _$_Crate));

  @override
  _$_Crate get _value => super._value as _$_Crate;

  @override
  $Res call({
    Object? serial_number = freezed,
    Object? color = freezed,
    Object? department = freezed,
    Object? purchase_date = freezed,
  }) {
    return _then(_$_Crate(
      serial_number: serial_number == freezed
          ? _value.serial_number
          : serial_number // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      department: department == freezed
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      purchase_date: purchase_date == freezed
          ? _value.purchase_date
          : purchase_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Crate implements _Crate {
  _$_Crate(
      {this.serial_number, this.color, this.department, this.purchase_date});

  factory _$_Crate.fromJson(Map<String, dynamic> json) =>
      _$$_CrateFromJson(json);

  @override
  final String? serial_number;
  @override
  final String? color;
  @override
  final String? department;
  @override
  final String? purchase_date;

  @override
  String toString() {
    return 'Crate(serial_number: $serial_number, color: $color, department: $department, purchase_date: $purchase_date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Crate &&
            const DeepCollectionEquality()
                .equals(other.serial_number, serial_number) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.department, department) &&
            const DeepCollectionEquality()
                .equals(other.purchase_date, purchase_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serial_number),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(department),
      const DeepCollectionEquality().hash(purchase_date));

  @JsonKey(ignore: true)
  @override
  _$$_CrateCopyWith<_$_Crate> get copyWith =>
      __$$_CrateCopyWithImpl<_$_Crate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CrateToJson(this);
  }
}

abstract class _Crate implements Crate {
  factory _Crate(
      {final String? serial_number,
      final String? color,
      final String? department,
      final String? purchase_date}) = _$_Crate;

  factory _Crate.fromJson(Map<String, dynamic> json) = _$_Crate.fromJson;

  @override
  String? get serial_number => throw _privateConstructorUsedError;
  @override
  String? get color => throw _privateConstructorUsedError;
  @override
  String? get department => throw _privateConstructorUsedError;
  @override
  String? get purchase_date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CrateCopyWith<_$_Crate> get copyWith =>
      throw _privateConstructorUsedError;
}
