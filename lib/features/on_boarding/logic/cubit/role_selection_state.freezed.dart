// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoleSelectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleSelectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoleSelectionState()';
}


}

/// @nodoc
class $RoleSelectionStateCopyWith<$Res>  {
$RoleSelectionStateCopyWith(RoleSelectionState _, $Res Function(RoleSelectionState) __);
}


/// Adds pattern-matching-related methods to [RoleSelectionState].
extension RoleSelectionStatePatterns on RoleSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( RoleSelectionLoading value)?  loading,TResult Function( RoleSelectionSuccess value)?  success,TResult Function( RoleSelectionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case RoleSelectionLoading() when loading != null:
return loading(_that);case RoleSelectionSuccess() when success != null:
return success(_that);case RoleSelectionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( RoleSelectionLoading value)  loading,required TResult Function( RoleSelectionSuccess value)  success,required TResult Function( RoleSelectionError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case RoleSelectionLoading():
return loading(_that);case RoleSelectionSuccess():
return success(_that);case RoleSelectionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( RoleSelectionLoading value)?  loading,TResult? Function( RoleSelectionSuccess value)?  success,TResult? Function( RoleSelectionError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case RoleSelectionLoading() when loading != null:
return loading(_that);case RoleSelectionSuccess() when success != null:
return success(_that);case RoleSelectionError() when error != null:
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
return initial();case RoleSelectionLoading() when loading != null:
return loading();case RoleSelectionSuccess() when success != null:
return success();case RoleSelectionError() when error != null:
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
return initial();case RoleSelectionLoading():
return loading();case RoleSelectionSuccess():
return success();case RoleSelectionError():
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
return initial();case RoleSelectionLoading() when loading != null:
return loading();case RoleSelectionSuccess() when success != null:
return success();case RoleSelectionError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RoleSelectionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoleSelectionState.initial()';
}


}




/// @nodoc


class RoleSelectionLoading implements RoleSelectionState {
  const RoleSelectionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleSelectionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoleSelectionState.loading()';
}


}




/// @nodoc


class RoleSelectionSuccess implements RoleSelectionState {
  const RoleSelectionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleSelectionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoleSelectionState.success()';
}


}




/// @nodoc


class RoleSelectionError implements RoleSelectionState {
  const RoleSelectionError(this.message);
  

 final  String message;

/// Create a copy of RoleSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleSelectionErrorCopyWith<RoleSelectionError> get copyWith => _$RoleSelectionErrorCopyWithImpl<RoleSelectionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleSelectionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RoleSelectionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RoleSelectionErrorCopyWith<$Res> implements $RoleSelectionStateCopyWith<$Res> {
  factory $RoleSelectionErrorCopyWith(RoleSelectionError value, $Res Function(RoleSelectionError) _then) = _$RoleSelectionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RoleSelectionErrorCopyWithImpl<$Res>
    implements $RoleSelectionErrorCopyWith<$Res> {
  _$RoleSelectionErrorCopyWithImpl(this._self, this._then);

  final RoleSelectionError _self;
  final $Res Function(RoleSelectionError) _then;

/// Create a copy of RoleSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RoleSelectionError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
