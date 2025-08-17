// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddAccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAccountState()';
}


}

/// @nodoc
class $AddAccountStateCopyWith<$Res>  {
$AddAccountStateCopyWith(AddAccountState _, $Res Function(AddAccountState) __);
}


/// Adds pattern-matching-related methods to [AddAccountState].
extension AddAccountStatePatterns on AddAccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( AddAccountSendingOtp value)?  sendingOtp,TResult Function( AddAccountOtpSent value)?  otpSent,TResult Function( AddAccountVerifyingOtp value)?  verifyingOtp,TResult Function( AddAccountAdded value)?  added,TResult Function( AddAccountError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AddAccountSendingOtp() when sendingOtp != null:
return sendingOtp(_that);case AddAccountOtpSent() when otpSent != null:
return otpSent(_that);case AddAccountVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case AddAccountAdded() when added != null:
return added(_that);case AddAccountError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( AddAccountSendingOtp value)  sendingOtp,required TResult Function( AddAccountOtpSent value)  otpSent,required TResult Function( AddAccountVerifyingOtp value)  verifyingOtp,required TResult Function( AddAccountAdded value)  added,required TResult Function( AddAccountError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case AddAccountSendingOtp():
return sendingOtp(_that);case AddAccountOtpSent():
return otpSent(_that);case AddAccountVerifyingOtp():
return verifyingOtp(_that);case AddAccountAdded():
return added(_that);case AddAccountError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( AddAccountSendingOtp value)?  sendingOtp,TResult? Function( AddAccountOtpSent value)?  otpSent,TResult? Function( AddAccountVerifyingOtp value)?  verifyingOtp,TResult? Function( AddAccountAdded value)?  added,TResult? Function( AddAccountError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AddAccountSendingOtp() when sendingOtp != null:
return sendingOtp(_that);case AddAccountOtpSent() when otpSent != null:
return otpSent(_that);case AddAccountVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case AddAccountAdded() when added != null:
return added(_that);case AddAccountError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sendingOtp,TResult Function( String email)?  otpSent,TResult Function( String email)?  verifyingOtp,TResult Function( String email)?  added,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AddAccountSendingOtp() when sendingOtp != null:
return sendingOtp();case AddAccountOtpSent() when otpSent != null:
return otpSent(_that.email);case AddAccountVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.email);case AddAccountAdded() when added != null:
return added(_that.email);case AddAccountError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sendingOtp,required TResult Function( String email)  otpSent,required TResult Function( String email)  verifyingOtp,required TResult Function( String email)  added,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case AddAccountSendingOtp():
return sendingOtp();case AddAccountOtpSent():
return otpSent(_that.email);case AddAccountVerifyingOtp():
return verifyingOtp(_that.email);case AddAccountAdded():
return added(_that.email);case AddAccountError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sendingOtp,TResult? Function( String email)?  otpSent,TResult? Function( String email)?  verifyingOtp,TResult? Function( String email)?  added,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AddAccountSendingOtp() when sendingOtp != null:
return sendingOtp();case AddAccountOtpSent() when otpSent != null:
return otpSent(_that.email);case AddAccountVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.email);case AddAccountAdded() when added != null:
return added(_that.email);case AddAccountError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AddAccountState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAccountState.initial()';
}


}




/// @nodoc


class AddAccountSendingOtp implements AddAccountState {
  const AddAccountSendingOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAccountSendingOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddAccountState.sendingOtp()';
}


}




/// @nodoc


class AddAccountOtpSent implements AddAccountState {
  const AddAccountOtpSent({required this.email});
  

 final  String email;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAccountOtpSentCopyWith<AddAccountOtpSent> get copyWith => _$AddAccountOtpSentCopyWithImpl<AddAccountOtpSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAccountOtpSent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AddAccountState.otpSent(email: $email)';
}


}

/// @nodoc
abstract mixin class $AddAccountOtpSentCopyWith<$Res> implements $AddAccountStateCopyWith<$Res> {
  factory $AddAccountOtpSentCopyWith(AddAccountOtpSent value, $Res Function(AddAccountOtpSent) _then) = _$AddAccountOtpSentCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AddAccountOtpSentCopyWithImpl<$Res>
    implements $AddAccountOtpSentCopyWith<$Res> {
  _$AddAccountOtpSentCopyWithImpl(this._self, this._then);

  final AddAccountOtpSent _self;
  final $Res Function(AddAccountOtpSent) _then;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AddAccountOtpSent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddAccountVerifyingOtp implements AddAccountState {
  const AddAccountVerifyingOtp({required this.email});
  

 final  String email;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAccountVerifyingOtpCopyWith<AddAccountVerifyingOtp> get copyWith => _$AddAccountVerifyingOtpCopyWithImpl<AddAccountVerifyingOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAccountVerifyingOtp&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AddAccountState.verifyingOtp(email: $email)';
}


}

/// @nodoc
abstract mixin class $AddAccountVerifyingOtpCopyWith<$Res> implements $AddAccountStateCopyWith<$Res> {
  factory $AddAccountVerifyingOtpCopyWith(AddAccountVerifyingOtp value, $Res Function(AddAccountVerifyingOtp) _then) = _$AddAccountVerifyingOtpCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AddAccountVerifyingOtpCopyWithImpl<$Res>
    implements $AddAccountVerifyingOtpCopyWith<$Res> {
  _$AddAccountVerifyingOtpCopyWithImpl(this._self, this._then);

  final AddAccountVerifyingOtp _self;
  final $Res Function(AddAccountVerifyingOtp) _then;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AddAccountVerifyingOtp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddAccountAdded implements AddAccountState {
  const AddAccountAdded({required this.email});
  

 final  String email;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAccountAddedCopyWith<AddAccountAdded> get copyWith => _$AddAccountAddedCopyWithImpl<AddAccountAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAccountAdded&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AddAccountState.added(email: $email)';
}


}

/// @nodoc
abstract mixin class $AddAccountAddedCopyWith<$Res> implements $AddAccountStateCopyWith<$Res> {
  factory $AddAccountAddedCopyWith(AddAccountAdded value, $Res Function(AddAccountAdded) _then) = _$AddAccountAddedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AddAccountAddedCopyWithImpl<$Res>
    implements $AddAccountAddedCopyWith<$Res> {
  _$AddAccountAddedCopyWithImpl(this._self, this._then);

  final AddAccountAdded _self;
  final $Res Function(AddAccountAdded) _then;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AddAccountAdded(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddAccountError implements AddAccountState {
  const AddAccountError(this.message);
  

 final  String message;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAccountErrorCopyWith<AddAccountError> get copyWith => _$AddAccountErrorCopyWithImpl<AddAccountError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAccountError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddAccountState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddAccountErrorCopyWith<$Res> implements $AddAccountStateCopyWith<$Res> {
  factory $AddAccountErrorCopyWith(AddAccountError value, $Res Function(AddAccountError) _then) = _$AddAccountErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddAccountErrorCopyWithImpl<$Res>
    implements $AddAccountErrorCopyWith<$Res> {
  _$AddAccountErrorCopyWithImpl(this._self, this._then);

  final AddAccountError _self;
  final $Res Function(AddAccountError) _then;

/// Create a copy of AddAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddAccountError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
