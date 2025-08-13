// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_and_name_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PictureAndNameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PictureAndNameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PictureAndNameState()';
}


}

/// @nodoc
class $PictureAndNameStateCopyWith<$Res>  {
$PictureAndNameStateCopyWith(PictureAndNameState _, $Res Function(PictureAndNameState) __);
}


/// Adds pattern-matching-related methods to [PictureAndNameState].
extension PictureAndNameStatePatterns on PictureAndNameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PictureAndNameLoading value)?  loading,TResult Function( PictureAndNameSuccess value)?  success,TResult Function( PictureAndNameError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PictureAndNameLoading() when loading != null:
return loading(_that);case PictureAndNameSuccess() when success != null:
return success(_that);case PictureAndNameError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PictureAndNameLoading value)  loading,required TResult Function( PictureAndNameSuccess value)  success,required TResult Function( PictureAndNameError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PictureAndNameLoading():
return loading(_that);case PictureAndNameSuccess():
return success(_that);case PictureAndNameError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PictureAndNameLoading value)?  loading,TResult? Function( PictureAndNameSuccess value)?  success,TResult? Function( PictureAndNameError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PictureAndNameLoading() when loading != null:
return loading(_that);case PictureAndNameSuccess() when success != null:
return success(_that);case PictureAndNameError() when error != null:
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
return initial();case PictureAndNameLoading() when loading != null:
return loading();case PictureAndNameSuccess() when success != null:
return success();case PictureAndNameError() when error != null:
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
return initial();case PictureAndNameLoading():
return loading();case PictureAndNameSuccess():
return success();case PictureAndNameError():
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
return initial();case PictureAndNameLoading() when loading != null:
return loading();case PictureAndNameSuccess() when success != null:
return success();case PictureAndNameError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PictureAndNameState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PictureAndNameState.initial()';
}


}




/// @nodoc


class PictureAndNameLoading implements PictureAndNameState {
  const PictureAndNameLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PictureAndNameLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PictureAndNameState.loading()';
}


}




/// @nodoc


class PictureAndNameSuccess implements PictureAndNameState {
  const PictureAndNameSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PictureAndNameSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PictureAndNameState.success()';
}


}




/// @nodoc


class PictureAndNameError implements PictureAndNameState {
  const PictureAndNameError(this.message);
  

 final  String message;

/// Create a copy of PictureAndNameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PictureAndNameErrorCopyWith<PictureAndNameError> get copyWith => _$PictureAndNameErrorCopyWithImpl<PictureAndNameError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PictureAndNameError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PictureAndNameState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PictureAndNameErrorCopyWith<$Res> implements $PictureAndNameStateCopyWith<$Res> {
  factory $PictureAndNameErrorCopyWith(PictureAndNameError value, $Res Function(PictureAndNameError) _then) = _$PictureAndNameErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PictureAndNameErrorCopyWithImpl<$Res>
    implements $PictureAndNameErrorCopyWith<$Res> {
  _$PictureAndNameErrorCopyWithImpl(this._self, this._then);

  final PictureAndNameError _self;
  final $Res Function(PictureAndNameError) _then;

/// Create a copy of PictureAndNameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PictureAndNameError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
