// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneState()';
}


}

/// @nodoc
class $PhoneStateCopyWith<$Res>  {
$PhoneStateCopyWith(PhoneState _, $Res Function(PhoneState) __);
}


/// Adds pattern-matching-related methods to [PhoneState].
extension PhoneStatePatterns on PhoneState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PhoneLoading value)?  loading,TResult Function( PhoneSuccess value)?  success,TResult Function( PhoneError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PhoneLoading() when loading != null:
return loading(_that);case PhoneSuccess() when success != null:
return success(_that);case PhoneError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PhoneLoading value)  loading,required TResult Function( PhoneSuccess value)  success,required TResult Function( PhoneError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PhoneLoading():
return loading(_that);case PhoneSuccess():
return success(_that);case PhoneError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PhoneLoading value)?  loading,TResult? Function( PhoneSuccess value)?  success,TResult? Function( PhoneError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PhoneLoading() when loading != null:
return loading(_that);case PhoneSuccess() when success != null:
return success(_that);case PhoneError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PhoneLoading() when loading != null:
return loading();case PhoneSuccess() when success != null:
return success();case PhoneError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PhoneLoading():
return loading();case PhoneSuccess():
return success();case PhoneError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PhoneLoading() when loading != null:
return loading();case PhoneSuccess() when success != null:
return success();case PhoneError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PhoneState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneState.initial()';
}


}




/// @nodoc


class PhoneLoading implements PhoneState {
  const PhoneLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneState.loading()';
}


}




/// @nodoc


class PhoneSuccess implements PhoneState {
  const PhoneSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PhoneState.success()';
}


}




/// @nodoc


class PhoneError implements PhoneState {
  const PhoneError(this.message);
  

 final  String message;

/// Create a copy of PhoneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneErrorCopyWith<PhoneError> get copyWith => _$PhoneErrorCopyWithImpl<PhoneError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PhoneState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PhoneErrorCopyWith<$Res> implements $PhoneStateCopyWith<$Res> {
  factory $PhoneErrorCopyWith(PhoneError value, $Res Function(PhoneError) _then) = _$PhoneErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PhoneErrorCopyWithImpl<$Res>
    implements $PhoneErrorCopyWith<$Res> {
  _$PhoneErrorCopyWithImpl(this._self, this._then);

  final PhoneError _self;
  final $Res Function(PhoneError) _then;

/// Create a copy of PhoneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PhoneError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
