// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState()';
}


}

/// @nodoc
class $SignupStateCopyWith<$Res>  {
$SignupStateCopyWith(SignupState _, $Res Function(SignupState) __);
}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SignupSendingOtp value)?  sendingOtp,TResult Function( SignupOtpSent value)?  otpSent,TResult Function( SignupVerifyingOtp value)?  verifyingOtp,TResult Function( SignupSignedUp value)?  signedUp,TResult Function( SignupError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SignupSendingOtp() when sendingOtp != null:
return sendingOtp(_that);case SignupOtpSent() when otpSent != null:
return otpSent(_that);case SignupVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case SignupSignedUp() when signedUp != null:
return signedUp(_that);case SignupError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SignupSendingOtp value)  sendingOtp,required TResult Function( SignupOtpSent value)  otpSent,required TResult Function( SignupVerifyingOtp value)  verifyingOtp,required TResult Function( SignupSignedUp value)  signedUp,required TResult Function( SignupError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SignupSendingOtp():
return sendingOtp(_that);case SignupOtpSent():
return otpSent(_that);case SignupVerifyingOtp():
return verifyingOtp(_that);case SignupSignedUp():
return signedUp(_that);case SignupError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SignupSendingOtp value)?  sendingOtp,TResult? Function( SignupOtpSent value)?  otpSent,TResult? Function( SignupVerifyingOtp value)?  verifyingOtp,TResult? Function( SignupSignedUp value)?  signedUp,TResult? Function( SignupError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SignupSendingOtp() when sendingOtp != null:
return sendingOtp(_that);case SignupOtpSent() when otpSent != null:
return otpSent(_that);case SignupVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case SignupSignedUp() when signedUp != null:
return signedUp(_that);case SignupError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sendingOtp,TResult Function( String email)?  otpSent,TResult Function( String email)?  verifyingOtp,TResult Function( String email)?  signedUp,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SignupSendingOtp() when sendingOtp != null:
return sendingOtp();case SignupOtpSent() when otpSent != null:
return otpSent(_that.email);case SignupVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.email);case SignupSignedUp() when signedUp != null:
return signedUp(_that.email);case SignupError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sendingOtp,required TResult Function( String email)  otpSent,required TResult Function( String email)  verifyingOtp,required TResult Function( String email)  signedUp,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SignupSendingOtp():
return sendingOtp();case SignupOtpSent():
return otpSent(_that.email);case SignupVerifyingOtp():
return verifyingOtp(_that.email);case SignupSignedUp():
return signedUp(_that.email);case SignupError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sendingOtp,TResult? Function( String email)?  otpSent,TResult? Function( String email)?  verifyingOtp,TResult? Function( String email)?  signedUp,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SignupSendingOtp() when sendingOtp != null:
return sendingOtp();case SignupOtpSent() when otpSent != null:
return otpSent(_that.email);case SignupVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.email);case SignupSignedUp() when signedUp != null:
return signedUp(_that.email);case SignupError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SignupState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.initial()';
}


}




/// @nodoc


class SignupSendingOtp implements SignupState {
  const SignupSendingOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSendingOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.sendingOtp()';
}


}




/// @nodoc


class SignupOtpSent implements SignupState {
  const SignupOtpSent({required this.email});
  

 final  String email;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupOtpSentCopyWith<SignupOtpSent> get copyWith => _$SignupOtpSentCopyWithImpl<SignupOtpSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupOtpSent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupState.otpSent(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupOtpSentCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupOtpSentCopyWith(SignupOtpSent value, $Res Function(SignupOtpSent) _then) = _$SignupOtpSentCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupOtpSentCopyWithImpl<$Res>
    implements $SignupOtpSentCopyWith<$Res> {
  _$SignupOtpSentCopyWithImpl(this._self, this._then);

  final SignupOtpSent _self;
  final $Res Function(SignupOtpSent) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupOtpSent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupVerifyingOtp implements SignupState {
  const SignupVerifyingOtp({required this.email});
  

 final  String email;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupVerifyingOtpCopyWith<SignupVerifyingOtp> get copyWith => _$SignupVerifyingOtpCopyWithImpl<SignupVerifyingOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupVerifyingOtp&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupState.verifyingOtp(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupVerifyingOtpCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupVerifyingOtpCopyWith(SignupVerifyingOtp value, $Res Function(SignupVerifyingOtp) _then) = _$SignupVerifyingOtpCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupVerifyingOtpCopyWithImpl<$Res>
    implements $SignupVerifyingOtpCopyWith<$Res> {
  _$SignupVerifyingOtpCopyWithImpl(this._self, this._then);

  final SignupVerifyingOtp _self;
  final $Res Function(SignupVerifyingOtp) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupVerifyingOtp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupSignedUp implements SignupState {
  const SignupSignedUp({required this.email});
  

 final  String email;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupSignedUpCopyWith<SignupSignedUp> get copyWith => _$SignupSignedUpCopyWithImpl<SignupSignedUp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSignedUp&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupState.signedUp(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupSignedUpCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupSignedUpCopyWith(SignupSignedUp value, $Res Function(SignupSignedUp) _then) = _$SignupSignedUpCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupSignedUpCopyWithImpl<$Res>
    implements $SignupSignedUpCopyWith<$Res> {
  _$SignupSignedUpCopyWithImpl(this._self, this._then);

  final SignupSignedUp _self;
  final $Res Function(SignupSignedUp) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupSignedUp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupError implements SignupState {
  const SignupError(this.message);
  

 final  String message;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupErrorCopyWith<SignupError> get copyWith => _$SignupErrorCopyWithImpl<SignupError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SignupState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SignupErrorCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupErrorCopyWith(SignupError value, $Res Function(SignupError) _then) = _$SignupErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SignupErrorCopyWithImpl<$Res>
    implements $SignupErrorCopyWith<$Res> {
  _$SignupErrorCopyWithImpl(this._self, this._then);

  final SignupError _self;
  final $Res Function(SignupError) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SignupError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
