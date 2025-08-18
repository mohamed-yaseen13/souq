// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoginsendingOtp value)?  sendingOtp,TResult Function( LoginOtpSent value)?  otpSent,TResult Function( LoginVerifyingOtp value)?  verifyingOtp,TResult Function( LoginLoggedIn value)?  loggedIn,TResult Function( LoginError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginsendingOtp() when sendingOtp != null:
return sendingOtp(_that);case LoginOtpSent() when otpSent != null:
return otpSent(_that);case LoginVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case LoginLoggedIn() when loggedIn != null:
return loggedIn(_that);case LoginError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoginsendingOtp value)  sendingOtp,required TResult Function( LoginOtpSent value)  otpSent,required TResult Function( LoginVerifyingOtp value)  verifyingOtp,required TResult Function( LoginLoggedIn value)  loggedIn,required TResult Function( LoginError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoginsendingOtp():
return sendingOtp(_that);case LoginOtpSent():
return otpSent(_that);case LoginVerifyingOtp():
return verifyingOtp(_that);case LoginLoggedIn():
return loggedIn(_that);case LoginError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoginsendingOtp value)?  sendingOtp,TResult? Function( LoginOtpSent value)?  otpSent,TResult? Function( LoginVerifyingOtp value)?  verifyingOtp,TResult? Function( LoginLoggedIn value)?  loggedIn,TResult? Function( LoginError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginsendingOtp() when sendingOtp != null:
return sendingOtp(_that);case LoginOtpSent() when otpSent != null:
return otpSent(_that);case LoginVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case LoginLoggedIn() when loggedIn != null:
return loggedIn(_that);case LoginError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sendingOtp,TResult Function( String email)?  otpSent,TResult Function( String email)?  verifyingOtp,TResult Function( String email)?  loggedIn,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginsendingOtp() when sendingOtp != null:
return sendingOtp();case LoginOtpSent() when otpSent != null:
return otpSent(_that.email);case LoginVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.email);case LoginLoggedIn() when loggedIn != null:
return loggedIn(_that.email);case LoginError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sendingOtp,required TResult Function( String email)  otpSent,required TResult Function( String email)  verifyingOtp,required TResult Function( String email)  loggedIn,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoginsendingOtp():
return sendingOtp();case LoginOtpSent():
return otpSent(_that.email);case LoginVerifyingOtp():
return verifyingOtp(_that.email);case LoginLoggedIn():
return loggedIn(_that.email);case LoginError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sendingOtp,TResult? Function( String email)?  otpSent,TResult? Function( String email)?  verifyingOtp,TResult? Function( String email)?  loggedIn,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginsendingOtp() when sendingOtp != null:
return sendingOtp();case LoginOtpSent() when otpSent != null:
return otpSent(_that.email);case LoginVerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.email);case LoginLoggedIn() when loggedIn != null:
return loggedIn(_that.email);case LoginError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoginsendingOtp implements LoginState {
  const LoginsendingOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginsendingOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.sendingOtp()';
}


}




/// @nodoc


class LoginOtpSent implements LoginState {
  const LoginOtpSent({required this.email});
  

 final  String email;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginOtpSentCopyWith<LoginOtpSent> get copyWith => _$LoginOtpSentCopyWithImpl<LoginOtpSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginOtpSent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginState.otpSent(email: $email)';
}


}

/// @nodoc
abstract mixin class $LoginOtpSentCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginOtpSentCopyWith(LoginOtpSent value, $Res Function(LoginOtpSent) _then) = _$LoginOtpSentCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$LoginOtpSentCopyWithImpl<$Res>
    implements $LoginOtpSentCopyWith<$Res> {
  _$LoginOtpSentCopyWithImpl(this._self, this._then);

  final LoginOtpSent _self;
  final $Res Function(LoginOtpSent) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(LoginOtpSent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginVerifyingOtp implements LoginState {
  const LoginVerifyingOtp({required this.email});
  

 final  String email;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginVerifyingOtpCopyWith<LoginVerifyingOtp> get copyWith => _$LoginVerifyingOtpCopyWithImpl<LoginVerifyingOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginVerifyingOtp&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginState.verifyingOtp(email: $email)';
}


}

/// @nodoc
abstract mixin class $LoginVerifyingOtpCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginVerifyingOtpCopyWith(LoginVerifyingOtp value, $Res Function(LoginVerifyingOtp) _then) = _$LoginVerifyingOtpCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$LoginVerifyingOtpCopyWithImpl<$Res>
    implements $LoginVerifyingOtpCopyWith<$Res> {
  _$LoginVerifyingOtpCopyWithImpl(this._self, this._then);

  final LoginVerifyingOtp _self;
  final $Res Function(LoginVerifyingOtp) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(LoginVerifyingOtp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginLoggedIn implements LoginState {
  const LoginLoggedIn({required this.email});
  

 final  String email;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginLoggedInCopyWith<LoginLoggedIn> get copyWith => _$LoginLoggedInCopyWithImpl<LoginLoggedIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoggedIn&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginState.loggedIn(email: $email)';
}


}

/// @nodoc
abstract mixin class $LoginLoggedInCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginLoggedInCopyWith(LoginLoggedIn value, $Res Function(LoginLoggedIn) _then) = _$LoginLoggedInCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$LoginLoggedInCopyWithImpl<$Res>
    implements $LoginLoggedInCopyWith<$Res> {
  _$LoginLoggedInCopyWithImpl(this._self, this._then);

  final LoginLoggedIn _self;
  final $Res Function(LoginLoggedIn) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(LoginLoggedIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginError implements LoginState {
  const LoginError(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginErrorCopyWith<LoginError> get copyWith => _$LoginErrorCopyWithImpl<LoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginErrorCopyWith(LoginError value, $Res Function(LoginError) _then) = _$LoginErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginErrorCopyWithImpl<$Res>
    implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(this._self, this._then);

  final LoginError _self;
  final $Res Function(LoginError) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
