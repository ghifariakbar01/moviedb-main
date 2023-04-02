// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_nowplay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NowPlayMod {
  String get url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  DateTime? get released => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NowPlayModCopyWith<NowPlayMod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NowPlayModCopyWith<$Res> {
  factory $NowPlayModCopyWith(
          NowPlayMod value, $Res Function(NowPlayMod) then) =
      _$NowPlayModCopyWithImpl<$Res, NowPlayMod>;
  @useResult
  $Res call(
      {String url,
      String title,
      String desc,
      String imageUrl,
      DateTime? released});
}

/// @nodoc
class _$NowPlayModCopyWithImpl<$Res, $Val extends NowPlayMod>
    implements $NowPlayModCopyWith<$Res> {
  _$NowPlayModCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? desc = null,
    Object? imageUrl = null,
    Object? released = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NowPlayModCopyWith<$Res>
    implements $NowPlayModCopyWith<$Res> {
  factory _$$_NowPlayModCopyWith(
          _$_NowPlayMod value, $Res Function(_$_NowPlayMod) then) =
      __$$_NowPlayModCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String title,
      String desc,
      String imageUrl,
      DateTime? released});
}

/// @nodoc
class __$$_NowPlayModCopyWithImpl<$Res>
    extends _$NowPlayModCopyWithImpl<$Res, _$_NowPlayMod>
    implements _$$_NowPlayModCopyWith<$Res> {
  __$$_NowPlayModCopyWithImpl(
      _$_NowPlayMod _value, $Res Function(_$_NowPlayMod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? desc = null,
    Object? imageUrl = null,
    Object? released = freezed,
  }) {
    return _then(_$_NowPlayMod(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_NowPlayMod implements _NowPlayMod {
  const _$_NowPlayMod(
      {required this.url,
      required this.title,
      required this.desc,
      required this.imageUrl,
      this.released});

  @override
  final String url;
  @override
  final String title;
  @override
  final String desc;
  @override
  final String imageUrl;
  @override
  final DateTime? released;

  @override
  String toString() {
    return 'NowPlayMod(url: $url, title: $title, desc: $desc, imageUrl: $imageUrl, released: $released)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NowPlayMod &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.released, released) ||
                other.released == released));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, url, title, desc, imageUrl, released);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NowPlayModCopyWith<_$_NowPlayMod> get copyWith =>
      __$$_NowPlayModCopyWithImpl<_$_NowPlayMod>(this, _$identity);
}

abstract class _NowPlayMod implements NowPlayMod {
  const factory _NowPlayMod(
      {required final String url,
      required final String title,
      required final String desc,
      required final String imageUrl,
      final DateTime? released}) = _$_NowPlayMod;

  @override
  String get url;
  @override
  String get title;
  @override
  String get desc;
  @override
  String get imageUrl;
  @override
  DateTime? get released;
  @override
  @JsonKey(ignore: true)
  _$$_NowPlayModCopyWith<_$_NowPlayMod> get copyWith =>
      throw _privateConstructorUsedError;
}
