// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountModel {

 String get uid; String get name; String get email; String get role; String get phone;@TimestampConverter() Timestamp? get createdAt; bool get isAccountHasImage; String get address; int get accountImageNumber;
/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountModelCopyWith<AccountModel> get copyWith => _$AccountModelCopyWithImpl<AccountModel>(this as AccountModel, _$identity);

  /// Serializes this AccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isAccountHasImage, isAccountHasImage) || other.isAccountHasImage == isAccountHasImage)&&(identical(other.address, address) || other.address == address)&&(identical(other.accountImageNumber, accountImageNumber) || other.accountImageNumber == accountImageNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,email,role,phone,createdAt,isAccountHasImage,address,accountImageNumber);

@override
String toString() {
  return 'AccountModel(uid: $uid, name: $name, email: $email, role: $role, phone: $phone, createdAt: $createdAt, isAccountHasImage: $isAccountHasImage, address: $address, accountImageNumber: $accountImageNumber)';
}


}

/// @nodoc
abstract mixin class $AccountModelCopyWith<$Res>  {
  factory $AccountModelCopyWith(AccountModel value, $Res Function(AccountModel) _then) = _$AccountModelCopyWithImpl;
@useResult
$Res call({
 String uid, String name, String email, String role, String phone,@TimestampConverter() Timestamp? createdAt, bool isAccountHasImage, String address, int accountImageNumber
});




}
/// @nodoc
class _$AccountModelCopyWithImpl<$Res>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._self, this._then);

  final AccountModel _self;
  final $Res Function(AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,Object? email = null,Object? role = null,Object? phone = null,Object? createdAt = freezed,Object? isAccountHasImage = null,Object? address = null,Object? accountImageNumber = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,isAccountHasImage: null == isAccountHasImage ? _self.isAccountHasImage : isAccountHasImage // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,accountImageNumber: null == accountImageNumber ? _self.accountImageNumber : accountImageNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountModel].
extension AccountModelPatterns on AccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name,  String email,  String role,  String phone, @TimestampConverter()  Timestamp? createdAt,  bool isAccountHasImage,  String address,  int accountImageNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
return $default(_that.uid,_that.name,_that.email,_that.role,_that.phone,_that.createdAt,_that.isAccountHasImage,_that.address,_that.accountImageNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name,  String email,  String role,  String phone, @TimestampConverter()  Timestamp? createdAt,  bool isAccountHasImage,  String address,  int accountImageNumber)  $default,) {final _that = this;
switch (_that) {
case _AccountModel():
return $default(_that.uid,_that.name,_that.email,_that.role,_that.phone,_that.createdAt,_that.isAccountHasImage,_that.address,_that.accountImageNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name,  String email,  String role,  String phone, @TimestampConverter()  Timestamp? createdAt,  bool isAccountHasImage,  String address,  int accountImageNumber)?  $default,) {final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
return $default(_that.uid,_that.name,_that.email,_that.role,_that.phone,_that.createdAt,_that.isAccountHasImage,_that.address,_that.accountImageNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountModel implements AccountModel {
  const _AccountModel({required this.uid, required this.name, required this.email, this.role = '', this.phone = '', @TimestampConverter() this.createdAt, this.isAccountHasImage = false, this.address = '', this.accountImageNumber = 0});
  factory _AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

@override final  String uid;
@override final  String name;
@override final  String email;
@override@JsonKey() final  String role;
@override@JsonKey() final  String phone;
@override@TimestampConverter() final  Timestamp? createdAt;
@override@JsonKey() final  bool isAccountHasImage;
@override@JsonKey() final  String address;
@override@JsonKey() final  int accountImageNumber;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountModelCopyWith<_AccountModel> get copyWith => __$AccountModelCopyWithImpl<_AccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isAccountHasImage, isAccountHasImage) || other.isAccountHasImage == isAccountHasImage)&&(identical(other.address, address) || other.address == address)&&(identical(other.accountImageNumber, accountImageNumber) || other.accountImageNumber == accountImageNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,email,role,phone,createdAt,isAccountHasImage,address,accountImageNumber);

@override
String toString() {
  return 'AccountModel(uid: $uid, name: $name, email: $email, role: $role, phone: $phone, createdAt: $createdAt, isAccountHasImage: $isAccountHasImage, address: $address, accountImageNumber: $accountImageNumber)';
}


}

/// @nodoc
abstract mixin class _$AccountModelCopyWith<$Res> implements $AccountModelCopyWith<$Res> {
  factory _$AccountModelCopyWith(_AccountModel value, $Res Function(_AccountModel) _then) = __$AccountModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name, String email, String role, String phone,@TimestampConverter() Timestamp? createdAt, bool isAccountHasImage, String address, int accountImageNumber
});




}
/// @nodoc
class __$AccountModelCopyWithImpl<$Res>
    implements _$AccountModelCopyWith<$Res> {
  __$AccountModelCopyWithImpl(this._self, this._then);

  final _AccountModel _self;
  final $Res Function(_AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,Object? email = null,Object? role = null,Object? phone = null,Object? createdAt = freezed,Object? isAccountHasImage = null,Object? address = null,Object? accountImageNumber = null,}) {
  return _then(_AccountModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,isAccountHasImage: null == isAccountHasImage ? _self.isAccountHasImage : isAccountHasImage // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,accountImageNumber: null == accountImageNumber ? _self.accountImageNumber : accountImageNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
