import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is Timestamp) return json;
    if (json is Map && json.containsKey('_seconds')) {
      // If Firestore returns raw map
      return Timestamp(json['_seconds'] as int, json['_nanoseconds'] as int);
    }
    throw ArgumentError('Invalid Timestamp format: $json');
  }

  @override
  Object toJson(Timestamp object) => object;
}

class FileConverter implements JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    return File(json);
  }

  @override
  String? toJson(File? object) {
    return object?.path;
  }
}
