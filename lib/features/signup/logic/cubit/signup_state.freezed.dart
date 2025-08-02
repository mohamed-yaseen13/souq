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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SignupLoading value)?  loading,TResult Function( SignupSuccess value)?  success,TResult Function( SignupEmailAlreadyExist value)?  emailAlreadyExist,TResult Function( SignupError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SignupLoading() when loading != null:
return loading(_that);case SignupSuccess() when success != null:
return success(_that);case SignupEmailAlreadyExist() when emailAlreadyExist != null:
return emailAlreadyExist(_that);case SignupError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SignupLoading value)  loading,required TResult Function( SignupSuccess value)  success,required TResult Function( SignupEmailAlreadyExist value)  emailAlreadyExist,required TResult Function( SignupError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SignupLoading():
return loading(_that);case SignupSuccess():
return success(_that);case SignupEmailAlreadyExist():
return emailAlreadyExist(_that);case SignupError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SignupLoading value)?  loading,TResult? Function( SignupSuccess value)?  success,TResult? Function( SignupEmailAlreadyExist value)?  emailAlreadyExist,TResult? Function( SignupError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SignupLoading() when loading != null:
return loading(_that);case SignupSuccess() when success != null:
return success(_that);case SignupEmailAlreadyExist() when emailAlreadyExist != null:
return emailAlreadyExist(_that);case SignupError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  emailAlreadyExist,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SignupLoading() when loading != null:
return loading();case SignupSuccess() when success != null:
return success();case SignupEmailAlreadyExist() when emailAlreadyExist != null:
return emailAlreadyExist();case SignupError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  emailAlreadyExist,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SignupLoading():
return loading();case SignupSuccess():
return success();case SignupEmailAlreadyExist():
return emailAlreadyExist();case SignupError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  emailAlreadyExist,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SignupLoading() when loading != null:
return loading();case SignupSuccess() when success != null:
return success();case SignupEmailAlreadyExist() when emailAlreadyExist != null:
return emailAlreadyExist();case SignupError() when error != null:
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


class SignupLoading implements SignupState {
  const SignupLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.loading()';
}


}




/// @nodoc


class SignupSuccess implements SignupState {
  const SignupSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.success()';
}


}




/// @nodoc


class SignupEmailAlreadyExist implements SignupState {
  const SignupEmailAlreadyExist();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEmailAlreadyExist);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.emailAlreadyExist()';
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
