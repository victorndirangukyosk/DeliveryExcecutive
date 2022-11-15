// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'logged_in_de.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoggedInDe _$LoggedInDeFromJson(Map<String, dynamic> json) {
  return _LoggedInDe.fromJson(json);
}

/// @nodoc
mixin _$LoggedInDe {
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get date_added => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoggedInDeCopyWith<LoggedInDe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInDeCopyWith<$Res> {
  factory $LoggedInDeCopyWith(
          LoggedInDe value, $Res Function(LoggedInDe) then) =
      _$LoggedInDeCopyWithImpl<$Res>;
  $Res call(
      {String? firstname,
      String? lastname,
      String? email,
      String? date_added,
      String? username});
}

/// @nodoc
class _$LoggedInDeCopyWithImpl<$Res> implements $LoggedInDeCopyWith<$Res> {
  _$LoggedInDeCopyWithImpl(this._value, this._then);

  final LoggedInDe _value;
  // ignore: unused_field
  final $Res Function(LoggedInDe) _then;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? date_added = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: date_added == freezed
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoggedInDeCopyWith<$Res>
    implements $LoggedInDeCopyWith<$Res> {
  factory _$$_LoggedInDeCopyWith(
          _$_LoggedInDe value, $Res Function(_$_LoggedInDe) then) =
      __$$_LoggedInDeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? firstname,
      String? lastname,
      String? email,
      String? date_added,
      String? username});
}

/// @nodoc
class __$$_LoggedInDeCopyWithImpl<$Res> extends _$LoggedInDeCopyWithImpl<$Res>
    implements _$$_LoggedInDeCopyWith<$Res> {
  __$$_LoggedInDeCopyWithImpl(
      _$_LoggedInDe _value, $Res Function(_$_LoggedInDe) _then)
      : super(_value, (v) => _then(v as _$_LoggedInDe));

  @override
  _$_LoggedInDe get _value => super._value as _$_LoggedInDe;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? date_added = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_LoggedInDe(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: date_added == freezed
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoggedInDe implements _LoggedInDe {
  _$_LoggedInDe(
      {this.firstname,
      this.lastname,
      this.email,
      this.date_added,
      this.username});

  factory _$_LoggedInDe.fromJson(Map<String, dynamic> json) =>
      _$$_LoggedInDeFromJson(json);

  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? date_added;
  @override
  final String? username;

  @override
  String toString() {
    return 'LoggedInDe(firstname: $firstname, lastname: $lastname, email: $email, date_added: $date_added, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedInDe &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.date_added, date_added) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(date_added),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedInDeCopyWith<_$_LoggedInDe> get copyWith =>
      __$$_LoggedInDeCopyWithImpl<_$_LoggedInDe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoggedInDeToJson(
      this,
    );
  }
}

abstract class _LoggedInDe implements LoggedInDe {
  factory _LoggedInDe(
      {final String? firstname,
      final String? lastname,
      final String? email,
      final String? date_added,
      final String? username}) = _$_LoggedInDe;

  factory _LoggedInDe.fromJson(Map<String, dynamic> json) =
      _$_LoggedInDe.fromJson;

  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get date_added;
  @override
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$_LoggedInDeCopyWith<_$_LoggedInDe> get copyWith =>
      throw _privateConstructorUsedError;
}
